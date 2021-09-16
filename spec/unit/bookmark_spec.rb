require 'bookmark'

describe Bookmark do
  describe '#all' do
    it 'returns all bookmarks' do 
      connection = PG.connect(dbname: 'bookmark_manager_test')


      connection.exec("INSERT INTO bookmarks (url) VALUES ('http://www.google.com');")
      connection.exec("INSERT INTO bookmarks (url) VALUES('http://www.youtube.com');")
      connection.exec("INSERT INTO bookmarks (url) VALUES('http://www.twitter.com');")


      bookmarks = Bookmark.all

      expect(bookmarks).to include("http://www.google.com")
      expect(bookmarks).to include("http://www.youtube.com")
      expect(bookmarks).to include("http://www.twitter.com")
    end
  end

  describe '#create' do
    it 'add new bookmark' do
      Bookmark.create(url: 'http://www.linkedin.com')
      expect(Bookmark.all).to include 'http://www.linkedin.com'
    end
  end
end  
