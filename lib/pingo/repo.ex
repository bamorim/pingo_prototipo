defmodule Pingo.Repo do
  use Ecto.Repo, otp_app: :pingo
  use Scrivener, page_size: 10
end
