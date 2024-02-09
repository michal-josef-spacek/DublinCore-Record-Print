use strict;
use warnings;

use DublinCore::Record::Print;
use English;
use Error::Pure::Utils qw(clean);
use Test::More 'tests' => 4;
use Test::NoWarnings;

# Test.
my $obj = DublinCore::Record::Print->new;
isa_ok($obj, 'DublinCore::Record::Print');

# Test.
eval {
	DublinCore::Record::Print->new(
		'lang' => undef,
	);
};
is($EVAL_ERROR, "Parameter 'lang' is required.\n",
	"Parameter 'lang' is required.");
clean();

# Test.
eval {
	DublinCore::Record::Print->new(
		'lang' => 'ooo',
	);
};
is($EVAL_ERROR, "Language 'ooo' doesn't supported.\n",
	"Language 'ooo' doesn't supported.");
clean();
