defmodule MdfTest do
  use ExUnit.Case, async: true
	use Plug.Test

	@opts Mdf.Router.init([])
	
  test "returns welcome message" do
		conn = conn(:get, "/")
		conn = Mdf.Router.call(conn, @opts)

		assert conn.state == :sent
		assert conn.status == 200
		assert conn.resp_body == "Welcome to MDF!!"
  end

	test "returns 404" do
		conn = conn(:get, "/fluffy")
		conn = Mdf.Router.call(conn, @opts)

		assert conn.state == :sent
		assert conn.status == 404
		assert conn.resp_body == "shiz!"
	end
end
