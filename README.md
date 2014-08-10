# Fappu

A gem that pulls data from api.fakku.net

Fakku's API docs can be found at [https://developers.fakku.net/documentation](https://developers.fakku.net/documentation)

## Usage


### Search

Search for mangas tagged by a specific `tagname`

    Fappu::Search.tagged(tag)             #ex. Fappu::Search.tagged('Netorare')

Search for Mangas by keywords

    Fappu::Search.terms(search_terms)     #ex. Fappu::Search.terms('Sword art online')

To get the latest manga

    Fappu::Search.latest

To get a list of the most favorited manga

    Fappu::Search.favorites

To get a list of the most popular/read manga

    Fappu::Search.popular

And to get the list of the most popular manga

    Fappu::manga.controversial


### Manga

Aside from their attributes, Manga instances respond to the following

 - top_comments
 - comments(page: page) # WIP
 - download # WIP
 - pages
 - related

### Tags

To get a list of available tags

    Fappu::Tag.list

### Contributing

1. Fork it ( https://github.com/[my-github-username]/fappu/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

---

[twitter/keikun17](https://www.twitter.com/keikun17)

Released under the \*whatever\* license.
