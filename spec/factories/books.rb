FactoryBot.define do
  factory :a_book, class: Book do
    title {'A book'}
    memo {'The best simple book'}
    author {'Rob'}
    picture {File.open(Rails.root.join('spec/fixtures/image.png'))} # 疑問点
  end
end
