require 'spec_helper'
require 'fappu/manga'

describe Fappu::Manga , vcr: {cassette_name: 'manga'} do


  describe ".latest" do
    subject { described_class.latest }
    it { is_expected.not_to be_empty }

    context "The first manga in the 'latest' list is 'My Mountain Village Journal Chapter 1'" do
      subject { described_class.latest.first }
      it { expect(subject).to have_attributes(
        title: "My Mountain Village Journal Chapter 1",
        url: "http://www.fakku.net/manga/my-mountain-village-journal-chapter-1-english-1407126681",
        description: "Commissioned by hentai2read.com",
        language: "english",
        category: "manga",
        date: 1407126681,
        filesize: 18129800
        # favorites: "",
        # commen: ts,
        # pages,
        # poster,
        # poster_url,
        # tags,
        # translators,
        # series,
        # artists,
        # images
      )}
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
