feature 'Adding a new bookmark' do
  scenario 'user can add new bookmarks' do
    visit ('/bookmarks/new')
    fill_in 'url', :with => 'http://www.linkedin.com'
    fill_in 'title', :with => 'LinkedIn'
    click_button ('Submit')
    expect(page).to have_link('LinkedIn', href: 'http://www.linkedin.com')
  end
end