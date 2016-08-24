require 'rails_helper'

RSpec.describe Restaurant, type: :model do

  it 'is not valid with a name of less than two characters' do
    restaurant = Restaurant.new(name: "E")
    expect(restaurant).to have(1).error_on(:name)
    expect(restaurant).not_to be_valid
  end

  it 'is not valid if the name is already used' do
    Restaurant.create(name: 'McDonalds')
    restaurant = Restaurant.new(name: 'McDonalds')
    expect(restaurant).to have(1).error_on(:name)
  end

end
