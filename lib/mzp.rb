# -*- coding: utf-8 -*-

class TweetCategorizer
  def categorize(input)
    parts = input.split("\t")

    return "!HashTag\t#{parts[1]}" if parts[1] =~ /.*#.+$/
    return "Reply\t#{parts[1]}" if parts[1] =~ /^@.+? .+$/

    "Normal\t#{parts[1]}"
  end
end
