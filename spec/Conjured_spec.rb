require 'simplecov'
require_relative './spec_helper.rb'
require_relative '../lib/Conjured.rb'

describe Conjured do

describe '#update' do
it'decreases sellin by 1' do
  subject = described_class.new('Conjured', 5, 5)
  subject.update()
  expect(subject.sell_in).to eq 4

end
it'decreases quality of item by 2' do
    subject = described_class.new('Conjured', 5, 5)
  subject.update()
  expect(subject.quality).to eq 3
end

it'The Quality of an item is never negative' do
    subject = described_class.new('Conjured', 5, 0)
    subject.update()
    expect(subject.quality).to eq 0
end


it 'decreases quality twice as fast when sellin has passed' do
    subject = described_class.new('Conjured', -1, 8)
    subject.update()
    expect(subject.quality).to eq 4

end
end

end
