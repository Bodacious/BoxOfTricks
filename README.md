# Box of Tricks

A selection of Ruby on Rails modules commonly used by ["Gavin Morrice"][http://gavinmorrice.com]

## [Search Engine Pinger][https://github.com/GavinM/BoxOfTricks/blob/master/search_engine_pinger.rb]

This ActiveRecord observer can be used to observe your models for any changes and, when required, will PING 'The Big 4' search engines to let them know your sitemap has been updated.

To get this working, all you need is an XML sitemap feed with a route helper named "sitemap_url". Then, all you have to do is add the name of the model(s) you want to observe to the observe method and restart your app.

