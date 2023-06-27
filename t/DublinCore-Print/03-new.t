use strict;
use warnings;

use DublinCore::Print;
use Test::More 'tests' => 2;
use Test::NoWarnings;

# Test.
my $obj = DublinCore::Print->new;
isa_ok($obj, 'DublinCore::Print');
