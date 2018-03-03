defmodule Loop do

	# calculates the length of a list
	def list_len([]), do: 0

	def list_len([_ | tail]) do
		1 + list_len(tail)
	end

	# takes two integers: from and to and returns a list of all numbers in a given range
	def range(from, to) when from > to do
		[]
	end

	def range(from, to) when from < to do
    [from | range(from + 1, to)]
  end

end