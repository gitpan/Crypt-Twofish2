BEGIN { $| = 1; print "1..5\n"; }
END {print "not ok 1\n" unless $loaded;}
use Crypt::Twofish2;
$loaded = 1;
print "ok 1\n";

$plaintext = "p" x 32;
$key = "k"  x 32;

$ecb = new Crypt::Twofish2 $key;

$crypted = $ecb->encrypt($plaintext);
print unpack("H*", $crypted) eq "0d00ae47d1792af16f213c804ad21bdf0d00ae47d1792af16f213c804ad21bdf"
      ? "" : "not ", "ok 2\n";
print $ecb->decrypt($crypted) eq $plaintext ? "" : "not ", "ok 3\n";

$cbc = new Crypt::Twofish2 $key, Crypt::Twofish2::MODE_CBC;
$crypted = $cbc->encrypt($plaintext);
print unpack("H*", $crypted) eq "0d00ae47d1792af16f213c804ad21bdfe4293dd580b21a09fab94fc0d9485ba3"
      ? "" : "not ", "ok 4\n";
$cbc = new Crypt::Twofish2 $key, Crypt::Twofish2::MODE_CBC;
print $cbc->decrypt($crypted) eq $plaintext ? "" : "not ", "ok 5\n";


