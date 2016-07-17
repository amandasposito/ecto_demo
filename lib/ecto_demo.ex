defmodule EctoDemo.App do
  use Application

  def start(_type, _args) do
    import Supervisor.Spec

    children = [
      supervisor(EctoDemo.Repo, [])
    ]

    opts = [strategy: :one_for_one, name: EctoDemo.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
