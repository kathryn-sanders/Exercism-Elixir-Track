defmodule RnaTranscription do
  @doc """
  Transcribes a character list representing DNA nucleotides to RNA

  ## Examples

  iex> RnaTranscription.to_rna('ACTG')
  'UGAC'
  """

  @spec to_rna([char]) :: [char]
  def to_rna(dna) do
    Enum.map(dna, &char_case/1)
  end



  def char_case(char) do
    case char do
      ?G -> ?C
      ?C -> ?G
      ?T -> ?A
      ?A -> ?U
      _ -> ?X
    end
  end

end

