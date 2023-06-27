use strict;
use warnings;

use DublinCore::Print;
use Test::More 'tests' => 2;
use Test::NoWarnings;

# Test.
is($DublinCore::Print::VERSION, 0.01, 'Version.');
