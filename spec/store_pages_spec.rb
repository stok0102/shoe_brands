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

  it "allows a user to add a brand to a store" do
    Brand.create({name: 'Yoohoos'})
    Store.create({name: 'Bad Shoes'})
    visit '/stores'
    click_link 'Bad Shoes'
    select('Yoohoos', from: 'brand')
    click_button 'Carry this brand'
    expect(page).to have_content('Yoohoos')
  end

  it "allows user to delete a store" do
    Store.create({name: 'Foot Stuff'})
    visit '/stores'
    click_link 'Foot Stuff'
    click_button 'Delete Store'
    expect(page).to have_no_content('Foot Stuff')
  end
end
