require "nokogiri"
require 'open-uri'

module TrainInfoKanto
  class << self
    PAGES = {
      # Route: [Kanto page XPath table number, Kanto page XPath column number, detail page URL number]
      # JR東日本
      山手線:     [4, 2, 21],
      京浜東北線: [4, 3, 22],
      横須賀線:   [4, 6, 29],
      中央線:     [4, 12, 38],
      中央総武線: [4, 13, 40],
      総武快速線: [4, 30, 61],
      内房線:     [4, 32, 63],
      京葉線:     [4, 36, 69],
      # 東京メトロ
      銀座線:     [10, 2, 132],
      丸ノ内線:   [10, 3, 133],
      日比谷線:   [10, 4, 134],
      東西線:     [10, 5, 135],
      千代田線:   [10, 6, 136],
      有楽町線:   [10, 7, 137],
      半蔵門線:   [10, 8, 138],
      南北線:     [10, 9, 139],
      副都心線:   [10, 10, 540],
      # 都営地下鉄
      浅草線:     [18, 2, 128],
      三田線:     [18, 3, 129],
      新宿線:     [18, 4, 130],
      大江戸線:   [18, 5, 131],
      # 小湊鉄道
      小湊鉄道線: [92, 2, 149]
    }.freeze

    def get(route_array, url: false)
      messages = []

      route_array.each do |route|
        status_xpath = "//*[@id='mdAreaMajorLine']/div[#{PAGES[route.to_sym][0]}]/table/tr[#{PAGES[route.to_sym][1]}]/td[2]"
        detail_url = "https://transit.yahoo.co.jp/traininfo/detail/#{PAGES[route.to_sym][2]}/0/"

        state = kanto_doc.xpath(status_xpath).first.text

        messages << message(route, state, url, detail_url)
      end

      messages
    end

    def kanto_doc
      charset = nil
      kanto_url = 'https://transit.yahoo.co.jp/traininfo/area/4/'

      kanto_html = URI.parse(kanto_url).open do |f|
        charset = f.charset
        f.read
      end

      Nokogiri::HTML.parse(kanto_html, nil, charset)
    end

    def description(detail_url)
      charset = nil

      detail_html = URI.parse(detail_url).open do |f|
        charset = f.charset
        f.read
      end

      detail_doc = Nokogiri::HTML.parse(detail_html, nil, charset)
      detail_doc.xpath('//*[@id="mdServiceStatus"]/dl/dd/p').first.text
    end

    def message(route, state, url_option, detail_url)
      state.slice!('[◯]')
      state.slice!('[!]')

      return "#{route}は#{state}です。" if state == '平常運転'

      message = case state
                when '運転状況'
                  "#{route}は#{state}に変更があります。"
                when '列車遅延'
                  "#{route}は#{state}があります。"
                when '運転見合わせ'
                  "#{route}は#{state}しています。"
                end

      if url_option
        message + "\n" + description(detail_url) + "\n" + detail_url
      else
        message + "\n" + description(detail_url)
      end
    end
  end
end
