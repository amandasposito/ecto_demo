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
iex(1)> EctoDemo.completed_enrollments()
```
```sh
iex(1)> EctoDemo.course_classes()
```
```sh
iex(1)> EctoDemo.course_classes_without_preload()
```
```sh
iex(1)> EctoDemo.update_user_name()
```
```sh
iex(1)> EctoDemo.insert_multiple_users()
```
```sh
iex(1)> EctoDemo.schemalless_changset()
```
```sh
iex(1)> EctoDemo.with_minimum()
```
