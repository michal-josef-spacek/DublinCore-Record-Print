use strict;
use warnings;

use DublinCore::Record::Print::Texts qw(texts);
use English;
use Error::Pure::Utils qw(clean);
use Test::More 'tests' => 4;
use Test::NoWarnings;
use Unicode::UTF8 qw(decode_utf8);

# Test.
my $ret_hr = texts('ces');
is(keys %{$ret_hr}, 15, 'Number of Czech texts.');

# Test.
$ret_hr = texts('eng');
is(keys %{$ret_hr}, 15, 'Number of English texts.');

# Test.
eval {
	texts('foo');
};
is($EVAL_ERROR, "Language 'foo' doesn't supported.\n",
	"Language 'foo' doesn't supported.");
clean();
