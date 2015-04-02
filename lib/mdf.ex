require Logger

defmodule Mdf do
  use Application

  def start(_type, _args) do
		opts = [port: 4000]

		if port = System.get_env("PORT") do
			opts = Keyword.put(opts, :port, String.to_integer(port))
		end

		Logger.info "Starting Cowboy on port #{opts[:port]}"
		Supervisor.start_link([
			Plug.Adapters.Cowboy.child_spec(:http, Mdf.Router, [], opts)
			], strategy: :one_for_one)
  end
end
