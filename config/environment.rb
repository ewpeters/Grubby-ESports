# Be sure to restart your server when you modify this file

# Specifies gem version of Rails to use when vendor/rails is not present
RAILS_GEM_VERSION = '2.3.8' unless defined? RAILS_GEM_VERSION

# Bootstrap the Rails environment, frameworks, and default configuration
require 'thread'
require 'rubygems'
require File.join(File.dirname(__FILE__), 'boot')

PER_PAGE = 25

# Hour:Minute:Second[AM|PM]
# Change this if you want to change the default formatting of time.
TIME_DISPLAY = "%I:%M:%S%p"

# Day Month Year
# Change this if you want to change the default formatting of years.
DATE_DISPLAY = "%d %B %Y"

# Change this to point at a different themes directory. In jruby-rack Rails.public_path is not yet set.
THEMES_DIRECTORY = Proc.new { File.join(Rails.public_path, "themes") }


# Set this to false if you're integrating rboard into another app.
# This determines if rake db:create:all is ran when running the install script.
STANDALONE = false
SEARCHING = false

CONFIG = Rails::Initializer.run do |config|
  
  config.gem 'authlogic', :version => '2.1.6'
  config.gem 'acts-as-taggable-on', :version => '2.0.6'
  config.gem 'by_star', :version => '0.6.3'
  config.gem 'chronic'
  config.gem 'coderay'
  config.gem 'i18n'
  # config.gem 'dotiw'
  config.gem 'escape_utils', :version => '0.2.3'
  config.gem 'haml', :version => "2.2.21"
  config.gem 'highline'
  config.gem 'htmlentities', :version => '4.3.0'
  config.gem 'jammit', :version => '0.6.0'
  config.gem 'oauth2', :version => '0.4.1'
  config.gem 'paperclip', :version => '2.3.1.1'
  config.gem 'rack-raw-upload', :lib => "rack/raw_upload"
  config.gem 'rbbcode', :version => '0.1.11'
  config.gem 'RedCloth'
  config.gem 'rmagick', :lib => "RMagick2",  :version => '2.13.1'
  config.gem "sqlite3-ruby", :lib => "sqlite3", :version => "1.3.1"
  config.gem 'exceptional' 
  # config.gem 'thinking-sphinx', :lib => 'thinking_sphinx'
  config.gem 'will_paginate'
  config.gem 'delayed_job', :version => '~>2.0.4'

  # lol actionwebservice
  # lol activeresource
  config.frameworks -= [:action_web_service, :activeresource]

  config.action_controller.session = { :session_key => "rboard_secret", :secret => "this is a super secret passphrase that protects rboard and you should probably change it" }

  config.active_record.default_timezone = :utc
  config.time_zone = "UTC"
 
  config.middleware.use 'Rack::RawUpload', :paths => ['/admin/albums/uploader', '/admin/features/uploader', '/admin/tickers/uploader']
  config.middleware.use "OmniAuth::Builder", provider :facebook, "159271560800336", "f51da2f99537b91b19ed42d544d40efb", {:client_options => {:ssl => {:ca_path => "/etc/ssl/certs"}}}
  
  config.active_record.observers = [:user_observer]
end
# Change this if your locale is not english
I18n.default_locale = "en"
require 'class_ext'
require 'array_ext'
require 'themes_loader'
Dir.glob("#{RAILS_ROOT}/lib/rboard/*") { |f| require f }

require 'find'
themes = []
Find.find(RAILS_ROOT + "/public/themes") do |path|
  themes << [path, path] if File.directory?(path)
  Find.prune
end

# Needs to be set for paperclip to find the identify command with Passenger.
begin
  require 'paperclip'
  Paperclip.options[:command_path] = "/usr/local/bin"
rescue LoadError
end


# require 'sass'
# Sass::Plugin.options[:template_location] = 'stylesheets/sass'
# Sass::Plugin.options[:always_update] = true


  # def puts str
  #   super caller.first if caller.first.index("shoulda.rb") == -1
  #   super str
  # end
  # 
  # def p obj
  #   puts caller.first
  #   super obj
  # end
