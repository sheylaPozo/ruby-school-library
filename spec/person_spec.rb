# frozen_string_literal: true

require_relative 'spec_resume'

class Test
end

describe Test do
  it 'the person cannot use services if is underage and dont have permission from their parents' do
    mock = Person.new('Underage', 17, false, nil)
    expect(mock.can_use_services?).to eq(false)
  end

  it 'the person can use services if is underage and have permission from their parents' do
    mock = Person.new('Underage', 17, true, nil)
    expect(mock.can_use_services?).to eq(true)
  end

  it 'the person can use services if is 18 years old or more' do
    mock = Person.new('Overage', 18, false, nil)
    expect(mock.can_use_services?).to eq(true)
  end

  it 'the person can use services if is 18 years old or more' do
    mock = Person.new('Overage', 18, false, nil)
    expect(mock.can_use_services?).to eq(true)
  end
end
