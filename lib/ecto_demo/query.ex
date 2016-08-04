defmodule EctoDemo do
  import Ecto.Query

  def completed_enrollments() do
    EctoDemo.Repo.start_link()

    query = (from c in EctoDemo.Course,
             join: class in assoc(c, :classes),
             join: enrollment in assoc(class, :enrollments),
             where: enrollment.status == "completed" or enrollment.status == "dismissed",
             select: enrollment)

    EctoDemo.Repo.all(query)
  end

  # preload
  def course_classes() do
    EctoDemo.Repo.start_link()

    query = (from c in EctoDemo.Course,
             join: class in assoc(c, :classes),
             preload: [classes: class],
             select: c)

    EctoDemo.Repo.all(query)
  end

  def update_user_name() do
    EctoDemo.Repo.start_link()

    EctoDemo.User
    |> EctoDemo.Repo.get!(1)
    |> Ecto.Changeset.cast(%{name: "Mary Doe"}, [:name, :email, :age])
    |> EctoDemo.Repo.update!
  end

  def insert_multiple_users() do
    EctoDemo.Repo.start_link()

    EctoDemo.Repo.insert_all(EctoDemo.User, [[name: "Frankie Doe", email: "frankie.doe@gmail.com", age: 21, inserted_at: Ecto.DateTime.utc, updated_at: Ecto.DateTime.utc],
                                             [name: "John Doe", email: "john.doe@gmail.com", age: 27, inserted_at: Ecto.DateTime.utc, updated_at: Ecto.DateTime.utc]])
  end

  def schemalless_changset() do
    data  = %{}
    types = %{name: :string, email: :string, age: :integer, inserted_at: :datetime, updated_at: :datetime}

    changeset =
      {data, types} # The data+types tuple is equivalent to %EctoDemo.User{}
      |> Ecto.Changeset.cast(%{name: "Jake Doe", email: "jake.doe@gmail.com", age: 19, inserted_at: Ecto.DateTime.utc, updated_at: Ecto.DateTime.utc}, Map.keys(types))
      |> Ecto.Changeset.validate_required([:name, :email, :age])

    if changeset.valid? do
      user = Ecto.Changeset.apply_changes(changeset)

      EctoDemo.Repo.start_link()

      EctoDemo.Repo.insert_all "users", [user]

      {:ok, user}
    else
      {:error, changeset}
    end
  end

  def with_minimum(age) do
    EctoDemo.Repo.start_link()

    query = from u in "users",
            where: u.age > type(^age, :integer),
            select: u.name

    EctoDemo.Repo.all(query)
  end
end
