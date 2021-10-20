# frozen_string_literal: true

require_relative 'spec_resume'

class Test
end

describe Test do
  it 'the rental return the date' do
    $book_list = []
    $person_list = []
    mock_p = Teacher.new(50, 'Biology', 'Hector', nil)
    $person_list.push(mock_p)
    mock_b = Book.new('Una Muerte Anunciada', 'Gabriel Garcia Marquez')
    $book_list.push(mock_b)
    mock = Rental.new('31/12/1999', 0, 0)
    expect(mock.date).to eq('31/12/1999')
  end
end
