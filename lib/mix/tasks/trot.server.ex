defmodule Mix.Tasks.Trot.Server do
  use Mix.Task

  def run(args) do
    Mix.Task.run "app.start", args
    no_halt
  end

  defp no_halt do
    unless iex_running?, do: :timer.sleep(:infinity)
  end

  defp iex_running? do
    Code.ensure_loaded?(IEx) && IEx.started?
  end
end
