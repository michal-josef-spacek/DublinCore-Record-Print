use strict;
use warnings;

use Test::NoWarnings;
use Test::Pod::Coverage 'tests' => 2;

# Test.
pod_coverage_ok('DublinCore::Record::Print', 'DublinCore::Record::Print is covered.');
