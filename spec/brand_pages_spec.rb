require 'spec_helper'

describe('brand path', {:type => :feature}) do
  it "allows a user to add a brand" do
    visit('/')
    click_link 'View All Brands'
    fill_in('name', :with => 'Footsies')
    click_button 'Add Brand'
    expect(page).to have_content 'Footsies'
  end

  it 'allows a user to update the name of a brand' do
    Brand.create({name: 'Ricks'})
    visit '/brands'
    click_link 'Ricks'
    fill_in('new_brand', with: 'Hanks')
    click_button 'Rename Brand'
    expect(page).to have_content('Hanks')
  end

  it "allows a user to add a store to a brand" do
    Brand.create({name: 'Yips'})
    Store.create({name: 'Bod Shoes'})
    visit '/brands'
    click_link 'Yips'
    select('Bod Shoes', from: 'store')
    click_button 'Add to Store'
    expect(page).to have_content('Bod Shoes')
  end

  it "allows user to delete a brand" do
    Brand.create({name: 'Shooz'})
    visit '/brands'
    click_link 'Shooz'
    click_button 'Delete Brand'
    expect(page).to have_no_content('Shooz')
  end
end
