require 'spec_helper'

describe Fappu::Search do

  describe '.tagged', vcr: {cassette_name: 'search_tagged'} do
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
