require 'helper'

describe YellowApi::Client::GetBusinessDetails do

  before do
    @client = YellowApi::Client.new(:apikey => "a1s2d3f4g5h6j7k8l9k6j5j4")
  end

  describe ".get_business_details" do
    before do
      WebMock.allow_net_connect!

      stub_get("GetBusinessDetails/?prov=Ile-du-Prince-Edouard&city=Calgary&bus-name=Co-operators-The&listingId=6418182&fmt=JSON&apikey=a1s2d3f4g5h6j7k8l9k6j5j4&UID=1").
        to_return(:status => 200, :body => fixture("get_business_details.json"))
    end

    it "should return the correct business" do
      wait 2 do
        business = @client.get_business_details("Ile-du-Prince-Edouard", "Co-operators-The", 6418182, {:city => "Calgary"})
        
        a_get("GetBusinessDetails/?prov=Ile-du-Prince-Edouard&city=Calgary&bus-name=Co-operators-The&listingId=6418182&fmt=JSON&apikey=a1s2d3f4g5h6j7k8l9k6j5j4&UID=#{@client.uid}").should have_been_made
        
        business.id.should == "6418182"
      end
    end
  end
end
