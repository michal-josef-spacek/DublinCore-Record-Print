use strict;
use warnings;

use DublinCore::Record::Print;
use English;
use Error::Pure::Utils qw(clean);
use Test::MockObject;
use Test::More 'tests' => 4;
use Test::NoWarnings;

# Test.
my $obj = DublinCore::Record::Print->new;
eval {
	$obj->print;
};
is($EVAL_ERROR, "No Dublin Core object to print.\n",
	"No Dublin Core object to print.");

# Test.
$obj = DublinCore::Record::Print->new;
eval {
	$obj->print('bad');
};
is($EVAL_ERROR, "Bad Dublin Core object to print.\n",
	"Bad Dublin Core object to print (string).");

# Test.
$obj = DublinCore::Record::Print->new;
my $tmp_obj = Test::MockObject->new;
eval {
	$obj->print($tmp_obj);
};
is($EVAL_ERROR, "Bad Dublin Core object to print.\n",
	"Bad Dublin Core object to print (bad object).");
