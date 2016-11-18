defmodule Discuss.Comment do
  use Discuss.Web, :model

  schema "comments" do
    field :content, :string

    belongs_to :user, Discuss.User
    belongs_to :topic, Discuss.Topic

    timestamps()
  end

  @required_fields ~w(content)
  @optional_fields ~w()

  def changeset(struct, params \\ %[]) do
    struct
    |> cast(params, @required_fields, @optional_fields)
    |> validate_required(@required_fields)
  end

end
