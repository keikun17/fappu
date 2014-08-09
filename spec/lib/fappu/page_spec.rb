require 'spec_helper'

describe Fappu::Page do
  describe "#new_from_json" do
    let(:args) { {'1' => {'image' => 'http://a.url.com', 'thumb' => 'http://a.thumb_url.com'}}}
    subject{ described_class.new_from_json(args) }

    it { is_expected.to be_an_instance_of(described_class) }
    it { is_expected.to have_attributes(
      page_number: '1',
      image_url: 'http://a.url.com',
      thumbnail_url: 'http://a.thumb_url.com'
    )}

  end

end

