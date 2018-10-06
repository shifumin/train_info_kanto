module TraininfoKanto
  class CLI < Thor
    desc "traininfo_kanto *routes", "Get routes information"
    def get(*routes)
      texts = TraininfoKanto.get(routes)

      texts.each do |text|
        print text
        print "\n"
      end
    end
  end
end
