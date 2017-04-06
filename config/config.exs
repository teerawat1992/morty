# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :morty,
  ecto_repos: [Morty.Repo]

# Configures the endpoint
config :morty, Morty.Web.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "xdV5zjHDNK1Ca8NDH93kbZXKt/kMBuiZd08Pv37BNnnrX4oGcMZxrnA6za/j6HJv",
  render_errors: [view: Morty.Web.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Morty.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Configures Omise keys
config :omise,
  public_key: System.get_env("OMISE_PUBLIC_KEY"),
  secret_key: System.get_env("OMISE_SECRET_KEY")

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
