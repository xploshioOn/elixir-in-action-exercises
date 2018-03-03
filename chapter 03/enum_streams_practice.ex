defmodule EnumStreams do
	# lazy enumerations

	# remove the trailing newline character from each line
	defp filter_lines!(path) do
    File.stream!(path)
    |> Stream.map(&String.replace(&1, "\n", ""))
  end

  # returns the list of all lines from that file that are longer than 80 characters
	def large_lines!(path) do
		filter_lines!(path)
		|> Enum.filter(&String.length(&1) > 80)
	end

  # returns a list of numbers, with each number representing the length of the corresponding line from the file
	def lines_lengths!(path) do
    filter_lines!(path)
		|> Enum.map(&String.length(&1))
  end

	# returns the length of the longest line in a file
	def	longest_line_length!(path) do
		filter_lines!(path)
		|> Stream.map(&String.length(&1))
		|> Enum.max
	end

	# returns the content of the longest line in a file
	def longest_line!(path) do
		filter_lines!(path)
		|> Enum.max_by(&String.length(&1))
	end

	# returns a list of numbers, with each number representing the word count in a file
	def words_per_line!(path) do
		filter_lines!(path)
		|> Enum.map(&length(String.split(&1)))
	end

end