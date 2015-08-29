RSpec.configure do |config|
  # Mock by default
  config.before(:all) do
    Excon.defaults[:mock] = true
  end

  config.after(:each) do
    Excon.stubs.clear
  end
end