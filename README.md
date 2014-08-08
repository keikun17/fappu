# Fappu

A gem that pulls data from api.fakku.net

Fakku's API docs can be found at [https://developers.fakku.net/documentation](https://developers.fakku.net/documentation)

## Usage


### Manga

To get the latest manga

    Fappu::Manga.latest

To get a list of the most favorited manga

    Fappu::Manga.favorites

To get a list of the most popular/read manga

    Fappu::Manga.popular

And to get the list of the most popular manga

    Fappu::manga.controversial

To get a list of mangas from a given tag (WIP)

    Fappu::Manga.tagged('tag-name')

To get details from a specific manga (WIP)

    Fappu::Manga.find(title: 'manga-title')

To search for Manga titles falling under a given term (WIP)

    Fappu::Manga.search('search term')


Manga instances respond to the following

 - top_comments
 - comments(page: page) # WIP
 - download # WIP
 - read # WIP
 - related # WIP

## Search

To get a list of available tags

    Fappu::Search.tagged(tag)             #ex. Fappu::Search.tagged('Netorare')
    Fappu::Search.terms(search_terms)     #ex. Fappu::Search.terms('Sword art online')

## Contributing

1. Fork it ( https://github.com/[my-github-username]/fappu/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

---

[twitter/keikun17](https://www.twitter.com/keikun17)

Released under the \*whatever\* license.
