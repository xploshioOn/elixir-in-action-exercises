defmodule Loop do
	# tail-recursive

	# calculates the length of a list
	def list_len(list) do
		calculate_len(0, list)
	end

	defp calculate_len(length, []) do
		length
	end

	defp calculate_len(length, [_ | tail]) do
		calculate_len(length + 1, tail)
	end

	# takes two integers: from and to and returns a list of all numbers in a given range
	def range(from, to) do
		calculate_range([], from, to)
	end

	defp calculate_range(list, from, to) when from > to do
		list
	end

	defp calculate_range(list, from, to) do
		calculate_range([to | list], from, to-1)
	end

  # takes a list and returns another list that contains only positive numbers from the input list
  def positive(list) do
  	return_positive([], list)
  end

  defp return_positive(positives, []) do
  	positives
  end

  defp return_positive(positives, [head | tail]) when head > 0 do
  	[head | return_positive(positives, tail)]
  end

  defp return_positive(positives, [_ | tail]) do
  	return_positive(positives, tail)
  end

end