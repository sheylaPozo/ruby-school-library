# frozen_string_literal: true

require_relative 'spec_resume'

# have the corrector fuction
class Test
  def self.correct_name(name)
    name.capitalize.slice(0, 10)
  end
end

describe Test do
  it 'the corrector will make sure the lenght of the text is 10' do
    mock = Test.correct_name('12345678910')

    expect(mock.length).to eq(10)
  end
end
