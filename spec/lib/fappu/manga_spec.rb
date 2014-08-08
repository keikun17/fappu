require 'spec_helper'

describe Fappu::Manga , vcr: {cassette_name: 'manga'} do


  describe "#top_comments" do
    context "The manga 'Right now while cleaning the pool'", vcr: { cassette_name: 'pool_cleaning_top_comments' } do
      subject { described_class.new(url: 'https://www.fakku.net/manga/right-now-while-cleaning-the-pool') }

      it "has comments" do
        expect(subject.top_comments.length).not_to eq(0)
      end

      it "returns comment objects" do
        expect(subject.top_comments.first).to be_a_kind_of(Fappu::Comment) 
      end

    end
  end

  describe "#comments" do
    context "The manga is 'Right now while cleaning the pool' has comments", vcr: { cassette_name: 'pool_cleaning_comments' } do
      subject { described_class.new(url: 'https://www.fakku.net/manga/right-now-while-cleaning-the-pool') }

      it "is not empty"
      it "returns comment objects"

    end
  end
end
