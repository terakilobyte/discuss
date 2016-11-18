defmodule Discuss.User do
  use Discuss.Web, :model

  schema "users" do
    field :email, :string, required: true
    field :token, :string, required: true
    field :provider, :string, required: true

    has_many :topics, Discuss.Topic, on_delete: :delete_all

    timestamps()
  end

  @required_fields ~w(email token provider)
  @optional_fields ~w()

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, @required_fields, @optional_fields)
  end
end
