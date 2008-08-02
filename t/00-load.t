#!/usr/bin/perl
# 00-load.t - Test loading of SNMP::Info 
# $Id: 00-load.t,v 1.1 2008/07/07 03:59:47 jeneric Exp $

use strict;
use warnings;
use Test::More tests => 1;

BEGIN {
	use_ok( 'SNMP::Info' );
}

diag( "Testing SNMP::Info $SNMP::Info::VERSION, Perl $], $^X" );
