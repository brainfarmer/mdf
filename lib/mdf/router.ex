defmodule Mdf.Router do
	use Plug.Router

	plug Plug.Logger
	plug :match
	plug :dispatch

	get "/" do
		send_resp(conn, 200, "Welcome to MDF!!")
	end

	match _ do
		send_resp(conn, 404, "shiz!")
	end
end
