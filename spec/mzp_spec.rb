# -*- coding: utf-8 -*-

require 'rubygems'
require 'rspec'
require './lib/mzp.rb'

describe TweetCategorizer do

  before do
    @tc = TweetCategorizer.new
  end
  
  describe "categorize" do
    context "普通のTweetの場合" do
      it "「あいうえお」を与えた時にNormal\tあいうえおを返す" do
        @tc.categorize("Alice\tあいうえお").should ==  "Normal\tあいうえお"
      end

      it "「かきくけこ」を与えた時にNormal\tかきくけこを返す" do
        @tc.categorize("Bob\tかきくけこ").should ==  "Normal\tかきくけこ"
      end
    end

    context "hash tagの場合" do
      it "「あいうえお #hashtag」を与えたときに「!HashTag\tあいうえお #hashtag」を返す" do
        @tc.categorize("Alice\tあいうえお #hashtag").should == "!HashTag\tあいうえお #hashtag"
      end
      it "「かきくけこ #hashtag」を与えたときに「!HashTag\tかきくけこ #hashtag」を返す" do
        @tc.categorize("Alice\tかきくけこ #hashtag").should == "!HashTag\tかきくけこ #hashtag"
      end
    end

    context "replyの場合" do
      it "「@bob あいうえお」を与えたときに「Reply\tあいうえお」を返す" do
        @tc.categorize("Alice\t@bob あいうえお").should == "Reply\t@bob あいうえお"
      end
      it "「@bob かきくけこ」を与えたときに「Reply\tかきくけこ」を返す" do
        @tc.categorize("Alice\t@bob かきくけこ").should == "Reply\t@bob かきくけこ"
      end
    end
  end
end


