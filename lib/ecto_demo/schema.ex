defmodule EctoDemo.User do
  use Ecto.Schema

  schema "users" do
    field :name

    timestamps
  end
end

defmodule EctoDemo.Course do
  use Ecto.Schema

  schema "courses" do
    field :name
    field :description

    has_many :classes, EctoDemo.Class

    timestamps
  end
end

defmodule EctoDemo.Class do
  use Ecto.Schema

  schema "classes" do
    field :name
    field :address
    field :attendees

    belongs_to :course, EctoDemo.Course
    has_many :enrollments, EctoDemo.Enrollment

    timestamps
  end
end

defmodule EctoDemo.Enrollment do
  use Ecto.Schema

  schema "enrollments" do
    field :status

    belongs_to :class, EctoDemo.Class
    belongs_to :user, EctoDemo.User

    timestamps
  end
end
