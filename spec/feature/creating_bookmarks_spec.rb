feature 'Adding a new bookmark' do
  scenario 'user can add new bookmarks' do
    visit ('/bookmarks/new')
    fill_in 'url', :with => 'http://www.linkedin.com'
    click_button ('Submit')
    expect(page).to have_content 'http://www.linkedin.com'
  end
end