# -*- coding: utf-8 -*-

require 'rubygems'
require 'rspec'
require './lib/mzp.rb'

describe TweetCategorizer do

  before do
    @tc = TweetCategorizer.new
  end

  describe "categorize" do
    subject { @tc.categorize(tweet) }
    context "普通のTweetの場合" do
      context "「あいうえお」を与えた時にNormal\tあいうえおを返す" do
        let(:tweet) { "Alice\tあいうえお" }
        it { should == "Normal\tあいうえお" }
      end

      context "「かきくけこ」を与えた時にNormal\tかきくけこを返す" do
        let(:tweet) { "Bob\tかきくけこ" }
        it { should ==  "Normal\tかきくけこ" }
      end
    end

    context "hash tagの場合" do
      context "「あいうえお #hashtag」を与えたときに「!HashTag\tあいうえお #hashtag」を返す" do
        let(:tweet) { "Alice\tあいうえお #hashtag" }
        it { should == "!HashTag\tあいうえお #hashtag" }
      end
      context "「かきくけこ #hashtag」を与えたときに「!HashTag\tかきくけこ #hashtag」を返す" do
        let(:tweet) { "Alice\tかきくけこ #hashtag" }
        it { should == "!HashTag\tかきくけこ #hashtag" }
      end
    end

    context "replyの場合" do
      context "「@bob あいうえお」を与えたときに「Reply\tあいうえお」を返す" do
        let(:tweet) { "Alice\t@bob あいうえお" }
        it { should == "Reply\t@bob あいうえお" }
      end
      context "「@bob かきくけこ」を与えたときに「Reply\tかきくけこ」を返す" do
        let(:tweet) { "Alice\t@bob かきくけこ" }
        it { should == "Reply\t@bob かきくけこ" }
      end
    end

    context "mentionの場合" do
      context "「嗚呼 @bob あいうえお」を与えたときに「Mention\t嗚呼 @bob あいうえお」を返す" do
        let(:tweet) { "Alice\t嗚呼 @bob あいうえお" }
        it { should == "Mention\t嗚呼 @bob あいうえお" }
      end
      context "「嗚呼 @bob かきくけこ」を与えたときに「Mention\t嗚呼 @bob かきくけこ」を返す" do
        let(:tweet) { "Alice\t嗚呼 @bob かきくけこ" }
        it { should == "Mention\t嗚呼 @bob かきくけこ" }
      end
    end
  end
end


