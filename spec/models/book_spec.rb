require 'rails_helper'

RSpec.describe Book, type: :model do
  let(:book) { FactoryBot.create(:book) }
  context "タイトルと内容と筆者" do
    it "タイトルと内容、著者が設定できること" do
      expect(book).to have_attributes(
        title: 'A book',
        memo: 'The best simple book',
        author: 'Rob'
      )
    end
  end

  context "画像" do
    it "画像が設定できること" do
      expect(book[:picture]).to eq 'image.png'
    end
  end

end
