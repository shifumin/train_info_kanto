# Train Info Kanto

Gem for getting train information in the Kanto area.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'train_info_kanto'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install train_info_kanto

## Usage

```ruby
irb(main):001:0> require 'train_info_kanto'
irb(main):002:0> TrainInfoKanto.get(['山手線', '京浜東北線'])
=> ["山手線は平常運転です。", "京浜東北線は列車遅延があります。\n宇都宮線内でドア点検を行った影響で、一部列車に遅れが出ています。 （9月21日 16時45分掲載）\nhttps://transit.yahoo.co.jp/traininfo/detail/22/0/"]
```

## Supported routes

- JR
  - 山手線
  - 京浜東北線
  - 横須賀線
  - 中央線
  - 中央総武線
  - 総武快速線
  - 内房線
  - 京葉線
- 東京メトロ
  - 銀座線
  - 千代田線
- 小湊鉄道
  - 小湊鉄道線

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/train_info_kanto. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the TrainInfoKanto project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/train_info_kanto/blob/master/CODE_OF_CONDUCT.md).
