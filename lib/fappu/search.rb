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
      response = JSON.parse ( URI.parse(manga.base_api_url.to_s + "/related").read )
      arr = response["related"]

      arr.collect do |m|
        Fappu::Manga.new(manga_parameters(m))
      end
    end
    private

    # Removes the 'content' suffix for manga attributes from the json response
    def self.manga_parameters(raw_manga_params)
      params = {
        title: raw_manga_params["content_name"],
        url: raw_manga_params["content_url"],
        description: raw_manga_params["content_description"],
        language: raw_manga_params["content_language"],
        category: raw_manga_params["content_category"],
        date: raw_manga_params["content_date"],
        filesize: raw_manga_params["content_filesize"],
        favorites: raw_manga_params["content_favorites"],
        comment_count: raw_manga_params["content_comments"],
        page_count: raw_manga_params["content_pages"],
        poster: raw_manga_params["content_poster"],
        poster_url: raw_manga_params["content_poster_url"],
        tags: raw_manga_params["content_tags"],
        translators: raw_manga_params["content_translators"],
        series: raw_manga_params["content_series"],
        artists: raw_manga_params["content_artists"],
        images: raw_manga_params["content_images"],
        tags: raw_manga_params["content_tags"]
      }
    end
  end
end
