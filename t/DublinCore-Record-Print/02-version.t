use strict;
use warnings;

use DublinCore::Record::Print;
use Test::More 'tests' => 2;
use Test::NoWarnings;

# Test.
is($DublinCore::Record::Print::VERSION, 0.01, 'Version.');
