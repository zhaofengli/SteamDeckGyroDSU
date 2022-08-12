{ lib, stdenv, ncurses }:

stdenv.mkDerivation {
  pname = "sdgyrodsu";
  version = "1.14";

  src = ./.;

  buildInputs = [ ncurses ];

  makeFlags = [ "NOPREPARE=1" "release" ];

  installPhase = ''
    runHook preInstall

    mkdir -p $out/bin
    cp -r bin/release/sdgyrodsu $out/bin

    runHook postInstall
  '';

  meta = with lib; {
    description = "Cemuhook DSU server for the Steam Deck Gyroscope";
    homepage = "https://github.com/kmicki/SteamDeckGyroDSU";
    license = licenses.mit;
  };
}
