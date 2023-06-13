require_relative '../classes/label'

describe Label do
  before :each do
    @item = instance_double('Item')
    @label = Label.new('Example Label', 'blue')
  end

  describe '#initialize' do
    it 'sets the title and color' do
      expect(@label.title).to eq('Example Label')
      expect(@label.color).to eq('blue')
    end

    it 'initializes an empty array of items' do
      expect(@label.items).to be_empty
    end
  end

  describe '#add_item' do
    it 'adds the item to the label' do
      allow(@item).to receive(:label=).with(@label)
      @label.add_item(@item)
      expect(@label.items).to include(@item)
    end

    it 'sets the label of the item' do
      expect(@item).to receive(:label=).with(@label)
      @label.add_item(@item)
    end

    it 'does not add the item to the label if it is already present' do
      allow(@item).to receive(:label=).with(@label)
      @label.add_item(@item)
      @label.add_item(@item)
      expect(@label.items.count(@item)).to eq(2)
    end
  end
end
