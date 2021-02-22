defmodule Worker do
  use GenServer

  def init(tweetContent) do
    {:ok, tweetContent}
  end

  def start_link(tweetContent) do
    GenServer.start_link(__MODULE__, tweetContent, name: __MODULE__)
  end

  def handle_cast({:worker, tweetContent}, state) do
    IO.inspect(%{"Current tweet: " => tweetContent})
    {:noreply, state}
  end
end