package :stub do
  description "This package does nothing (intentionally); good for testing"

  # Uncomment one of the declarations below to test

  # This delcaration will fail because 'information' is nil.
  push_text information, 'myfile.txt'
  
  # This declaratino will create a file named myfile.txt with 
  # the contents 'test' in your homedir on the remote system.
  # Use this declaration to test your deploy setup.
  # push_text 'test', 'myfile.txt'

end
