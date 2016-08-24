require 'rails_helper'

RSpec.describe Restaurant, type: :model do
  it 'is not valid with a name of less than two characters' do
    restaurant = Restaurant.new(name: "E")
    expect(restaurant).to have(1).error_on(:name)
    expect(restaurant).not_to be_valid
  end
end
