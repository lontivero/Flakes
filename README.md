# Wasabi Coordinator

### On Linux x86_64 only

#### Install

Install nix (not necessary on NixOS):

```sh
sh <(curl -L https://nixos.org/nix/install) --daemon
```

Open a new terminal and edit either `~/.config/nix/nix.conf` or `/etc/nix/nix.conf` and add:

```text
experimental-features = nix-command flakes
```

If Nix was installed in multi-user mode, make sure to restart the nix-daemon.
If you don't know how to do this, restarting your computer will also do the job.

#### Usage

Now with nix set up, you just need to run one command:

```sh
$ nix run github:lontivero/flakes
```

And that's it! Wasabi Backend is running
