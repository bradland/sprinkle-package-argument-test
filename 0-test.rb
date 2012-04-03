require './lib/policy.rb'
require './helper.rb'

policy :test, :roles => :app do

  # Test packages here
  requires :stub, :information => 'This was passed as a 2nd argument to requires'

end

deployment do

  delivery :capistrano

  source do
    prefix   '/usr/local'           # where all source packages will be configured to install
    archives '/usr/local/sources'   # where all source packages will be downloaded to
    builds   '/usr/local/build'     # where all source packages will be built
  end

end
