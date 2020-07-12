use Mix.Config

# Configure your database
config :char_db, CharDb.Repo,
  username: "postgres",
  password: "postgres",
  database: "char_db_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :char_db, CharDbWeb.Endpoint,
  http: [port: 4002],
  server: false

config :char_db,
  user: UserMock,
  token: TokenMock

# Print only warnings and errors during test
config :logger, level: :warn
