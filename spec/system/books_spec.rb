require 'rails_helper'

RSpec.describe "Books", type: :system do
  before do
    @book = FactoryBot.create(:a_book, title: "Factory Bots Book", author: "FactoryBots")
  end

  scenario "本の詳細を開く" do
    visit books_path
    click_link "Show"

    expect(page).to have_content "FactoryBots"
  end

  scenario "新しい本を作成する" do
    visit books_path

    expect{
      click_link "New Book"
      fill_in "Title", with: "System Spec"
      fill_in "Memo", with: "Spec Spec Spec"
      fill_in "Author", with: "Made by System==Spec"
      click_button "Create Book"

      expect(page).to have_content "Book was successfully created."
      expect(page).to have_content "System Spec"
      expect(page).to have_content "Spec Spec Spec"
      expect(page).to have_content "Made by System==Spec"
    }.to change(Book, :count).by(1)
  end

  scenario "本を編集する" do
    visit book_path(@book.id)

    expect{
      click_link "Edit"
      fill_in "Title", with: "System Spec"
      fill_in "Memo", with: "Spec Spec Spec"
      fill_in "Author", with: "Edited by System==Spec"
      click_button "Update Book"

      expect(page).to have_content "Book was successfully updated."
      expect(page).to have_content "System Spec"
      expect(page).to have_content "Spec Spec Spec"
      expect(page).to have_content "Edited by System==Spec"
    }.to_not change(Book, :count)
  end

  scenario "本を削除する" do
    visit books_path

    expect {
      expect(page).to have_content "Factory Bots Book"

      accept_alert do
        click_link "Destroy"
      end

      expect(page).to_not have_content "Factory Bots Book"
      expect(page).to have_content "Book was successfully destroyed."
    }.to change(Book, :count).by(-1)
  end
end
