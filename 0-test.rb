# AppConfig is a singleton used to store config state
require './lib/app-config.rb'
AppConfig.instance.set(:bukkit)

# Load all our packages
Dir[ File.dirname(__FILE__) + '/packages/*.rb'].each { |file| require file }

policy :test, :roles => :app do

  # Test packages here
  requires :stub

end

deployment do

  delivery :capistrano

  source do
    prefix   '/usr/local'           # where all source packages will be configured to install
    archives '/usr/local/sources'   # where all source packages will be downloaded to
    builds   '/usr/local/build'     # where all source packages will be built
  end

end
