require 'rails_helper'
require 'spec_helper'
# require 'rspec'
require 'capybara/rspec'
require 'capybara/dsl'
# require 'books'

RSpec.describe 'Student', type: :system do
  describe 'index page' do
    it 'shows the right content' do
      visit "/"
      expect(page).to have_content('Engineering Honors Participation Tracker')
    end
  end
end

RSpec.describe 'Creating a student', type: :feature do
    scenario 'valid inputs' do
        visit new_post_path
        fill_in 'Firstname', with: 'Sam'
        fill_in 'Lastname', with: 'Ham'
        fill_in 'Email', with: 'samHam@tamu.edu'
        fill_in 'UIN', with: '32134213'
        fill_in 'Year', with: '2021'
        fill_in 'Major', with: 'CSCE'
        fill_in 'GPA', with: '2021'
        select('Good Standing', :from => 'Standing')
        click_on 'Create Student'
        visit student
        #sleep(5)
        expect(page).to have_content('Sam')
    end

    scenario 'invalid inputs' do
        visit new_post_path
        fill_in 'Firstname', with: 'Sam'
        fill_in 'Lastname', with: 'Ham'
        fill_in 'Email', with: 'samHam@tamu.edu'
        fill_in 'UIN', with: '32134213'
        fill_in 'Year', with: '2021'
        fill_in 'Major', with: 'CSCE'
        fill_in 'GPA', with: '2021'
        select('Good Standing', :from => 'Standing')
        click_on 'Create Student'
        expect(page).to have_content('errors prohibited this student from being saved:')
    end
end

# RSpec.describe 'Updating a book', type: :feature do
#     scenario 'valid inputs' do
#       newB = Post.create!(title: 'Magic', author:'Phil', genre:'Nice')
#       visit edit_post_path(id: newB.id)
#       fill_in 'Title', with: 'New York City'
#       click_on 'Update Post'
#       visit root_path
#       #sleep(3)
#       expect(page).to have_content('New York City')
#     end
#   end

# RSpec.describe 'Deleting a book', type: :feature do
#     scenario 'success' do
#         newB = Post.create!(title: 'Deletelol', author:'Phil', genre:'Nice')
#         visit root_path
#         expect(page).to have_content('Deletelol')
#         click_on 'Delete'
#         expect(page).not_to have_content('NYC')
#     end
# end