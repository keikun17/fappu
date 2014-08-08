module Fappu
  class Manga

    URL = "https://api.fakku.net/manga"

    attr_accessor :title, :url, :description, :language, :category, :date, :filesize,
      :favorites, :comment_count, :pages, :poster, :poster_url, :tags, :translators,
      :series, :artists, :images, :tags


    def initialize args
      tags = args.delete(:tags)

      args.each do |k,v|
        instance_variable_set("@#{k}",v) unless v.nil?
      end

      set_tags(tags) if tags
    end

    # Returns an array of the latest mangas as Manga instances
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

    # Returns an array of the most popular mangas as Manga instances
    def self.popular
      response = JSON.parse( URI.parse(URL).read )
      arr = response["popular"]

      arr.collect do |manga|
        self.new(manga_parameters(manga))
      end
    end

    # Returns an array of the most controversial mangas as Manga instances
    def self.controversial
      response = JSON.parse( URI.parse(URL).read )
      arr = response["controversial"]

      arr.collect do |manga|
        self.new(manga_parameters(manga))
      end
    end

    def top_comments
      response = JSON.parse( URI.parse(comment_api_url + "/top").read )
      arr = response['comments']

      arr.collect do |comment|
        Fappu::Comment.new(comment)
      end
    end


    def comments(page = 1)
      response = JSON.parse( URI.parse(comment_api_url + "/page/#{page}").read )
      arr = response['comments']

      arr.collect do |comment|
        Fappu::Comment.new(comment)
      end
    end

    private

    def set_tags(tags)
      @tags = tags.collect do |tag|
        Fappu::Tag.new(name: tag['attribute'], url: tag['attribute_link'])
      end
    end

    # Removes the 'content' suffix for manga attributes from the json response
    def self.manga_parameters(manga)
      params = {
        title: manga["content_name"],
        url: manga["content_url"],
        description: manga["content_description"],
        language: manga["content_language"],
        category: manga["content_category"],
        date: manga["content_date"],
        filesize: manga["content_filesize"],
        favorites: manga["content_favorites"],
        comment_count: manga["content_comments"],
        pages: manga["content_pages"],
        poster: manga["content_poster"],
        poster_url: manga["content_poster_url"],
        tags: manga["content_tags"],
        translators: manga["content_translators"],
        series: manga["content_series"],
        artists: manga["content_artists"],
        images: manga["content_images"],
        tags: manga["content_tags"]
      }
    end

    def comment_api_url

      comment_url = URI(url)

      new_host = comment_url.host.split('.')
      new_host[0] = 'api'

      comment_url.host = new_host.join('.')
      comment_url.scheme = 'https'

      comment_url.path += "/comments"

      comment_url.to_s
    end

  end
end
