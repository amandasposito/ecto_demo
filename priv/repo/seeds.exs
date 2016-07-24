
# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Simple.Repo.insert!(%SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

defmodule Seeds do
  def import() do
    EctoDemo.Repo.start_link()

    EctoDemo.Repo.transaction fn ->
      user = EctoDemo.Repo.insert!(%EctoDemo.User{name: "Jane Doe", age: 27, email: "jane.doe@gmail.com"})

      course = EctoDemo.Repo.insert!(%EctoDemo.Course{name: "Meet Elixir", description: "Write concurrent programs with the Elixir language."})

      class = EctoDemo.Repo.insert!(%EctoDemo.Class{course_id: course.id, name: "Concurrency and Macros", address: "Paulista Avenue - Bela Vista - Sao Paulo", attendees: 30})

      EctoDemo.Repo.insert!(%EctoDemo.Enrollment{class_id: class.id, user_id: user.id, status: "completed"})
    end
  end
end

Seeds.import()
