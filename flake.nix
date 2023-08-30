{
  description = "Wasabi wallet coordinator";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
  outputs = { self, nixpkgs }:
    let
        pkgs = import nixpkgs { system = "x86_64-linux"; }; #nixpkgs.legacyPackages.x86_64-linux;
        backend-build = pkgs.buildDotnetModule rec {
          pname = "WalletWasabi.Backend";
          version = "2.0.4.0";
          nugetDeps = ./deps.nix; # nix build .#packages.x86_64-linux.default.passthru.fetch-deps
          dotnet-runtime = pkgs.dotnetCorePackages.aspnetcore_7_0;
          dotnet-sdk = pkgs.dotnetCorePackages.sdk_7_0;
          executebles = ["WalletWasabi.Backend.dll"];
          src = pkgs.fetchFromGitHub {
            owner = "zksnacks";
            repo = "WalletWasabi";
            rev = "f36569797ca93de17f2f5a1b6d3e5f8e800a5199";
            sha256 = "sha256-dwwo1bwpPzajek7Pm+tz/0TQRRC4pLwxMpGEaQ5AbPU=";
          };
          projectFile = "WalletWasabi.Backend/WalletWasabi.Backend.csproj";
          executables = [ "WalletWasabi.Backend" ];

          doCheck = false;
        };
    in
    {
      defaultPackage.x86_64-linux = self.packages.x86_64-linux.default;
      packages.x86_64-linux.default = backend-build;
    };
}
