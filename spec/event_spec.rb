# frozen_string_literal: true

require 'rails_helper'
require 'spec_helper'
# require 'rspec'
require 'capybara/rspec'
require 'capybara/dsl'

RSpec.describe 'Creating a event', type: :feature do
  scenario 'valid inputs' do
    visit welcome_path
    expect(page).to have_content('Please sign-in to continue!')
    click_button 'Sign Up'
    fill_in 'Username', with: 'test1233'
    fill_in 'Password', with: 'test1233'
    click_on 'Create User'

    visit new_event_path

    fill_in 'Name', with: 'Honor Career Fair'
    fill_in 'Description', with: 'Gimme job pls man'
    fill_in 'event_type', with: 'Career Fair'
    fill_in 'location', with: 'Zach 420'
    fill_in 'Date', with: DateTime.current.strftime("%m%d%Y\t%I%M%P")
    click_on 'Create Event'
    visit events_path
    expect(page).to have_content('Career Fair')
    sleep(5)
  end

  # scenario 'invalid inputs' do
  #     visit welcome_path
  #     expect(page).to have_content("Please sign-in to continue!")
  #     click_button 'Sign Up'
  #     fill_in 'Username', with: 'test1233'
  #     fill_in 'Password', with: 'test1233'
  #     click_on 'Create User'

  #     visit new_event_path

  #     fill_in 'Firstname', with: 'Sam'
  #     fill_in 'Lastname', with: 'Ham'
  #     fill_in 'Email', with: 'samHam@tamu.edu'
  #     fill_in 'Uin', with: '32134213'
  #     fill_in 'Year', with: '2021'
  #     fill_in 'Major', with: 'CSCE'
  #     click_on 'Create event'
  #     expect(page).to have_content('1 error prohibited this event from being saved:')
  # end
end

RSpec.describe 'Updating a event', type: :feature do
  scenario 'valid inputs' do
    visit welcome_path
    expect(page).to have_content('Please sign-in to continue!')
    click_button 'Sign Up'
    fill_in 'Username', with: 'test1233'
    fill_in 'Password', with: 'test1233'
    click_on 'Create User'

    newB = Event.create!(name: 'LOLMAN', description: 'Get a job', event_type: 'Career Fair', location: 'Zach 420', date: DateTime.current.strftime("%m%d%Y\t%I%M%P"))
    visit edit_event_path(id: newB.id)
    fill_in 'Name', with: 'Honors Career Fair'
    click_on 'Update Event'
    visit events_path
    # sleep(3)
    expect(page).to have_content('Career Fair')
  end
end

RSpec.describe 'Deleting a event', type: :feature do
  scenario 'success' do
    visit welcome_path
    expect(page).to have_content('Please sign-in to continue!')
    click_button 'Sign Up'
    fill_in 'Username', with: 'test1233'
    fill_in 'Password', with: 'test1233'
    click_on 'Create User'

    newB = Event.create!(name: 'LOLMAN', description: 'Get a job', event_type: 'Career Fair', location: 'Zach 420', date: DateTime.current.strftime("%m%d%Y\t%I%M%P"))
    visit events_path
    find(:xpath, ".//a[i[contains(@class, 'fa fa-trash fa-lg')]]").click
    page.driver.browser.switch_to.alert.accept
    expect(page).to have_content('Event was successfully destroyed.')
    expect(page).not_to have_content('LOLMAN')
  end
end

RSpec.describe 'Viewing a event', type: :feature do
  scenario 'success' do
    visit welcome_path
    expect(page).to have_content('Please sign-in to continue!')
    click_button 'Sign Up'
    fill_in 'Username', with: 'test1233'
    fill_in 'Password', with: 'test1233'
    click_on 'Create User'

    newB = Event.create!(name: 'LOLMAN', description: 'Get a job', event_type: 'Career Fair', location: 'Zach 420', date: DateTime.current.strftime("%m%d%Y\t%I%M%P"))
    visit events_path
    find(:xpath, ".//a[i[contains(@class, 'fa fa-search fa-lg')]]").click
    expect(page).to have_content('Name: LOLMAN')
    sleep(3)
  end
end
