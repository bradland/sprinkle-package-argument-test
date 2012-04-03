# -- Server configuration
# Set this to the IP of your local build virtual machine
role :app,  '10.0.38.200',    :primary => true # local build VM

# --- SSH connection configuration

# Root user
set  :user, 'root'
set  :use_sudo, false
set  :run_method, :run

default_run_options[:pty] = true
# default_run_options[:shell] = '/bin/bash'
default_run_options[:shell] = false # use false to NOT use a sub-shell, which works around a lot of env issues
