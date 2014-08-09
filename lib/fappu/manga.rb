module Fappu
  class Manga

    attr_accessor :title, :url, :description, :language, :category, :date, :filesize,
      :favorites, :comment_count, :page_count, :poster, :poster_url, :tags, :translators,
      :series, :artists, :images, :tags


    def initialize args
      tags = args.delete(:tags)

      args.each do |k,v|
        instance_variable_set("@#{k}",v) unless v.nil?
      end

      set_tags(tags) if tags
    end


    def top_comments
      response = JSON.parse( URI.parse(comment_api_url + "/top").read )
      arr = response['comments']

      arr.collect do |comment|
        Fappu::Comment.new(comment)
      end
    end


    # WIP : Wait for API to be fixed
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
