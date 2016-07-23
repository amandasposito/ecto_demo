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
end
