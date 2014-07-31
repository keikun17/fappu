require 'json'
require 'faraday'

module Fappu
  class Connection

    attr_accessor :base_url, :title, :url, :documentation, :response, :body

    def initialize(settings={})
      @base_url = settings[:base_url] || "https://api.fakku.net/index"
      connection = Faraday.new(url: @base_url)

      @response = connection.get
      @body = JSON.parse @response.body
      @title = @response['title']
    end

    def base_url
      @base_url || "https://api.fakku.net"
    end

  end
end
