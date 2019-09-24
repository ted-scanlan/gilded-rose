require 'simplecov'
require_relative '../spec_helper.rb'
require_relative '../../lib/Aged_brie.rb'

describe AgedBrie do

describe 'update' do

  it'decreases sellin by 1' do
    subject = described_class.new('Aged Brie', 5, 5)
    subject.update()
    expect(subject.sell_in).to eq 4

  end

it'increases the quality of brie by 1' do
  subject = described_class.new('Aged Brie', 5, 5)
  subject.update()
  expect(subject.quality).to eq 6

end
it'increases the quality of brie by 2 once sell by date has passed' do
  subject = described_class.new('Aged Brie', -5, 5)
  subject.update()
  expect(subject.quality).to eq 7

end

it'quality of an item is never more than 50' do
  subject = described_class.new('Aged Brie', 10, 50)
  subject.update()
    expect(subject.quality).to eq 50
end
end

end
