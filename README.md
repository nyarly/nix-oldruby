# Old Ruby Overlay for Nix

[Nixpkgs](https://github.com/nixos/nixpkgs])
quite rightly has removed
old and unsupported
versions of Ruby.
Sadly,
some projects have not
updated their dependencies.
This can leave Nix users in a bind.
Finding myself in
such a predicament,
I cherrypicked details
from the Nixpkgs git history
to create
this overlay.

I'm using it for my purposes.
If it serves yours,
felicitations!
Spare a moment to let me know.
If it breaks,
you can keep both halves.

## How To Use

These directions are
purposely a little vague,
with the idea that the audience
should be able to figure out
how to translate the above
into shell commands.

Clone this repo somewhere.
Then symlink the `overlay.nix` file
into `~/.config/nixpkgs/overlays/` directory.
You should be then able to
`nix-build '<nixpkgs>' -A ruby_2_1`.
(
I'm using 2.1
and make no warantees
about other versions.
Or, to be honest, that one.
)

You can include
old versions of Ruby
into a Nix shell like:

`shell.nix`:
```nix
{ pkgs ? import <nixpkgs> {} }:
let
  inherit (pkgs) lib stdenv bundlerEnv ruby_2_1;

  rubyEnv = bundlerEnv {
    ruby = ruby_2_1;
    name = "creaky old project";
    gemdir = ./.;
  };
in
  pkgs.mkShell {
    buildInputs = [rubyEnv];
  }
```
## Why To Use

Because you're in a fix,
where you can't update the Ruby requirement
of a project,
even though you know you absolutely should.
Also, you're on your own recognizance
to keep these Ruby VMs off
of the public internet.
They're beyond any mainline support,
which includes security patches.

The more I write in this section,
the more I think I should not put this up.
But it might help someone,
so there you are.
Just don't,
you know,
"stare into the lazer with remaining eye."

## Support

As I tried to indicate above,
**none whatsoever.**
You're pretty much on your own.
These version of Ruby
are end-of-life,
and I've got no interest
in maintaining them
over the long haul.

I'll gladly accept pull requests,
with the proviso that
they don't break
whatever workflow
I am currently using this for.

I'll try to tag
any significant merge,
so that we can all
pin to a version that worked for us once.
