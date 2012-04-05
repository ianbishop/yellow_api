require 'helper'

describe YellowApi::Client::FindBusiness do

  before do
    @client = YellowApi::Client.new
  end

  describe ".find_business" do
    before do
      WebMock.allow_net_connect!

      stub_get("FindBusiness/?what=barber&where=Canada&fmt=JSON&pgLen=10&apikey=a1s2d3f4g5h6j7k8l9k6j5j4&UID=127.0.0.1").
        to_return(:status => 200, :body => fixture("find_business.json"))
    end

    it "should return the correct business" do

      criteria = {
        :what => "barber",
        :where => "Canada",
        :fmt => "JSON",
        :pgLen => 1,
        :apikey => "a1s2d3f4g5h6j7k8l9k6j5j4",
        :UID => "fjklaefjkdsf"
      }

      business = @client.find_business(criteria)[:listings].first

      a_get("FindBusiness/?UID=fjklaefjkdsf&apikey=a1s2d3f4g5h6j7k8l9k6j5j4&fmt=JSON&pgLen=1&what=barber&where=Canada").should have_been_made
      
      business.id.should == "346760"
    end
  end
end
