require 'rails_helper'

feature "Managing books" do
  scenario "Can see a list of all the books on the homepage" do
    create_book(title: "Harry Potter", author: "Some Muggle")
    visit root_path

    expect(page).to have_content "Harry Potter"
    expect(page).to have_content "Some Muggle"
  end
end
