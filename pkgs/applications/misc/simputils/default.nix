{ stdenv, fetchurl, linkedlist }:

stdenv.mkDerivation rec {
  name = "simputils-0.02";

  #src = fetchurl {
  #  url = "mirror://gnu/hello/${name}.tar.gz";
  #  sha256 = "0ssi1wpaf7plaswqqjwigppsg5fyh99vdlb9kzl7c9lng89ndq1i";
  #};
  src = "/home/richardipsum/projects/personal/utils";

  buildInputs = [ linkedlist ];
  propagatedBuildInputs = [ linkedlist ];

  preBuild = ''
      makeFlagsArray=(
        INCS="${linkedlist}/include"
        LDFLAGS="-L ${linkedlist}/lib -llinkedlist"
        LIBDIR="${linkedlist}/lib"
        PREFIX="$out"
        );
    '';

  meta = {
    description = "A program that produces a familiar, friendly greeting";
    longDescription = ''
      GNU Hello is a program that prints "Hello, world!" when you run it.
      It is fully customizable.
    '';
    homepage = http://www.gnu.org/software/hello/manual/;
    license = stdenv.lib.licenses.gpl3Plus;
    maintainers = [ stdenv.lib.maintainers.eelco ];
    platforms = stdenv.lib.platforms.all;
  };
}
