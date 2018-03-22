defmodule LinkCheckWorker do
  use GenServer

  # Client API
  def start_link(name) do
    # runs in the caller context 
    GenServer.start_link(__MODULE__, [], name: name)
  end

  def get(pid, url) do
    url_without_newline = String.replace(url, ~r/\r|\n/, "")

    GenServer.cast(pid, {:url, url_without_newline})
  end

  # Server API

  def handle_call(:get_data, _, state) do
    {:reply, state, state}
  end

  def init(_) do
    {:ok, 1}
  end

  def handle_cast({:url, url}, state) do
    case HTTPoison.get(url) do
      {:ok, %HTTPoison.Response{status_code: 200, body: _}} ->
        IO.puts("Got 200!")

      {:ok, %HTTPoison.Response{status_code: status_code}} ->
        IO.puts("Got #{status_code}")

      {:error, %HTTPoison.Error{reason: reason}} ->
        IO.inspect(reason)

      _ -> 
        IO.inspect("got weird response!")
    end

    {:noreply, state}
  end
end