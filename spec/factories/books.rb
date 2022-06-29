# frozen_string_literal: true

FactoryBot.define do
  factory :book do
    title { 'A book' }
    memo { 'The best simple book' }
    author { 'Rob' }
    picture { File.open(Rails.root.join('spec/fixtures/image.png')) } # 疑問点
  end
end
