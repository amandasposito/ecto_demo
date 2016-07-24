# Ecto Demo

From the command line:

```sh
$ mix do deps.get, compile
$ mix ecto.create
$ mix ecto.migrate
$ mix run priv/repo/seeds.exs
$ iex -S mix
```

Inside IEx, run:
```sh
$ EctoDemo.completed_enrollments()
```
```sh
$ EctoDemo.course_classes()
```
