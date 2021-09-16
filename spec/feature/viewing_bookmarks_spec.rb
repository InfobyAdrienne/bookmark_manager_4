feature 'Viewing bookmarks' do
  scenario 'visiting the index page' do
    visit('/')
    expect(page).to have_content "Bookmark Manager"
  end
end

feature 'Viewing bookmarks' do
  scenario 'User can see all bookmarks' do
    connection = PG.connect(dbname: 'bookmark_manager_test')

    connection.exec("INSERT INTO bookmarks (url) VALUES ('http://www.google.com');")
    connection.exec("INSERT INTO bookmarks (url) VALUES('http://www.youtube.com');")
    connection.exec("INSERT INTO bookmarks (url) VALUES('http://www.twitter.com');")

    visit('/bookmarks')

    expect(page).to have_content "http://www.google.com"
    expect(page).to have_content "http://www.youtube.com"
    expect(page).to have_content "http://www.twitter.com"
  end
end
