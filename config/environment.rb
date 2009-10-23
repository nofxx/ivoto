#
# iVoto
#
RAILS_GEM_VERSION = '2.3.4' unless defined? RAILS_GEM_VERSION
require File.join(File.dirname(__FILE__), 'boot')

Rails::Initializer.run do |config|

  config.gem 'pg'
  config.gem 'json'
  config.gem 'state_machine'
  config.gem 'bcrypt-ruby',     :lib => 'bcrypt'
  config.gem 'nofxx-money',     :lib => 'money'
  config.gem 'nofxx-symbolize', :lib => 'symbolize'
  config.gem 'nofxx-georuby',   :lib => 'geo_ruby', :version => '>=1.6.2'
  config.gem 'nofxx-postgis_adapter', :lib => 'postgis_adapter', :version => '>=0.7.0', :source => 'http://gems.github.com'
  config.gem 'binarylogic-authlogic', :lib => 'authlogic'
  config.gem 'mislav-will_paginate',  :lib => 'will_paginate'
  config.gem 'thoughtbot-paperclip' , :lib => 'paperclip'
  config.gem 'ShadowBelmolve-formtastic', :lib => 'formtastic', :version => '>=0.2.1'
  config.gem 'haml-edge', :lib => 'haml'
  # config.gem 'jnunemaker-httparty', :lib => false


  config.load_paths += %W( #{RAILS_ROOT}/app/lib )
  config.time_zone = 'UTC'
  config.i18n.load_path += Dir[File.join(RAILS_ROOT, 'lib', 'locales', '*.{rb,yml}')]
  config.i18n.default_locale = "pt"

  config.action_controller.session = {
    :session_key => '_farm_session',
    :secret      => 'e0cf2f7d4c16d093eae797689e21a61a9f77e3ed68108a110e9ea10feb8ba6eee9aac5fa9de7222a93ea1c271aebb6e2b94a8a96326b22e8114d629817e75d37'
  }
end
