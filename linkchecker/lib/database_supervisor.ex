# TODO: start supervision tree
# def start(_type, _args) do
#   import Supervisor.Spec

#   children = [
#     Repo,
#   ]

#   ...
defmodule DatabaseSupervisor do
  use Supervisor

  def start() do
    children = [
      # The Stack is a child started via Stack.start_link([:hello])
      Repo
      # MongoRepo
    ]

    {:ok, pid} =
      Supervisor.start_link(
        children,
        strategy: :one_for_one
      )
  end
end
