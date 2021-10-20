# frozen_string_literal: true

require_relative 'spec_resume'

class Test
end

describe Test do
  it 'the classroom can save students' do
    mock = Classroom.new('Microverse')
    arturo = Student.new(21, 'no one', 'Arturo', true, 137)

    mock.put_students(arturo)

    expect(mock.students[0]).to eq(arturo)
  end
end
