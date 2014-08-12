require 'spec_helper'

describe Fappu::Manga , vcr: {cassette_name: 'manga'} do

  context "The manga is 'Right now while cleaning the pool'", vcr: { cassette_name: 'pool_cleaning_comments' } do
    subject(:manga) { described_class.new(url: 'https://www.fakku.net/manga/right-now-while-cleaning-the-pool') }

    describe "#top_comments" do
      it "has comments" do
        expect(subject.top_comments.length).not_to eq(0)
      end

      it "returns comment objects" do
        expect(subject.top_comments.first).to be_a_kind_of(Fappu::Comment)
      end
    end

    describe "#download_url", vcr: 'download_pool_sex' do
      subject { manga.download_url }
      it "returns the download link" do
        is_expected.to include('http://www.sendspace.com/file/d5gd5v')
      end
    end

    # TODO WIP
    describe "#comments" do

      subject {manga.comments}

      it "is not empty"
      it "returns comment objects"

    end

    describe "#pages", vcr: {cassette_name: 'manga_read_pool_sex'} do
      subject {manga.pages}
      it { is_expected.not_to be_empty}
      it "returns page objects" do
        expect(subject.first).to be_a_kind_of(Fappu::Page)
        expect(subject.first).to have_attributes(
          page_number: '1',
          image_url: 'https://t.fakku.net/images/manga/r/[Yamatogawa]_Original_Work_-_Right_now,_while_cleaning_the_pool/images/001.jpg',
          thumbnail_url: 'https://t.fakku.net/images/manga/r/[Yamatogawa]_Original_Work_-_Right_now,_while_cleaning_the_pool/thumbs/001.thumb.jpg'
        )
      end
    end

  end
end
