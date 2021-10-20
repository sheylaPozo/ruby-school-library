# frozen_string_literal: true
​
require_relative 'spec_resume'
​
class Test
end
​
describe Test do
  it 'the teacher return the specialization' do
    mock = Teacher.new(50, 'Biology', 'Hector', nil)
    expect(mock.specialization).to eq("Biology")
  end
end
