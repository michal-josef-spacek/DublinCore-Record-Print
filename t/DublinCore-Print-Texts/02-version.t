use strict;
use warnings;

use DublinCore::Print::Texts;
use Test::More 'tests' => 2;
use Test::NoWarnings;

# Test.
is($DublinCore::Print::Texts::VERSION, 0.01, 'Version.');
