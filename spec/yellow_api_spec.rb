require 'helper'

describe YellowApi do
  describe ".new" do
    it "should return a YellowApi::Client" do
      YellowApi.new.should be_a YellowApi::Client
    end
  end
end
