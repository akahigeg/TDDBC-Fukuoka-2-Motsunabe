# -*- coding: utf-8 -*-

class TweetCategorizer
  def categorize(input)
    screen_name, tweet = input.split("\t")

    categories = []

    categories.push("!HashTag") if tweet =~ /.*#.+$/
    categories.push("Reply") if tweet =~ /^@.+? .+$/
    categories.push("Mention") if tweet =~ /^.+ @.+? .+$/

    return categories.sort.join(",") + "\t#{tweet}" unless categories.empty?

    "Normal\t#{tweet}"
  end
end
