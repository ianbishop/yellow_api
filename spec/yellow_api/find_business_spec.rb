require 'helper'

describe YellowApi::Client::FindBusiness do

  before do
    @client = YellowApi::Client.new(:apikey => "a1s2d3f4g5h6j7k8l9k6j5j4")
  end

  describe ".find_business" do
    before do
      WebMock.allow_net_connect!

      stub_get("FindBusiness/?what=barber&where=Canada&fmt=JSON&pgLen=10&apikey=a1s2d3f4g5h6j7k8l9k6j5j4&UID=127.0.0.1").
        to_return(:status => 200, :body => fixture("find_business.json"))
    end

    it "should return the correct number of businesses" do
      wait 5 do
        business = @client.find_business("barber", "Canada", { :pgLen => 1 })
        a_get("FindBusiness/?what=barber&where=Canada&fmt=JSON&pgLen=1&apikey=a1s2d3f4g5h6j7k8l9k6j5j4&UID=#{@client.uid}").
          should have_been_made
        business.summary.listingsPerPage == 1
      end
    end
  end
end
