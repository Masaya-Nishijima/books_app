require 'rails_helper'

RSpec.describe Book, type: :model do
  let(:book) { FactoryBot.create(:a_book) }
  context "タイトルと内容と筆者" do
    it 'タイトル' do
      expect(book[:title]).to eq 'A book'
    end

    it "内容" do
      expect(book[:memo]).to eq 'The best simple book'
    end

    it "著者" do
      expect(book[:author]).to eq 'Rob'
    end
  end

  context "画像" do
    it do
      p book
      expect(book[:picture]).to eq 'image.png'
    end
  end

end
