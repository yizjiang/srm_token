require "net/http"
require 'time'
require 'rest-client'
require 'json'

OAUTH_URL = 'http://oauth.ljiang.dev.cloud.vitrue.com/'

module SrmToken
  class Request
    def get_token
      response = RestClient.post OAUTH_URL + 'oauth/token', {
        grant_type: 'client_credentials',
        client_id: CLIENT_ID,
        client_secret: CLIENT_SECRET
      }
      JSON.parse(response)["access_token"]
    end

    def validate_token (token)
      begin
        uri = URI.parse(OAUTH_URL + 'api/validate_token')
        uri.query = URI.encode_www_form({})
        http = Net::HTTP.new(uri.host, uri.port)
        http.use_ssl = false

        request = Net::HTTP::Post.new(uri.request_uri)
        request.add_field 'X-Vitrue-Client-Id', "#{CLIENT_ID}"
        request.add_field 'AUTHORIZATION', "Bearer #{token}"
        response = http.request(request)
      rescue
        p 'request failed'
      ensure
        response
      end
    end
  end
end