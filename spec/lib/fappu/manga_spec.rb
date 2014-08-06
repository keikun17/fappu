require 'spec_helper'

describe Fappu::Manga , vcr: {cassette_name: 'manga'} do

  describe ".latest" do
    subject { described_class.latest }
    it { is_expected.not_to be_empty }

    context "The first manga in the 'latest' list is 'My Mountain Village Journal Chapter 1'" do
      subject { described_class.latest.first }

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
          comments: 0,
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
          ),
          tags: include(
                        {"attribute" => "Paizuri", "attribute_link"  =>'/tags/paizuri'},
                        {"attribute" => "Oral", "attribute_link" => "/tags/oral"},
                        {"attribute" => "Oppai", "attribute_link" => "/tags/oppai"},
                        {"attribute" => "Hentai", "attribute_link" => "/tags/hentai"},
                        {"attribute" => "Ahegao", "attribute_link" => "/tags/ahegao"}
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
    context "something " do
      it {
        is_expected.to have_attributes(title: "Maso Mess Ch14")
      }
    end
  end
end
