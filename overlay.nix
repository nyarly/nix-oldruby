self: super: {
  inherit (super.callPackage ./default.nix {
    inherit (self.darwin) libiconv libobjc libunwind;
    inherit (self.darwin.apple_sdk.frameworks) Foundation;
  })
  ruby_2_0
  ruby_2_1
  ruby_2_2;
}
