module Fappu
  class Manga

    URL = "https://api.fakku.net/manga"

    attr_accessor :title, :url, :description, :language, :category, :date, :filesize,
      :favorites, :comments, :pages, :poster, :poster_url, :tags, :translators,
      :series, :artists, :images, :tags



    def initialize args
      args.each do |k,v|
        instance_variable_set("@#{k}",v) unless v.nil?
      end
    end

    def self.latest
      response = JSON.parse( URI.parse(URL).read )
      arr = response["latest"]

      arr.collect do |manga|
        self.new(manga_parameters(manga))
      end
    end

    # Returns an array of the most favorite'd mangas as Manga instances
    def self.favorites
      response = JSON.parse( URI.parse(URL).read )
      arr = response["favorites"]

      arr.collect do |manga|
        self.new(manga_parameters(manga))
      end
    end
  end
end
