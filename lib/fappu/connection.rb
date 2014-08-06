module Fappu
  class Connection

    attr_accessor :base_url, :title, :url, :documentation, :response, :body

    def initialize(settings={})
      @base_url = settings[:base_url] || "https://api.fakku.net/index"

      # @response =  RestClient.get @base_url
      @response = URI.parse(@base_url).read

      @body = JSON.parse @response
      @title = @response['title']
    end

    def base_url
      @base_url || "https://api.fakku.net"
    end

  end
end
