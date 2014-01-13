if ENV["PLATFORM"] == "android"
  require 'calabash-android/abase'
  class IBasePage < Calabash::ABase
    ERROR = 'SYSTEM ERROR: method definition missing (android)'
  end
else
  require 'calabash-cucumber/ibase'
  class IBasePage < Calabash::IBase
    ERROR = 'SYSTEM ERROR: method definition missing (ios)'
  end
end