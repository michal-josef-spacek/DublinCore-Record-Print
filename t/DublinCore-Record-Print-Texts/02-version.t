use strict;
use warnings;

use DublinCore::Record::Print::Texts;
use Test::More 'tests' => 2;
use Test::NoWarnings;

# Test.
is($DublinCore::Record::Print::Texts::VERSION, 0.01, 'Version.');
