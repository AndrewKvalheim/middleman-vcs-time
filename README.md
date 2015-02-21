# middleman-vcs-time

[![Gem Version][gem-version-badge]][gem-version]
[![Build Status][build-status-badge]][build-status]

Provides means to look up the last-modified times of [Middleman][] sitemap
resources according to version control. Supports Git with a fallback to
filesystem metadata.

## Installation

Add to your `Gemfile`:

```ruby
gem 'middleman-vcs-time'
```

and run `bundle install`.

## Usage

Activate the extension in `config.rb`:

```ruby
activate :vcs_time
```

Get the modification time of e.g. the current page:

```ruby
current_page.mtime # => 2014-01-20 17:31:50 -0800
```


  [build-status]: https://travis-ci.org/AndrewKvalheim/middleman-vcs-time
  [build-status-badge]: https://travis-ci.org/AndrewKvalheim/middleman-vcs-time.svg?branch=master
  [gem-version]: https://badge.fury.io/rb/middleman-vcs-time
  [gem-version-badge]: https://badge.fury.io/rb/middleman-vcs-time.svg
  [middleman]: http://middlemanapp.com/
