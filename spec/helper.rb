$:.unshift File.expand_path('..', __FILE__)
$:.unshift File.expand_path('../../lib', __FILE__)
require 'simplecov'
SimpleCov.start
require 'yellow_api'
require 'rspec'
require 'webmock/rspec'

# make sure that tests don't fail because of rate limits
# @see http://www.programmersparadox.com/2012/03/05/testing-api-integrations-in-rspec/
def wait(time, increment = 5, elapsed_time = 0, &block)
  begin
    yield
  rescue Exception => e
    if elapsed_time >= time
      raise e
    else
      sleep increment
      wait(time, increment, elapsed_time + increment, &block)
    end
  end
end

def a_delete(path)
  a_request(:delete, 'http://api.yellowapi.com/' + path)
end

def a_get(path)
  a_request(:get, 'http://api.yellowapi.com/' + path)
end

def a_post(path)
  a_request(:post, 'http://api.yellowapi.com/' + path)
end

def a_put(path)
  a_request(:put, 'http://api.yellowapi.com/' + path)
end

def stub_delete(path)
  stub_request(:delete, 'http://api.yellowapi.com/' + path)
end

def stub_get(path)
  stub_request(:get, 'http://api.yellowapi.com/' + path)
end

def stub_post(path)
  stub_request(:post, 'http://api.yellowapi.com/' + path)
end

def stub_put(path)
  stub_request(:put, 'http://api.yellowapi.com/' + path)
end

def fixture_path
  File.expand_path('../fixtures', __FILE__)
end

def fixture(file)
  File.new(fixture_path + '/' + file)
end
