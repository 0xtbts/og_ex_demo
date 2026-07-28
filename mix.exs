defmodule OgExDemo.MixProject do
  use Mix.Project

  def project do
    [
      apps_path: "apps",
      version: "0.1.0",
      start_permanent: Mix.env() == :prod,
      listeners: [Phoenix.CodeReloader],
      deps: [],
      aliases: aliases(),
      releases: releases()
    ]
  end

  def cli do
    [
      preferred_envs: [precommit: :test]
    ]
  end

  defp aliases do
    [
      setup: [
        "deps.get",
        "tailwind.install --if-missing",
        "esbuild.install --if-missing",
        "assets.build"
      ],
      "assets.build": [
        "compile",
        "tailwind v0_1_0",
        "esbuild v0_1_0",
        "tailwind f_image_sources",
        "esbuild f_image_sources"
      ],
      "assets.deploy": [
        "tailwind v0_1_0 --minify",
        "esbuild v0_1_0 --minify",
        "tailwind f_image_sources --minify",
        "esbuild f_image_sources --minify",
        "phx.digest"
      ],
      precommit: ["compile --warnings-as-errors", "deps.unlock --unused", "format", "test"]
    ]
  end

  defp releases do
    [
      v0_1_0: [
        applications: [v0_1_0: :permanent]
      ],
      f_image_sources: [
        applications: [f_image_sources: :permanent]
      ]
    ]
  end
end
