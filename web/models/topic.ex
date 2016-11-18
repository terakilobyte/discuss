defmodule Discuss.Topic do
  use Discuss.Web, :model

  schema "topics" do
    field :title, :string

    belongs_to :user, Discuss.User
    has_many :comments, Discuss.Comment

    timestamps()
  end

  @required_fields ~w(title)
  @optional_fields ~w()

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:title])
    |> validate_required([:title])
    |> validate_length(:title, min: 5)
    |> validate_length(:title, max: 25)
  end
end
