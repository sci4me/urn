{ nixpkgs ? import <nixpkgs> {}
, enableLuaJit ? false
, lua ? nixpkgs.pkgs.lua
, luajit ? nixpkgs.pkgs.luajit
, readline ? nixpkgs.pkgs.readline
}:

let
  inherit (nixpkgs) stdenv;
  ourVersion = "0.4.4";

  # Build a sort of "union package" with all the native dependencies we
  # have: Lua (or LuaJIT), readline, etc. Then, we can depend on this
  # and refer to ${runtime} instead of ${lua}, ${readline}, etc
  runtime = nixpkgs.buildEnv {
    name = "urn-rt-${ourVersion}";
    ignoreCollisions = true;
    paths = if enableLuaJit then
              [ luajit readline ]
            else
              [ lua ];
  };
in
stdenv.mkDerivation rec {
  name = "urn";
  version = ourVersion;
  src = ./.;

  buildInputs = [ runtime nixpkgs.pkgs.makeWrapper ];

  makeFlags = ["-B"];

  installPhase = ''
  install -Dm755 bin/urn.lua $out/bin/urn
  mkdir -p $out/lib/
  cp -r lib $out/lib/urn
  wrapProgram $out/bin/urn \
    --add-flags "-i $out/lib/urn --prelude $out/lib/urn/prelude.lisp" \
    --prefix PATH : ${runtime}/bin/ \
    --prefix LD_LIBRARY_PATH : ${runtime}/lib/
  '';

  meta = with stdenv.lib; {
    homepage = https://squiddev.github.io/urn;
    description = "A lean lisp implementation for Lua";
    license = licenses.bsd3;
  };
}
