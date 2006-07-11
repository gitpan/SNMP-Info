# SNMP::Info::Layer3::Cisco
# Max Baker
#
# Copyright (c) 2004-6 Max Baker
# 
# Redistribution and use in source and binary forms, with or without 
# modification, are permitted provided that the following conditions are met:
# 
#     * Redistributions of source code must retain the above copyright notice,
#       this list of conditions and the following disclaimer.
#     * Redistributions in binary form must reproduce the above copyright notice,
#       this list of conditions and the following disclaimer in the documentation
#       and/or other materials provided with the distribution.
#     * Neither the name of the University of California, Santa Cruz nor the 
#       names of its contributors may be used to endorse or promote products 
#       derived from this software without specific prior written permission.
# 
# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
# ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED 
# WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE 
# DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR
# ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
# (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; 
# LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON
# ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT 
# (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS 
# SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

package SNMP::Info::Layer3::Cisco;
# $Id: Cisco.pm,v 1.10 2006/06/30 21:32:49 jeneric Exp $

use strict;

use Exporter;
use SNMP::Info::Layer3;
use SNMP::Info::CiscoVTP;
use SNMP::Info::CDP;
use SNMP::Info::CiscoStats;
use SNMP::Info::CiscoImage;
use SNMP::Info::CiscoRTT;
use SNMP::Info::CiscoQOS;

use vars qw/$VERSION $DEBUG %GLOBALS %MIBS %FUNCS %MUNGE $INIT/ ;
$VERSION = '1.04';
@SNMP::Info::Layer3::Cisco::ISA = qw/SNMP::Info::Layer3 SNMP::Info::CiscoVTP 
                                     SNMP::Info::CDP    SNMP::Info::CiscoStats 
                                     SNMP::Info::CiscoImage SNMP::Info::CiscoRTT
                                     SNMP::Info::CiscoQOS Exporter/;
@SNMP::Info::Layer3::Cisco::EXPORT_OK = qw//;

%MIBS = (
            %SNMP::Info::Layer3::MIBS,  
            %SNMP::Info::CiscoVTP::MIBS,
            %SNMP::Info::CDP::MIBS,
            %SNMP::Info::CiscoStats::MIBS,
            %SNMP::Info::CiscoImage::MIBS,
            %SNMP::Info::CiscoRTT::MIBS,
            %SNMP::Info::CiscoQOS::MIBS,
        );

%GLOBALS = (
            %SNMP::Info::Layer3::GLOBALS,
            %SNMP::Info::CiscoVTP::GLOBALS,
            %SNMP::Info::CDP::GLOBALS,
            %SNMP::Info::CiscoStats::GLOBALS,
            %SNMP::Info::CiscoImage::GLOBALS,
            %SNMP::Info::CiscoRTT::GLOBALS,
            %SNMP::Info::CiscoQOS::GLOBALS,
           );

%FUNCS = (
            %SNMP::Info::Layer3::FUNCS,
            %SNMP::Info::CiscoVTP::FUNCS,
            %SNMP::Info::CDP::FUNCS,
            %SNMP::Info::CiscoStats::FUNCS,
            %SNMP::Info::CiscoImage::FUNCS,
            %SNMP::Info::CiscoRTT::FUNCS,
            %SNMP::Info::CiscoQOS::FUNCS,
         );

%MUNGE = (
            %SNMP::Info::Layer3::MUNGE,
            %SNMP::Info::CiscoVTP::MUNGE,
            %SNMP::Info::CDP::MUNGE,
            %SNMP::Info::CiscoStats::MUNGE,
            %SNMP::Info::CiscoImage::MUNGE,
            %SNMP::Info::CiscoRTT::MUNGE,
            %SNMP::Info::CiscoQOS::MUNGE,
         );

1;
__END__

=head1 NAME

SNMP::Info::Layer3::Cisco - Perl5 Interface to L3 and L2+L3 IOS Cisco Device
that are not covered in other classes.

=head1 AUTHOR

Max Baker

=head1 SYNOPSIS

 # Let SNMP::Info determine the correct subclass for you. 
 my $cisco = new SNMP::Info(
                          AutoSpecify => 1,
                          Debug       => 1,
                          # These arguments are passed directly on to SNMP::Session
                          DestHost    => 'myswitch',
                          Community   => 'public',
                          Version     => 2
                        ) 
    or die "Can't connect to DestHost.\n";

 my $class      = $cisco->class();
 print "SNMP::Info determined this device to fall under subclass : $class\n";

=head1 DESCRIPTION

Subclass for Generic Cisco Routers running IOS

=head2 Inherited Classes

=over

=item SNMP::Info::Layer3

=item SNMP::Info::CiscoVTP

=item SNMP::Info::CDP

=item SNMP::Info::CiscoStats

=item SNMP::Info::CiscoImage

=back

=head2 Required MIBs

=over

=item Inherited Classes' MIBs

See SNMP::Info::Layer3 for its own MIB requirements.

See SNMP::Info::CiscoVTP for its own MIB requirements.

See SNMP::Info::CiscoStats for its own MIB requirements.

See SNMP::Info::CDP for its own MIB requirements.

See SNMP::Info::CiscoImage for its own MIB requirements.

=back

=head1 GLOBALS

These are methods that return scalar value from SNMP

=over

=item $cisco->vendor()

    Returns 'cisco'

=back

=head2 Globals imported from SNMP::Info::Layer3

See documentation in SNMP::Info::Layer3 for details.

=head2 Global Methods imported from SNMP::Info::CiscoVTP

See documentation in SNMP::Info::CiscoVTP for details.

=head2 Globals imported from SNMP::Info::CDP

See documentation in SNMP::Info::CDP for details.

=head2 Globals imported from SNMP::Info::CiscoStats

See documentation in SNMP::Info::CiscoStats for details.

=head2 Globals imported from SNMP::Info::CiscoImage

See documentation in SNMP::Info::CiscoImage for details.

=head1 TABLE ENTRIES

These are methods that return tables of information in the form of a reference
to a hash.

=head2 Table Methods imported from SNMP::Info::Layer3

See documentation in SNMP::Info::Layer3 for details.

=head2 Table Methods imported from SNMP::Info::CiscoVTP

See documentation in SNMP::Info::CiscoVTP for details.

=head2 Table Methods imported from SNMP::Info::CDP

See documentation in SNMP::Info::CDP for details.

=head2 Table Methods imported from SNMP::Info::CiscoStats

See documentation in SNMP::Info::CiscoStats for details.

=head2 Table Methods imported from SNMP::Info::CiscoImage

See documentation in SNMP::Info::CiscoImage for details.

=cut