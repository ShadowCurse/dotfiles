{ qt6Packages, makeScopeWithSplicing', generateSplicesForMkScope }:

makeScopeWithSplicing' {
  otherSplices = generateSplicesForMkScope "yuzuPackages";
  f = self: qt6Packages // {
    mainline = self.callPackage ./mainline.nix {};
  };
}
