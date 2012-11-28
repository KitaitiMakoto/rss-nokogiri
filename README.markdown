RSS NokogiriParser
==================

This gem enables standard bundled RSS library to use [Nokogiri][nokogiri] as parser.

[nokogiri]: http://nokogiri.org/

Installation
------------

Add this line to your application's Gemfile:

    gem 'rss-nokogiri'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install rss-nokogiri

Usage
-----

Require this library:

    require 'rss/nokogiri'

Now `RSS::Parser.default_parser` have become `RSS::NokogiriParser` instead of the default `RSS::REXMLParser`.

If you want to use other parsers, call `RSS::Parser.default_parser=`. Available parsers can be seen in `RSS::AVAILABLE_PARSERS`.

Todo
----

* Handling processing instruction.

Contributing
------------

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Merge Request

License
-------

This library is distributed under the Ruby's license. See the file COPYING for the term.
