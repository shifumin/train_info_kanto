module TrainInfoKanto
  class CLI < Thor
    desc "train_info_kanto *routes", "Get routes information"
    def get(*routes)
      texts = TrainInfoKanto.get(routes)

      texts.each do |text|
        print text
        print "\n"
      end
    end
  end
end
