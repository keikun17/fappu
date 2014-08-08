module Fappu
  class Tag

    attr_accessor :name, :url
    URL = "https://api.fakku.net/tags"

    def initialize args
      args.each do |k,v|
        instance_variable_set("@#{k}",v) unless v.nil?
      end
    end

    def self.list
      response = JSON.parse( URI.parse(URL).read )
      arr = response["tags"]

      arr.collect do |tag|
        self.new(tag_parameters(tag))
      end
    end

    private

    def self.tag_parameters(tag)
      params = {
        name: tag["tag_name"],
        url: tag["tag_url"]
      }
    end


  end
end
