defmodule Morty.Application do
  use Application

  def start(_type, _args) do
    import Supervisor.Spec

    children = [
      supervisor(Morty.Repo, []),
      supervisor(Morty.Web.Endpoint, []),
    ]

    opts = [strategy: :one_for_one, name: Morty.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
