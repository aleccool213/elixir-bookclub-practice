defmodule Website do
  use Ecto.Schema

  # iex(2)> website = %Website{url: "www.google.com", disabled: false, results: nil}
  # %Website{
  #   __meta__: #Ecto.Schema.Metadata<:built, "website">,
  #   disabled: false,
  #   id: nil,
  #   results: nil,
  #   url: 'www.google.com'
  # }

  # Construct a custom query
  # Website |> Ecto.Query.first |> Repo.one
  # imma get the schema, create a query from it,
  # and run it against this database worker

  # Fetch all records
  # Friends.Person |> Friends.Repo.all
  # follows:
  # schema -> database worker query

  # eg. Friends.Person |> Ecto.Query.where(last_name: "Smith") |> Friends.Repo.all

  # pin operator with query interpolation

  schema "websites" do
    field(:url, :string)
    field(:disabled, :boolean)
    field(:results, :string)
  end

  # url is always required
  # eg.
  # person = %Friends.Person{}
  # changeset = Friends.Person.changeset(person, %{})
  # Friends.Repo.insert(changeset) or changeset.valid?
  def changeset(website, params \\ %{}) do
    website
    |> Ecto.Changeset.cast(params, [:url, :disabled, :results])
    |> Ecto.Changeset.validate_required([:url])
  end
end
