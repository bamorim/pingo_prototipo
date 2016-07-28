defmodule Pingo.AssetHelper do
  def upload_path(path) when is_binary(path) do
    IO.puts "replacing priv/static/ to / in #{path}"
    String.replace(path, "priv/static/", "/")
  end
end
