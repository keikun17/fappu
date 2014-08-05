require 'spec_helper'
require 'fappu/manga'

describe Fappu::Manga , vcr: {cassette_name: 'manga'} do


  describe ".latest" do
    subject { described_class.latest }
    it { is_expected.not_to be_empty }

    context "The first manga in the 'latest' list is 'My Mountain Village Journal Chapter 1'" do
      subject { described_class.latest.first }

      specify "Assigns the correct values to the object" do
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
          # translators: "kk",
          # series: "",
          # artists: "",
          # images: "",
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
    # subject { described_class.favorites }
    # it { expect(subject).to be_a Fappu::Manga }
  end


  describe ".popular" do
    subject { described_class.popular }
  end

  describe ".controversial" do
    subject { described_class.controversial }
  end
end
