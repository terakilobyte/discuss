defmodule Discuss.Topic do
  use Discuss.Web, :model

  schema "topics" do
    field :subject, :string

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:subject])
    |> validate_required([:subject])
  end
end
