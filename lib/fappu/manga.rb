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
        self.new(title: manga["content_name"],
                 url: manga["content_url"],
                 description: manga["content_description"],
                 language: manga["content_language"],
                 category: manga["content_category"],
                 date: manga["content_date"],
                 filesize: manga["content_filesize"],
                 favorites: manga["content_favorites"],
                 comments: manga["content_comments"],
                 pages: manga["content_pages"],
                 poster: manga["content_poster"],
                 poster_url: manga["content_poster_url"],
                 tags: manga["content_tags"],
                 translators: manga["content_translators"],
                 series: manga["content_series"],
                 artists: manga["content_artists"],
                 images: manga["content_images"],
                 tags: manga["content_tags"]

                )
      end
    end
  end
end
