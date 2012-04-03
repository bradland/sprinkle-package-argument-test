package :stub do
  description "This package does nothing (intentionally); good for testing"

  information = AppConfig.instance.get

  push_text information[:saying], 'myfile.txt'

end
