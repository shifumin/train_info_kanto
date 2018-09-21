require "nokogiri"
require 'open-uri'

module TrainInfoKanto
  PAGES = {
    # Route: [Kanto page XPath table number, Kanto page XPath column number, detail page URL number]
    山手線:     [4, 2, 21],
    京浜東北線: [4, 3, 22],
    中央線:     [4, 12, 38],
    中央総武線: [4, 13, 40],
    総武快速線: [4, 30, 61],
    内房線:     [4, 32, 63],
    京葉線:     [4, 36, 69],
    小湊鉄道線: [92, 2, 149]
  }.freeze

  def self.get(route_array, url: false)
    charset = nil
    kanto_url = 'https://transit.yahoo.co.jp/traininfo/area/4/'

    kanto_html = open(kanto_url) do |f|
      charset = f.charset
      f.read
    end

    kanto_doc = Nokogiri::HTML.parse(kanto_html, nil, charset)
    message = []

    route_array.each do |route|
      status_xpath = "//*[@id='mdAreaMajorLine']/div[#{PAGES[route.to_sym][0]}]/table/tr[#{PAGES[route.to_sym][1]}]/td[2]"
      detail_url = "https://transit.yahoo.co.jp/traininfo/detail/#{PAGES[route.to_sym][2]}/0/"

      state = kanto_doc.xpath(status_xpath).first.text

      case state
      when '平常運転'
        message << "#{route}は#{state}です。"
      when '[!]運転状況'
        detail_html = open(detail_url) do |f|
          charset = f.charset
          f.read
        end

        detail_doc = Nokogiri::HTML.parse(detail_html, nil, charset)
        description = detail_doc.xpath('//*[@id="mdServiceStatus"]/dl/dd/p').first.text
        state.slice!('[!]')

        message << "#{route}は#{state}に変更があります。\n" + description + "\n" + detail_url
      when '[!]列車遅延'
        detail_html = open(detail_url) do |f|
          charset = f.charset
          f.read
        end

        detail_doc = Nokogiri::HTML.parse(detail_html, nil, charset)
        description = detail_doc.xpath('//*[@id="mdServiceStatus"]/dl/dd/p').first.text
        state.slice!('[!]')

        message << "#{route}は#{state}があります。\n" + description + "\n" + detail_url
      when '[!]運転見合わせ'
        detail_html = open(detail_url) do |f|
          charset = f.charset
          f.read
        end

        detail_doc = Nokogiri::HTML.parse(detail_html, nil, charset)
        description = detail_doc.xpath('//*[@id="mdServiceStatus"]/dl/dd/p').first.text
        state.slice!('[!]')

        message << "#{route}は#{state}しています。\n" + description + "\n" + detail_url
      end
    end

    message
  end
end
