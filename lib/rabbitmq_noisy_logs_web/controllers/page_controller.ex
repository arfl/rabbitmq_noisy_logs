defmodule RabbitmqNoisyLogsWeb.PageController do
  use RabbitmqNoisyLogsWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
