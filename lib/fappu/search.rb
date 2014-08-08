module Fappu
  class Search

    def self.tagged(tag)
      tag.downcase!
      url = "https://api.fakku.net/tags/#{tag}"
      response = JSON.parse( URI.parse(url).read )
      arr = response["content"]

      arr.collect do |manga|
        Fappu::Manga.new(manga_parameters(manga))
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
  end
end
