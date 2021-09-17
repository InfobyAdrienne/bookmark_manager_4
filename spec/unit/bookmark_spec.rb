require 'bookmark'
require 'database_helpers'

describe Bookmark do
  describe '#all' do
    it 'returns all bookmarks' do 
      connection = PG.connect(dbname: 'bookmark_manager_test')

      # Add the test data
      bookmark = Bookmark.create(url: 'http://www.google.com', title: 'Google')
      Bookmark.create(url: 'http://www.youtube.com', title: 'YouTube')
      Bookmark.create(url: 'http://www.twitter.com', title: 'Twitter')

      # connection.exec("INSERT INTO bookmarks (url, title) VALUES ('http://www.google.com', 'Google');")
      # connection.exec("INSERT INTO bookmarks (url, title) VALUES('http://www.youtube.com', 'YouTube');")
      # connection.exec("INSERT INTO bookmarks (url, title) VALUES('http://www.twitter.com', 'Twitter');")

      bookmarks = Bookmark.all

      expect(bookmarks.length).to eq 3
      expect(bookmarks.first).to be_a Bookmark
      expect(bookmarks.first.id).to eq bookmark.id
      expect(bookmarks.first.title).to eq 'Google'
      expect(bookmarks.first.url).to eq 'http://www.google.com'
      # expect(bookmarks).to include("http://www.google.com")
      # expect(bookmarks).to include("http://www.youtube.com")
      # expect(bookmarks).to include("http://www.twitter.com")
    end
  end

  describe '#create' do
    it 'add new bookmark' do
      bookmark = Bookmark.create(url: 'http://www.linkedin.com', title: 'LinkedIn')
      persisted_data = PG.connect(dbname: 'bookmark_manager_test').query("SELECT * FROM bookmarks WHERE id = #{bookmark.id};")
      
      expect(bookmark).to be_a Bookmark
      expect(bookmark.id).to eq persisted_data.first['id']
      expect(bookmark.title).to eq 'LinkedIn'
      expect(bookmark.url).to eq 'http://www.linkedin.com'

      # expect(bookmark['url']).to eq 'http://www.linkedin.com'
      # expect(bookmark['title']).to eq 'LinkedIn'
    end
  end
end  
