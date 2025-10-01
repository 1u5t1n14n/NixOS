{ stdenv, fetchFromGitHub }:

stdenv.mkDerivation rec {
	pname = "Kant-O-Mat";
	version = "20250228";

	src = fetchFromGitHub {
		owner = "1u5t1n14n";
		repo = pname;
		rev = "6edce480fc6823eef98a9a7e00e9284219119f6a";
		hash = "sha256-Rha6fvwkFKx7YMbBXpZ7qlsnhtTRO/ZDcVKkdrHCnGM=";
	};

	installPhase = ''
		mkdir -p $out/kant-o-mat
		cp -r * $out/kant-o-mat
	'';
}
