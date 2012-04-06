require 'helper'

describe YellowApi::Client::FindDealer do

  before do
    @client = YellowApi::Client.new(:apikey => "a1s2d3f4g5h6j7k8l9k6j5j4")
  end

  describe ".find_dealer" do
    before do
      WebMock.allow_net_connect!

      stub_get("http://api.yellowapi.com/FindDealer/?pid=6418182&fmt=JSON&apikey=a1s2d3f4g5h6j7k8l9k6j5j4&UID=1").
        to_return(:status => 200, :body => fixture("find_dealer.json"))
    end

    it "should return the correct parent business" do
      wait 5 do
        business = @client.find_dealer(6418182, {:pgLen => 1})
        a_get("FindDealer/?pid=6418182&apikey=a1s2d3f4g5h6j7k8l9k6j5j4&fmt=JSON&pgLen=1&UID=#{@client.uid}").
          should have_been_made
        business.listings.first.parentId == "6418182"
      end
    end
  end

end
