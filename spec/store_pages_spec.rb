require 'spec_helper'

describe('store path', {:type => :feature}) do
  it "allows a user to add a store" do
    visit('/')
    click_link 'View All Stores'
    fill_in('name', :with => 'Foot Locker')
    click_button 'Add Store'
    expect(page).to have_content 'Foot Locker'
  end

  it 'allows a user to update the name of a store' do
    Store.create({name: 'Good Shoe Spot'})
    visit '/stores'
    click_link 'Good Shoe Spot'
    fill_in('new_store', with: 'Hanks')
    click_button 'Rename Store'
    expect(page).to have_content('Hanks')
  end
end
