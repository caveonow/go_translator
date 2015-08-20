# GoTranslator <img src="https://travis-ci.org/hoangphanea/go_translator.svg" alt="Build Status" />

A simple and free google translator wrapper to translate from a language to another.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'go_translator'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install go_translator

## Usage

Require it in your project:

```ruby
require 'go_translate'
```

Example of using GoTranslate:

```ruby
GoTranslate.translate('hello', from: 'en', to: 'ja') # => "こんにちは"
```

Example of translating from detect language to another language

```ruby
GoTranslate.translate('hello', to: 'ja') # => "こんにちは"
```

## List of options

`:from` : Source language. Default: `:auto`

`:to` : Target language. Default: `:en`

`:in_encoding` : Source encoding. Default `'UTF-8'`

`:out_encoding` : Target encoding. Default `'UTF-8'`

Please refer [list of supported languages](https://cloud.google.com/translate/v2/using_rest#language-params) for more options.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release` to create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

1. Fork it ( https://github.com/hoangphanbk10/go_translator/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
