feature 'Deleting a bookmark' do 
    scenario 'a bookmark can be deleted' do 
      visit ('/bookmarks')
      visit ('/bookmarks/new')
      fill_in 'url', :with => 'http://www.linkedin.com'
      fill_in 'title', :with => 'LinkedIn'
      click_button ('Submit')
      expect(page).to have_link('LinkedIn', href: 'http://www.linkedin.com')
      click_button ('Delete')
      expect(page).not_to have_link('LinkedIn', href: 'http://www.linkedin.com')
    end 
end 
