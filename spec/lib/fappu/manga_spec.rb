require 'spec_helper'

describe Fappu::Manga , vcr: {cassette_name: 'manga'} do

  describe ".latest" do
    subject { described_class.latest }
    it { is_expected.not_to be_empty }

    context "The first manga in the 'latest' list is 'My Mountain Village Journal Chapter 1'" do
      subject { described_class.latest.first }

      it "is tagged" do
        subject.tags.each do |tag|
          expect(tag).to be_an_instance_of(Fappu::Tag)
        end

        expect(subject.tags.collect(&:name)).to include('Paizuri', 'Oral',
                                                        'Oppai', 'Hentai',
                                                        'Ahegao'
                                                       )
      end

      it "Assigns the correct values to the object" do
        is_expected.to have_attributes(
          title: "My Mountain Village Journal Chapter 1",
          url: "http://www.fakku.net/manga/my-mountain-village-journal-chapter-1-english-1407126681",
          description: "Commissioned by hentai2read.com",
          language: "english",
          category: "manga",
          date: 1407126681,
          filesize: 18129800,
          favorites: 0,
          comment_count: 0,
          pages: 21,
          poster: "LustyLady00",
          poster_url: "http://www.fakku.net/users/lustylady00",
          translators: include(
            {"attribute" => "Lazarus H", "attribute_link" => "/translators/lazarus-h"}
          ),
          series: include(
            {"attribute" => "Original Work", "attribute_link" => "/series/original-work"},
          ),
          artists: include(
            {"attribute" => "Hiroyuki Kai", "attribute_link" => "/artists/hiroyuki-kai"},
            {"attribute" => "kai hiroyuki", "attribute_link" => "/artists/kai-hiroyuki"}
          ),
          images: include(
            {
              "cover" => "https://t.fakku.net/images/manga/m/[Hiroyuki_Kai,_kai_hiroyuki]_Original_Work_-_My_Mountain_Village_Journal_Chapter_1_1407126682/thumbs/001.thumb.jpg",
              "sample" => "https://t.fakku.net/images/manga/m/[Hiroyuki_Kai,_kai_hiroyuki]_Original_Work_-_My_Mountain_Village_Journal_Chapter_1_1407126682/thumbs/002.thumb.jpg"
            }
          )
        )
      end
    end
  end

  describe ".favorites" do
    subject { described_class.favorites.first }
    context "Tiny boobs is the first favorite" do
      it { is_expected.to have_attributes(title: "Tiny Boobs Giant Tits History") }
    end
  end


  describe ".popular" do
    subject { described_class.popular.first }
    context "This siscon manga with extremely long title is in the list" do
      it {
        is_expected.to have_attributes(title: "More than a little sister, less than a friend? / More than a little sister, less than a bride?")
      }
    end
  end

  describe ".controversial" do
    subject { described_class.controversial.first }
    context "Maso Mess is first in the list of the controversial manga" do
      it {
        is_expected.to have_attributes(title: "Maso Mess Ch14")
      }
    end
  end

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
