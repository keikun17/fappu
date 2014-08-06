require 'spec_helper'

describe Fappu::Connection, vcr: {cassette_name: 'connection'} do
  describe ".new" do
    subject { described_class.new }

    it {expect(subject).to be_a Fappu::Connection}

    it "defaults to Fakku's API url" do
      expect(subject.base_url).to eq("https://api.fakku.net/index")
    end

  end

  describe "#body" do
    subject {described_class.new.body}
    it "lists info about hentai mangoes" do
      expect(subject['total']).to be > 0
    end
  end


end
