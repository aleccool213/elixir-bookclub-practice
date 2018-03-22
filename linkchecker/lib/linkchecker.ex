defmodule Linkchecker do
  @moduledoc """
  Documentation for Linkchecker.
  """

  @doc """
  Run a get request on a list of links found in a file.

  ## Examples

      iex> Linkchecker.start()

  """

  def start() do
    # start three workers and store pids
    pids = [
      LinkCheckWorker.start_link(:pid1),
      LinkCheckWorker.start_link(:pid2),
      LinkCheckWorker.start_link(:pid3)
    ]
    get_urls('./test/test_data/test_links.txt', pids)
  end

  def get_urls(path, pids) do
    # Eg. Website |> Repo.all |> Enum.map(fn(x) -> x.url end)
    File.stream!(path)
    |> Stream.map(&choose_worker_and_do_work(&1, pids))
    |> Stream.run()
  end

  def choose_worker_and_do_work(url, pids) do
    worker = case Enum.take_random(pids, 1) do
      [ok: worker] ->
        IO.puts("Got a worker!")
        worker
      [error: error]  ->
        IO.inspect error
    end
    LinkCheckWorker.get(worker, url)

    # TODO: write results back to mongodb
    {:ok, 1}
  end
end