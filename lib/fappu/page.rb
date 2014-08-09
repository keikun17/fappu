module Fappu
  class Page

    attr_accessor :thumbnail_url, :image_url, :page_number

    def initialize(args={})
      args.each do |k,v|
        instance_variable_set("@#{k}",v) unless v.nil?
      end
    end

    # Receies page has
    # ex. self.new_from_json({'1' => { thumb => 'xx', image => 'yy')}})
    #
    # Returns
    # #<Page @page_number: 1, @thumbnail_url: 'xx', @image_url: 'yy>
    def self.new_from_json(args)
      page = Page.new
      args.each do |k,v|
        page.page_number = k
        page.thumbnail_url = v["thumb"]
        page.image_url = v["image"]
      end
      page
    end

  end
end

