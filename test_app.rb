require 'minitest/autorun'
require 'rack/mock'
require 'json'
require_relative 'app'

class ApplicationTest < Minitest::Test
  def setup
    @client = Rack::MockRequest.new(Sinatra::Application)
  end

  def test_home_page
    response = @client.get('/')
    assert_equal 200, response.status
    assert_includes response['content-type'], 'text/html'
    assert_includes response.body, 'Ruby/Sinatra déployé avec ValaDeploy — ManualStrategy'
  end

  def test_health
    response = @client.get('/health')
    assert_equal 200, response.status
    assert_includes response['content-type'], 'application/json'
    assert_equal({ 'status' => 'ok', 'framework' => 'Sinatra', 'build' => 'manual' },
                 JSON.parse(response.body))
  end
end
