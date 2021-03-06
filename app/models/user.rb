require 'digest/sha1'
require 'logger'
class User < ActiveRecord::Base
  include Rboard::UserExtension
  include Rboard::Permissions

  after_create :create_activation_code
  validates_exclusion_of :id, :in => Group.no_ban_ids, :if => Proc.new {|user| user.ban_times > 0}, :message => "Cannot ban that user"
  validates_uniqueness_of :uid, :unless => Proc.new{|user| user.uid.blank?}, :message => "Facebook profile has already been used"
  # Authenticates a user by their login name and unencrypted password.  Returns the user or nil.
  def self.get_fb_user(uid, access_token)
    client = OAuth2::Client.new(
      '159271560800336',
      'f51da2f99537b91b19ed42d544d40efb',
      :site => 'https://graph.facebook.com',
      :parse_json => true,
      :ssl => {:ca_path => '/etc/ssl/certs'}
    )
    token = OAuth2::AccessToken.new(client, access_token)
    logger.info(uid)
    begin
      return token.get("/#{uid}")
    rescue
      return nil
    end
  end
  def self.authenticate(login, password)
    u = find_by_login(login) # need to get the salt
    u && u.authenticated?(password) && u.activated ? u : nil
  end
  
  def self.new_fb_user(uid, access_token)
    u = User.new
    fb_user = get_fb_user(uid, access_token)
    if fb_user
      u.uid = uid
      u.login = uid
      u.name_change = 1
      u.password = u.password_confirmation = uid
      u.display_name = fb_user['name']
    end
    
    return u
  end
  
  def self.fb_authenticate(uid, access_token)
    u = find_by_uid(uid)
    if u
     if get_fb_user(uid, access_token)
       return u
     else
       return nil
     end
    else
      return nil
    end
  end

  # Encrypts some data with the salt.
  def self.encrypt(password, salt)
    Digest::SHA1.hexdigest("--#{salt}--#{password}--")
  end

  # Encrypts the password with the user salt
  def encrypt(password)
    self.class.encrypt(password, salt)
  end

  def authenticated?(password)
    crypted_password == encrypt(password)
  end

  def remember_token?
    remember_token_expires_at && Time.now.utc < remember_token_expires_at
  end

  # These create and unset the fields required for remembering users between browser closes
  def remember_me
    self.remember_token_expires_at = 2.weeks.from_now.utc
    self.remember_token            = encrypt("#{email}--#{remember_token_expires_at}")
    save(:validate => false)
  end

  def forget_me
    self.remember_token_expires_at = nil
    self.remember_token            = nil
    save(:validate => false)
  end
  
  def avatar
    if self.rank
      "/images/#{self.rank}.png"
    else
      "/images/avatars/#{self.avatar_file}"
    end
  end

  def create_reset_code
    @reset = true
    self.attributes = {:reset_code => Digest::SHA1.hexdigest( Time.now.to_s.split(//).sort_by {rand}.join )}
    save(false)
  end
  
  def create_activation_code
    self.attributes = {:activation_code => Digest::SHA1.hexdigest( Time.now.to_s.split(//).sort_by {rand}.join )}
    save(false)
  end

  def recently_reset?
    @reset
  end

  def delete_reset_code
    self.attributes = {:reset_code => nil}
    save(false)
  end
  
  def can_see_staff_forum?
    permissions.first.can_see_staff_forums
  end

  protected
  def encrypt_password
    if new_record?
      self.salt = Digest::SHA1.hexdigest("--#{Time.now.to_s}--#{login}--")
      self.crypted_password = encrypt(password)
    end
  end

  def password_required?
    crypted_password.blank? || !password.blank?
  end
  
  
end
