#!/usr/bin/env ruby

require "feedbag"
require "feedzirra"

feed_urls = Feedbag.find "http://xoyip.hatenablog.com/" # このブログ
p feed_urls.first # => "http://xoyip.hatenablog.com/feed"

feed = Feedzirra::Feed.fetch_and_parse(feed_urls.first)

p feed.title          # => "PILOG"
p feed.url            # => "http://xoyip.hatenablog.com/"
p feed.feed_url       # => "http://xoyip.hatenablog.com/feed"
p feed.etag           # => "f6ce826cbbd07e222b6cee445fc981f730ad0693"
p feed.last_modified  # => 2014-01-15 11:47:34 UTC
p feed.entries.count  # => 7

exit

# in another process 
feed = Feedzirra::Parser::RSS.new
feed.feed_url = "http://xoyip.hatenablog.com/"
feed.etag = "f6ce826cbbd07e222b6cee445fc981f730ad0693" # いらないかも
feed.last_modified = DateTime.parse("2014-01-15 11:47:34 UTC")
last_entry = Feedzirra::Parser::RSSEntry.new
last_entry.url = "取得済みの記事の中で最も新しいのURLを入れておく"
feed.entries = [last_entry]

Feedzirra::Feed.update(feed)

