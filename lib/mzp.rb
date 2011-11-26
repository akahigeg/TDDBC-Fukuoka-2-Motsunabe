# -*- coding: utf-8 -*-

class TweetCategorizer
  def categorize(input)
    screen_name, tweet = input.split("\t")

    return "!HashTag\t#{tweet}" if tweet =~ /.*#.+$/
    return "Reply\t#{tweet}" if tweet =~ /^@.+? .+$/
    return "Mention\t#{tweet}" if tweet =~ /^.+ @.+? .+$/

    "Normal\t#{tweet}"
  end
end
