defmodule Engweb.Roads.Road do
  use Ecto.Schema
  import Ecto.Changeset

  schema "roads" do
    field :name, :string
    field :num, :integer
    field :description, :string
    field :user_id, :id

    has_many :images, Engweb.Roads.Images
    has_many :current_images, Engweb.Roads.CurrentImages

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(road, attrs) do
    road
    |> cast(attrs, [:num, :name, :description, :user_id])
    |> validate_required([:num, :name, :description, :user_id])
    |> unique_constraint(:num)
  end
end
