defmodule Loop do
	# non-tail-recursive

	# calculates the length of a list
	def list_len([]), do: 0

	def list_len([_ | tail]) do
		1 + list_len(tail)
	end

	# takes two integers: from and to and returns a list of all numbers in a given range
	def range(from, to) when from > to do
		[]
	end

	def range(from, to) do
    [from | range(from + 1, to)]
  end

  # takes a list and returns another list that contains only positive numbers from the input list
  def positive([]), do: []

	def positive([head | tail]) when head > 0 do
		[head | positive(tail)]
	end

	def positive([head | tail]) when head < 0 do
		positive(tail)
	end

end