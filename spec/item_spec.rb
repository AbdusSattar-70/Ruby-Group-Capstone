require_relative '../classes/item'

describe Item do
  it 'Check initialization of Item' do
    item = Item.new('2020-01-01')
    expect(item.id).to be_a(Integer)
    expect(item.publish_date).to eq('2020-01-01')
  end
end
