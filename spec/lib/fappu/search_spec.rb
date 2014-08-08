require 'spec_helper'

describe Fappu::Search do

  describe '.tagged', vcr: {cassette_name: 'search_tagged_netorare'} do
    context "In the mood for some Netorare" do
      let(:tag) { 'Netorare' }
      subject { described_class.tagged(tag) }

      it { is_expected.not_to be_empty }

      it "returns an array of Mangas" do
        subject.each do |item|
          expect(item).to be_a_kind_of(Fappu::Manga)
        end
      end

      it "should include 'Yuru Bitch', 'Shujou Seikou II'" do
        expect(subject.map(&:title)).to include('Shujou Seikou II β', 'Yuru Bitch')
      end

    end
  end

  describe '.terms' do
    context "Searching for SAO manga", vcr: {cassette_name: 'search_term_sao'} do
      let(:search_terms) { "Sword Art Online"}
      subject {described_class.terms(search_terms)}

      it { is_expected.not_to be_empty }

      it "returns an array of Mangas" do
        subject.each do |item|
          expect(item).to be_a_kind_of(Fappu::Manga)
        end
      end

      it "returns an array of SAO mangas" do
        expect(subject.map(&:title)).to include(
          "Sword Art Unlimited",
          "Sword Art Offline -Silica Route-",
          "Sword Art Extra",
          "SPECIAL ASUNA ONLINE 2",
          "Sister Affection Online",
          "Lisbeth... Kirito ni wa Suterare, Kyaku ni wa Okasare Nakadashi Ninshin... Asuna to no Kakusa ga Hirogaru Online",
          "Asuna to Online",
          "KARORFUL MIX EX10",
          "KARORFUL MIX EX9",
          "no passage"
        )
      end

    end
  end

  describe ".latest", vcr: {cassette_name: 'manga'} do
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

  describe ".favorites",vcr: {cassette_name: 'manga'} do
    subject { described_class.favorites.first }
    context "Tiny boobs is the first favorite" do
      it { is_expected.to have_attributes(title: "Tiny Boobs Giant Tits History") }
    end
  end


  describe ".popular" ,vcr: {cassette_name: 'manga'} do
    subject { described_class.popular.first }
    context "This siscon manga with extremely long title is in the list" do
      it {
        is_expected.to have_attributes(title: "More than a little sister, less than a friend? / More than a little sister, less than a bride?")
      }
    end
  end

  describe ".controversial" ,vcr: {cassette_name: 'manga'} do
    subject { described_class.controversial.first }
    context "Maso Mess is first in the list of the controversial manga" do
      it {
        is_expected.to have_attributes(title: "Maso Mess Ch14")
      }
    end
  end
end
