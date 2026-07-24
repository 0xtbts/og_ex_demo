defmodule V0_1_0Web.PageHTML do
  @moduledoc """
  This module contains pages rendered by PageController.

  See the `page_html` directory for all templates available.
  """
  use V0_1_0Web, :html

  embed_templates "page_html/*"
end
