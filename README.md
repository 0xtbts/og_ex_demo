# OgEx demos

This umbrella repository keeps runnable examples for released OgEx versions and
individual in-development features.

## Application naming

- Released versions use `v<major>_<minor>_<patch>`, such as `v0_1_0`.
- Feature demonstrations use `f_<feature>`, such as `f_remote_images`.

Each application lives under `apps/` and owns its Phoenix source, tests, assets,
and version-specific OgEx dependency.

## Included applications

### `v0_1_0`

The `apps/v0_1_0` Phoenix application demonstrates the published Hex package:

```elixir
{:og_ex, "~> 0.1"}
```

It includes:

- `/` — wide PNG and links to every other example
- `/square` — square PNG with compact Twitter metadata
- `/svg` — wide SVG
- `/square-svg` — square SVG with compact Twitter metadata

No Rust installation is needed on a supported target. `RustlerPrecompiled`
downloads the checksum-verified native archive attached to the OgEx `v0.1.0`
GitHub release.

## Run locally

Run umbrella commands from the repository root:

```bash
mix setup
mix phx.server
```

Visit [`localhost:4000`](http://localhost:4000).

Run all umbrella checks with:

```bash
mix precommit
```

## Deploy `v0_1_0` on Render

The included `render.yaml` pins compatible Elixir and Erlang/OTP versions and
builds the `v0_1_0` OTP release.

When configuring the service manually, use:

- Language: `Elixir`
- Build command: `./build.sh`
- Start command: `_build/prod/rel/v0_1_0/bin/server`
- `ELIXIR_VERSION`: `1.19.5`
- `ERLANG_VERSION`: `28.3`
- `SECRET_KEY_BASE`: a generated secret

The application uses Render's `RENDER_EXTERNAL_HOSTNAME` when constructing
absolute Open Graph image URLs. Set `PHX_HOST` only for a custom domain.
