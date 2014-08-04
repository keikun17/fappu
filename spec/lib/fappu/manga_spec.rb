require 'spec_helper'
require 'fappu/manga'

describe Fappu::Manga , vcr: {cassette_name: 'manga'} do


  describe ".latest" do
    subject { described_class.latest }
    it { is_expected.not_to be_empty }

    context "The first manga in the 'latest' list is 'My Mountain Village Journal Chapter 1'" do
      subject { described_class.latest.first }
      it { expect(subject.title).to eq("My Mountain Village Journal Chapter 1")}
      it { expect(subject.url).to eq("http://www.fakku.net/manga/my-mountain-village-journal-chapter-1-english-1407126681")}
      it { expect(subject.description).to eq("Commissioned by hentai2read.com") }
      it { expect(subject.language).to eq("english") }
      it { expect(subject.category).to eq("manga") }
      it { expect(subject.date).to eq(1407126681) }
      it { expect(subject.filesize).to eq(18129800) }
      # it { expect(subject.favorites) }
      # it { expect(subject.comments) }
      # it { expect(subject.pages) }
      # it { expect(subject.poster) }
      # it { expect(subject.poster_url) }
      # it { expect(subject.tags) }
      # it { expect(subject.translators) }
      # it { expect(subject.series) }
      # it { expect(subject.artists) }
      # it { expect(subject.images) }
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
