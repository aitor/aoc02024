defmodule Distance do
  def compute do
    {:ok, contents} = File.read("day01.input")
    rows = String.split(contents, "\n", trim: true)

    historian_data =
      Enum.map(rows, fn row ->
        String.split(row, " ", trim: true) |> Enum.map(&String.to_integer/1)
      end)

    historian_list_1 = Enum.sort(Enum.map(historian_data, fn item -> Enum.at(item, 0) end))
    historian_list_2 = Enum.sort(Enum.map(historian_data, fn item -> Enum.at(item, 1) end))

    similarity_score =
      historian_list_1
      |> Enum.with_index()
      |> Enum.reduce(0, fn {item, index}, acc ->
        distance = abs(item - Enum.at(historian_list_2, index))
        distance + acc
      end)

    IO.puts("The similarity score is #{similarity_score}")
  end
end

Distance.compute()
