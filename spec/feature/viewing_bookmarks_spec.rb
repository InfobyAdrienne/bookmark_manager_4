feature 'Viewing bookmarks' do
  scenario 'visiting the index page' do
    visit('/')
    expect(page).to have_content "Bookmark Manager"
  end
end

feature 'Viewing bookmarks' do
  scenario 'User can see all bookmarks' do
    
    Bookmark.create(url: "http://www.google.com", title: "Google")
    Bookmark.create(url: "http://www.youtube.com", title: "YouTube")
    Bookmark.create(url: "http://www.twitter.com", title: "Twitter")

    visit('/bookmarks')

    expect(page).to have_link('Google', href: 'http://www.google.com')
    expect(page).to have_link('YouTube', href: 'http://www.youtube.com')
    expect(page).to have_link('Twitter', href: 'http://www.twitter.com')
  end
end
