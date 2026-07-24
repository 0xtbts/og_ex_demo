defmodule OgExDemo.MixProject do
  use Mix.Project

  def project do
    [
      apps_path: "apps",
      version: "0.1.0",
      start_permanent: Mix.env() == :prod,
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
      "assets.build": ["compile", "tailwind v0_1_0", "esbuild v0_1_0"],
      "assets.deploy": [
        "tailwind v0_1_0 --minify",
        "esbuild v0_1_0 --minify",
        "phx.digest"
      ],
      precommit: ["compile --warnings-as-errors", "deps.unlock --unused", "format", "test"]
    ]
  end

  defp releases do
    [
      v0_1_0: [
        applications: [v0_1_0: :permanent]
      ]
    ]
  end
end
