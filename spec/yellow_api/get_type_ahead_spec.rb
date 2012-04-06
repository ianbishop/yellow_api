require 'helper'

describe YellowApi::Client::GetTypeAhead do

  before do
    @client = YellowApi::Client.new(:apikey => "a1s2d3f4g5h6j7k8l9k6j5j4")
  end

  describe ".get_type_ahead" do
    before do
      WebMock.allow_net_connect!

      stub_get("GetTypeAhead/?apikey=a1s2d3f4g5h6j7k8l9k6j5j4&text=au&field=WHAT&UID=1").
        to_return(:status => 200, :body => fixture("get_type_ahead.json"))
    end

    it "should return suggestions" do
      wait 2 do
        suggestions = @client.get_type_ahead("au", :what)

        a_get("GetTypeAhead/?apikey=a1s2d3f4g5h6j7k8l9k6j5j4&text=au&field=WHAT&lang=en&fmt=JSON&UID=#{@client.uid}").
        should have_been_made

        suggestions.length.should > 0
      end
    end
  end
end
