defmodule Linkchecker do
  @moduledoc """
  Documentation for Linkchecker.
  """

  @doc """
  Run a get request on a list of links found in a file.

  ## Examples

      iex> Linkchecker.start('./test/test_data/test_links.txt')

  """

  def start(path) do
    File.stream!(path)
    |> Stream.map(&get(&1))
    |> Stream.run()
  end

  def get(url) do
    url_without_newline = String.replace(url, ~r/\r|\n/, "")

    case HTTPoison.get(url_without_newline) do
      {:ok, %HTTPoison.Response{status_code: 200, body: _}} ->
        IO.puts("Got 200!")

      {:ok, %HTTPoison.Response{status_code: status_code}} ->
        IO.puts("Got #{status_code}")

      {:error, %HTTPoison.Error{reason: reason}} ->
        IO.inspect(reason)
    end
  end
end