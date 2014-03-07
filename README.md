#News Engine

News Engine provides a models and active admin templates to your app.

##Configuration

Configure the News engine with an initializer named `news.rb`

###Available Configuration

* `engine_routing`, Set to false if you want to use your own routes. Default: `true`
* `engine_active_admin`, Set to false if you want to use your own active admin templates. Default: `true`
* `news_author_sweeper`, your cache sweeper for the authors, is used in the active admin template. Default: `false`
* `news_item_sweeper`, your cache sweeper for the news stories, is used in the active admin template. Default: `false`
* `news_tag_sweeper`, your cache sweeper for the news tags, is used in the active admin template. Default: `false`
* `per_page`, News stories per page
* `image_sizes`, Paperclip image [post processing](https://github.com/thoughtbot/paperclip#post-processing) styles. Default: `{ :main => "200x200#", :secondary => "100x100#", :thumb => "70x70#" }`

##Credits

Developed and maintained by [Made](http://www.madetech.co.uk?ref=github&repo=cnews_engine).

[![made](https://s3-eu-west-1.amazonaws.com/made-assets/googleapps/google-apps.png)](http://www.madetech.co.uk?ref=github&repo=cnews_engine)

Key contributions:

* [Chris Blackburn](https://github.com/chrisblackburn)
* [Rory MacDonald](https://github.com/RoryMacDonald)
* [Seb Ashton](https://github.com/SebAshton)

##License

Licensed under [New BSD License](http://opensource.org/licenses/BSD-3-Clause)
