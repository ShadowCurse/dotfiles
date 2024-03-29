{ stdenv, fetchFromGitHub, unstableGitUpdater }:
stdenv.mkDerivation {
  pname = "yuzu-compatibility-list";
  version = "unstable-2024-02-26";

  src = fetchFromGitHub {
    owner = "ShadowCurse";
    repo = "org.yuzu_emu.yuzu";
    rev = "4abf1d239aba843180abfed58fa8541432fece5b";
    hash = "sha256-rBnsW8ijDEPCXzIkbfQnyhSFhIv91+jIkNPosVHJ2UY=";
  };

  buildCommand = ''
    cp $src/compatibility_list.json $out
  '';

  passthru.updateScript = unstableGitUpdater {};
}
