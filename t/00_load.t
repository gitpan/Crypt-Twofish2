BEGIN { $| = 1; print "1..5\n"; }
END {print "not ok 1\n" unless $loaded;}
use Crypt::Twofish2;
$loaded = 1;
print "ok 1\n";

$plaintext = "p" x 32;
$key = "k"  x 32;

$ecb = new Crypt::Twofish2 $key;

$crypted = $ecb->encrypt($plaintext);
print substr($crypted,0,16) eq substr($crypted,16,16) ? "" : "not ", "ok 2\n";
print $ecb->decrypt($crypted) eq $plaintext ? "" : "not ", "ok 3\n";

$cbc = new Crypt::Twofish2 $key;
$crypted = $cbc->encrypt($plaintext);
print substr($crypted,0,16) eq substr($crypted,16,16) ? "" : "not ", "ok 4\n";
print $cbc->decrypt($crypted) eq $plaintext ? "" : "not ", "ok 5\n";


