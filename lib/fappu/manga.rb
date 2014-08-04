require 'open-uri'
require 'json'

module Fappu
  class Manga

    URL = "https://api.fakku.net/manga"

    attr_accessor :title, :url, :description, :language, :category, :date, :filesize

    def initialize args
      args.each do |k,v|
        instance_variable_set("@#{k}",v) unless v.nil?
      end
    end

    def self.latest
      response = JSON.parse( URI.parse(URL).read )
      arr = response["latest"]

      arr.collect do |manga|
        self.new(title: manga["content_name"],
                 url: manga["content_url"],
                 description: manga["content_description"],
                 language: manga["content_language"],
                 category: manga["content_category"],
                 date: manga["content_date"],
                 filesize: manga["content_filesize"]
                )
      end
    end
  end
end
