module Fappu
  class Comment
    attr_accessor :id, :attached_id, :poster, :poster_url, :reputation,
      :text, :date

    def initialize args
      comment_args = comment_parameters(args)
      comment_args.each do |k,v|
        instance_variable_set("@#{k}",v) unless v.nil?
      end
    end

    private

    def comment_parameters(comment)
      params = {
        title: comment["comment_id"],
        attached_id: comment["comment_attached_id"],
        poster: comment["comment_poster"],
        poster_url: comment["comment_poster_url"],
        reputation: comment["comment_reputation"],
        body: comment["comment_text"],
        date: comment["comment_date"]
      }
    end
  end
end
