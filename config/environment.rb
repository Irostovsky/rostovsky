# Be sure to restart your server when you modify this file

# Specifies gem version of Rails to use when vendor/rails is not present
RAILS_GEM_VERSION = '2.3.8' unless defined? RAILS_GEM_VERSION

# Bootstrap the Rails environment, frameworks, and default configuration
require File.join(File.dirname(__FILE__), 'boot')

Rails::Initializer.run do |config|
  config.time_zone = 'UTC'
  
  config.gem 'warden'
  config.gem 'russian'
  config.gem 'warden'
  config.gem 'devise'
  config.gem 'formtastic' 
  config.gem 'css_parser'
  config.gem 'validation_reflection'
  config.gem "nested_layouts", :source => "http://gemcutter.org"
  config.gem 'ryanb-acts-as-list', :lib => 'acts_as_list', :source => 'http://gems.github.com'
  config.gem 'paperclip', :version => '~> 2.3.3', :source => 'http://rubygems.org'
  config.gem 'RedCloth', :version => '~> 4.2.3', :source => 'http://rubygems.org'
  
  S3_BUCKET = 'rostovsky'
  S3_ROOT_FOLDER = 'production'
  
end