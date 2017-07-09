{ stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "linkedlist-0.01";

  src = fetchurl {
    url = "https://git.gitano.org.uk/personal/richardipsum/linkedlist.git/snapshot/linkedlist-d662fd43a16b912e29ce50e44e317ffd7b16d245.tar.bz2";
    sha256 = "1k5yb4kcxxjyg21ywkmkrbs9ajpws23aqqvqcdpr9rxn8d57df1p";
  };
  #src = "/home/richardipsum/projects/personal/linkedlist";

  preBuild = ''
      makeFlagsArray=(
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
