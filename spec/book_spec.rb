# frozen_string_literal: true

require_relative 'spec_resume'

class Test
end

describe Test do
  it 'the book return the title correctly' do
    mock = Book.new('Una Muerte Anunciada', 'Gabriel Garcia Marquez')
    expect(mock.title).to eq('Una Muerte Anunciada')
  end

  it 'the book return the author correctly' do
    mock = Book.new('Una Muerte Anunciada', 'Gabriel Garcia Marquez')
    expect(mock.author).to eq('Gabriel Garcia Marquez')
  end

  it 'the book return the rental list quantity correctly' do
    mock = Book.new('Una Muerte Anunciada', 'Gabriel Garcia Marquez')
    expect(mock.rentals_list.length).to eq(0)
  end
end
