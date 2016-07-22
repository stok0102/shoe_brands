require 'spec_helper'

describe(Store) do
  it("ensures the name exists before creating store") do
    store = Store.new({:name => ""})
    expect(store.save()).to(eq(false))
  end
end
