require 'spec_helper'

describe 'Brand' do
  it "titlecases the name entered" do
    brand = Brand.create({name: 'nike'})
    expect(brand.name).to(eq('Nike'))
  end

  it "requires a name field before creating object" do
    brand = Brand.new({name: ''})
    expect(brand.save).to(eq(false))
  end
end
