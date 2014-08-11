shared_examples 'a manga collection' do

  it { is_expected.not_to be_empty }
  it "returns an array of Mangas" do
    subject.each do |item|
      expect(item).to be_a_kind_of(Fappu::Manga)
    end
  end

end
