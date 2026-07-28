# TODO

## Isolate every demo as its own Mix project

Replace the umbrella with multiple independent Elixir/Phoenix projects kept in
the same Git repository:

```text
og_ex_demo/
├── fonts/
├── v0_1_0/
├── f_image_sources/
└── ...
```

Each directory should have its own `mix.exs`, `mix.lock`, `config/`, `deps/`,
`_build/`, release configuration, and deployment entry point. This is required
because a Mix umbrella shares one dependency graph and therefore cannot run
different OgEx versions in sibling applications.

Keep the top-level fonts as the single source and retain relative `priv/fonts`
symlinks in each project. Add top-level scripts or a small Makefile for running
setup, tests, asset builds, and precommit checks across every independent demo.

After the migration:

- `v0_1_0` must resolve the published `{:og_ex, "~> 0.1"}` package.
- Feature projects may use an adjacent path dependency and source-build NIFs.
- Each project must be runnable and deployable without loading another demo.
- Render deployments must select one demo directory as their root.

