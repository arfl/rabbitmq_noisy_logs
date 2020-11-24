# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

# Configures the endpoint
config :rabbitmq_noisy_logs, RabbitmqNoisyLogsWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "hFdNrWODIyoqnSecoOwxDgi8WYrkaxGRBzQpoYkrWuVlwQ6D0G6fkeTe7AUQor0u",
  render_errors: [view: RabbitmqNoisyLogsWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: RabbitmqNoisyLogs.PubSub,
  live_view: [signing_salt: "JMAMVbvN"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id],
  handle_otp_reports: false

:logger.add_primary_filter(
  :ignore_rabbitmq_progress_reports,
  {&:logger_filters.domain/2, {:stop, :equal, [:progress]}}
)

config :lager,
  error_logger_redirect: false,
  handlers: [level: :critical]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
