require 'digest/sha1'
class User < ActiveRecord::Base
  include Rboard::UserExtension
  include Rboard::Permissions

  after_create :create_activation_code
  # Authenticates a user by their login name and unencrypted password.  Returns the user or nil.
  def self.get_fb_user(uid, access_token)
    client = OAuth2::Client.new(
      '159271560800336',
      'f51da2f99537b91b19ed42d544d40efb',
      :site => 'https://graph.facebook.com',
      :parse_json => true
    )
    token = OAuth2::AccessToken.new(client, access_token)
    
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
  
  def self.fb_authenticate(uid, access_token)
    u = find_by_login(uid)
    if u
      get_fb_user(uid, access_token) ? u : nil
    else
      new_fb_user(uid, access_token)
    end
  end

  def self.new_fb_user(uid, access_token)
    fb_user = get_fb_user(uid, access_token)
    if fb_user
      password = rand(36**32).to_s(36)
      User.create(:login => uid,
                  :uid => uid,
                  :display_name => fb_user['first_name'],
                  :password => password,
                  :password_confirmation => password,
                  :activated => true
                  )
    else
      nil
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
    "/images/avatars/#{self.avatar_file}"
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
