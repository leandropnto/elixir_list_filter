defmodule ListFilter do
  require Integer

  def call(list) do
    list
    |> Enum.filter(fn item -> Regex.match?(~r/\d+/, item) end)
    |> Enum.map(&parse_number/1)
    |> Enum.filter(fn item -> Integer.is_odd(item) end)
    |> Enum.count()
  end

  defp parse_number(item) do
    case Integer.parse(item) do
      {num, _rest} ->
        num

      :error ->
        nil
    end
  end
end
