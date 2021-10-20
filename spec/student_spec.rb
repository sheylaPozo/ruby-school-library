# frozen_string_literal: true

require_relative 'spec_resume'

class Test
end

describe Test do
  it 'the student can play hookey' do
    mock = Student.new(19, 'Microverse', 'Rudy', false, 19)
    expect(mock.play_hooky).to eq("¯\(ツ)/¯")
  end
end
