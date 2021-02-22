defmodule Router do
  use GenServer

  def start_link(message) do
    GenServer.start_link(__MODULE__, message, name: __MODULE__)
  end

  @impl true
  def init(message) do
    {:ok, message}
  end

  @impl true
  def handle_cast({:router, message}, state) do
    TweetDynamicSupervisor.addWorker(message)
    GenServer.cast(Worker, {:worker, message})
    {:noreply, state}
  end

end