defmodule NucleotideCount do
  # @nucleotides [?A, ?C, ?G, ?T]

  @doc """
  Counts individual nucleotides in a DNA strand.

  ## Examples

  iex> NucleotideCount.count('AATAA', ?A)
  4

  iex> NucleotideCount.count('AATAA', ?T)
  1
  """
  @spec count(charlist(), char()) :: non_neg_integer()
  def count(strand, nucleotide) do
    Enum.reduce(strand, 0, fn current, n_count ->
      if current == nucleotide do
        n_count + 1
      else
        n_count
      end
    end)
  end

  @doc """
  Returns a summary of counts by nucleotide.

  ## Examples

  iex> NucleotideCount.histogram('AATAA')
  %{?A => 4, ?T => 1, ?C => 0, ?G => 0}
  """
  @spec histogram(charlist()) :: map()
  def histogram(strand) do
    Enum.reduce(strand, %{?A => 0, ?T => 0, ?C => 0, ?G => 0}, fn current, nucleotides_count ->
      case current do
        ?A -> %{nucleotides_count | ?A => nucleotides_count[?A] + 1}
        ?T -> %{nucleotides_count | ?T => nucleotides_count[?T] + 1}
        ?C -> %{nucleotides_count | ?C => nucleotides_count[?C] + 1}
        ?G -> %{nucleotides_count | ?G => nucleotides_count[?G] + 1}
        _ -> nucleotides_count
      end
    end)
  end
end
