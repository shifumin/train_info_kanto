# Traininfo Kanto

[![Gem Version](https://badge.fury.io/rb/traininfo_kanto.svg)](https://badge.fury.io/rb/traininfo_kanto)

Gem for getting train information in the Kanto area.  
traininfo_kanto scrapes [Yahoo!路線情報](https://transit.yahoo.co.jp/traininfo/area/4/)  

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'traininfo_kanto'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install traininfo_kanto

## Usage
### TraininfoKanto.get

```ruby
$ irb
irb(main):001:0> require 'traininfo_kanto'
irb(main):002:0> TraininfoKanto.get(['山手線', '京浜東北線'], url: true)
=> ["山手線は平常運転です。", "京浜東北線は列車遅延があります。\n宇都宮線内でドア点検を行った影響で、一部列車に遅れが出ています。 （9月21日 16時45分掲載）\nhttps://transit.yahoo.co.jp/traininfo/detail/22/0/"]
```

#### Options

The defaults below are all false.  

- `url` : Whether to add a URL in cases other than "平常運転".

### CLI

Or traininfo_kanto can also used as a command.

```bash
$ traininfo_kanto get 山手線 京浜東北線
山手線は平常運転です。
京浜東北線は列車遅延があります。
宇都宮線内でドア点検を行った影響で、一部列車に遅れが出ています。 （9月21日 16時45分掲載）
```

## Supported routes

- JR東日本
  - 山手線
  - 京浜東北線
  - 横須賀線
  - 中央線
  - 中央総武線
  - 総武快速線
  - 内房線
  - 外房線
  - 京葉線
- 東京メトロ
  - 銀座線
  - 丸ノ内線
  - 日比谷線
  - 東西線
  - 千代田線
  - 有楽町線
  - 半蔵門線
  - 南北線
  - 副都心線
- 都営地下鉄
  - 浅草線
  - 三田線
  - 新宿線
  - 大江戸線
- 小湊鉄道
  - 小湊鉄道線

## How to use CLI with docker

[shifumin/traininfo_kanto - Docker Hub](https://hub.docker.com/r/shifumin/traininfo_kanto/)  

```bash
docker run --rm shifumin/traininfo_kanto get 山手線 中央線
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/traininfo_kanto. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the TraininfoKanto project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/traininfo_kanto/blob/master/CODE_OF_CONDUCT.md).
