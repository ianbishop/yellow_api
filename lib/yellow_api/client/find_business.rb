module YellowApi
  class Client
    module FindBusiness
      def find_business(options={})
        get('FindBusiness/', options)
      end
    end
  end
end
