module Fappu
  module Search

    module_function
    URL = "https://api.fakku.net/manga"

    def self.tagged(tag)
      tag.downcase!
      url = "https://api.fakku.net/tags/#{tag}"
      response = JSON.parse( URI.parse(url).read )
      arr = response["content"]

      arr.collect do |manga|
        Fappu::Manga.new(manga_parameters(manga))
      end
    end

    def self.terms(search_terms)
      search_terms.downcase!
      search_terms = URI.encode(search_terms)
      url = "https://api.fakku.net/search/#{search_terms}"
      response = JSON.parse( URI.parse(url).read )
      arr = response["content"]

      arr.collect do |manga|
        Fappu::Manga.new(manga_parameters(manga))
      end
    end

    # Returns an array of the latest mangas as Manga instances
    def self.latest
      response = JSON.parse( URI.parse("https://api.fakku.net/manga").read )
      arr = response["latest"]

      arr.collect do |manga|
        Fappu::Manga.new(manga_parameters(manga))
      end
    end

    # Returns an array of the most favorite'd mangas as Manga instances
    def self.favorites
      response = JSON.parse( URI.parse("https://api.fakku.net/manga").read )
      arr = response["favorites"]

      arr.collect do |manga|
        Fappu::Manga.new(manga_parameters(manga))
      end
    end

    # Returns an array of the most popular mangas as Manga instances
    def self.popular
      response = JSON.parse( URI.parse("https://api.fakku.net/manga").read )
      arr = response["popular"]

      arr.collect do |manga|
        Fappu::Manga.new(manga_parameters(manga))
      end
    end

    # Returns an array of the most controversial mangas as Manga instances
    def self.controversial
      response = JSON.parse( URI.parse("https://api.fakku.net/manga").read )
      arr = response["controversial"]

      arr.collect do |manga|
        Fappu::Manga.new(manga_parameters(manga))
      end
    end

    # Returns an array of related mangas
    def self.related(manga)
      response =JSON.parse ( URI.parse(manga.url + "/related").read )
      arr = response["related"]

      arr.collect do |m|
        Fappu::Manga.new(manga_parameters(m))
      end
    end

    private

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
        page_count: manga["content_pages"],
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
  end
end
