use strict;
use warnings;

use Test::More 'tests' => 3;
use Test::NoWarnings;

BEGIN {

	# Test.
	use_ok('DublinCore::Print::Texts');
}

# Test.
require_ok('DublinCore::Print::Texts');
