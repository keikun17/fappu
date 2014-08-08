require 'spec_helper'

describe Fappu::Tag do
  describe '.list', vcr: 'taglist' do
    subject { described_class.list }

    it { is_expected.not_to be_empty }
    it "should return an array of tag objects" do
      expect(subject.first).to be_a_kind_of(described_class)
    end

  end

end
