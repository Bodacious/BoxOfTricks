require "spec_helper"

describe BoxOfTricks do
  
  it "should add a module within the Rails app" do
    Rails.application.included_modules.should include(:BoxOfTricks)
  end
  
end