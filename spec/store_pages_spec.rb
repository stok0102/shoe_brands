require 'spec_helper'

describe('adding store path', {:type => :feature}) do
  it "allows a user to add a store" do
    visit('/')
    click_link 'View All Stores'
    fill_in('name', :with => 'Foot Locker')
    click_button 'Add Store'
    expect(page).to have_content 'Foot Locker'
  end
end
