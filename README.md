# sunsetr-flake

A Nix flake for [sunsetr](https://github.com/psi4j/sunsetr): an automatic blue light filter for Hyprland, Niri, and other Wayland compositors.

This flake provides the prebuilt `sunsetr` binary for `x86_64-linux`.

## Usage

Add the flake to your inputs:

```nix
{
  inputs.sunsetr.url = "github:scottmckendry/sunsetr-flake";
}
```

Then, add to your NixOS configuration or home-manager configuration.

For NixOS, you can use it in your `configuration.nix` like this:

```nix
{ config, pkgs, ... }:
{
  environment.systemPackages = [inputs.sunsetr.packages.${pkgs.system}.default ];

  # OR in home-manager:
  # home.packages = [ inputs.sunsetr.packages.${pkgs.system}.default ];
}
```

## Docs

See the [upstream README](https://github.com/psi4j/sunsetr) for configuration, compositor integration, and advanced usage.

## Supported platforms

- `x86_64-linux` only (prebuilt binary)

## License

- sunsetr: [MIT](https://github.com/psi4j/sunsetr/blob/main/LICENSE)
- This flake: MIT

---

Maintained by [@scottmckendry](https://github.com/scottmckendry). Upstream project by [@psi4j](https://github.com/psi4j).
