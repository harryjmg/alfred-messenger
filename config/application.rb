require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Alfred
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
	
	Dotenv::Railtie.load

    config.load_defaults 5.1
	config.paths.add File.join("app", "bot"), glob: File.join("**","*.rb")
	config.autoload_paths += Dir[Rails.root.join("app", "bot", "*")]
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
  end
end
