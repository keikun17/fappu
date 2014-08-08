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
        a = subject
        binding.pry
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
end
