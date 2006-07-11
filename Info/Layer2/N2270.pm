# SNMP::Info::Layer2::N2270
# Eric Miller
# $Id: N2270.pm,v 1.5 2006/06/30 21:31:30 jeneric Exp $
#
# Copyright (c) 2005 Eric Miller
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

package SNMP::Info::Layer2::N2270;
$VERSION = '1.04';
use strict;

use Exporter;
use SNMP::Info;
use SNMP::Info::Bridge;
use SNMP::Info::SONMP;
use SNMP::Info::Airespace;

@SNMP::Info::Layer2::N2270::ISA = qw/SNMP::Info SNMP::Info::Bridge SNMP::Info::SONMP SNMP::Info::Airespace Exporter/;
@SNMP::Info::Layer2::N2270::EXPORT_OK = qw//;

use vars qw/$VERSION %FUNCS %GLOBALS %MIBS %MUNGE $AUTOLOAD $INIT $DEBUG/;

%MIBS    = (
            %SNMP::Info::MIBS,
            %SNMP::Info::Bridge::MIBS,
            %SNMP::Info::SONMP::MIBS,
            %SNMP::Info::Airespace::MIBS,
            );

%GLOBALS = (
            %SNMP::Info::GLOBALS,
            %SNMP::Info::Bridge::GLOBALS,
            %SNMP::Info::SONMP::GLOBALS,
            %SNMP::Info::Airespace::GLOBALS,
            );

%FUNCS   = (
            %SNMP::Info::FUNCS,
            %SNMP::Info::Bridge::FUNCS,
            %SNMP::Info::SONMP::FUNCS,
            %SNMP::Info::Airespace::FUNCS,
            );

%MUNGE   = (
          %SNMP::Info::MUNGE,
          %SNMP::Info::Bridge::MUNGE,
          %SNMP::Info::SONMP::MUNGE,
          %SNMP::Info::Airespace::MUNGE,
            );

sub os {
    return 'nortel';
}

sub vendor {
    return 'nortel';
}

sub model {
    my $n2270 = shift;
    my $id = $n2270->id();
    return undef unless defined $id;
    my $model = &SNMP::translateObj($id);
    return $id unless defined $model;
    $model =~ s/^sreg-WLANSecuritySwitch//i;

    return $model;
}

sub index_factor {
    return 256;
}

sub slot_offset {
    return 0;
}

1;
__END__

=head1 NAME

SNMP::Info::Layer2::N2270 - SNMP Interface to Nortel 2270 Series Wireless Switch

=head1 AUTHOR

Eric Miller

=head1 SYNOPSIS

    #Let SNMP::Info determine the correct subclass for you.

    my $n2270 = new SNMP::Info(
                          AutoSpecify => 1,
                          Debug       => 1,
                          # These arguments are passed directly on to SNMP::Session
                          DestHost    => 'myswitch',
                          Community   => 'public',
                          Version     => 2
                        ) 

    or die "Can't connect to DestHost.\n";

    my $class = $n2270->class();
    print " Using device sub class : $class\n";

=head1 DESCRIPTION

Provides abstraction to the configuration information obtainable from a 
Nortel 2270 Series Wireless Switch through SNMP.

For speed or debugging purposes you can call the subclass directly, but not after
determining a more specific class using the method above. 

my $n2270 = new SNMP::Info::Layer2::N2270(...);

=head2 Inherited Classes

=over

=item SNMP::Info

=item SNMP::Info::Bridge

=item SNMP::Info::SONMP

=item SNMP::Info::Airespace

=back

=head2 Required MIBs

=over

=item Inherited Classes' MIBs

See SNMP::Info for its own MIB requirements.

See SNMP::Info::Bridge for its own MIB requirements.

See SNMP::Info::SONMP for its own MIB requirements.

See SNMP::Info::Airespace for its own MIB requirements.

=back

=head1 GLOBALS

These are methods that return scalar value from SNMP

=over

=item $n2270->vendor()

Returns 'nortel'

=item $n2270->os()

Returns 'nortel'

=item $n2270->model()

Cross references $bayhub->id() to the SYNOPTICS-ROOT-MIB and returns
the results.

Removes sreg-WLANSecuritySwitch from the model name

=back

=head2 Overrides

=over

=item  $bayhub->index_factor()

Required by SNMP::Info::SONMP.  Number representing the number of ports
reserved per slot within the device MIB.  Returns 256.

=item $bayhub->slot_offset()

Required by SNMP::Info::SONMP.  Offset if slot numbering does not
start at 0.  Returns 0.

=back

=head2 Globals imported from SNMP::Info

See documentation in SNMP::Info for details.

=head2 Globals imported from SNMP::Info::Bridge

See documentation in SNMP::Info::Bridge for details.

=head2 Global Methods imported from SNMP::Info::SONMP

See documentation in SNMP::Info::SONMP for details.

=head2 Global Methods imported from SNMP::Info::Airespace

See documentation in SNMP::Info::Airespace for details.

=head1 TABLE ENTRIES

These are methods that return tables of information in the form of a reference
to a hash.

=head2 Overrides

=over

=item None

=back

=head2 Table Methods imported from SNMP::Info

See documentation in SNMP::Info for details.

=head2 Table Methods imported from SNMP::Info::Bridge

See documentation in SNMP::Info::Bridge for details.

=head2 Table Methods imported from SNMP::Info::SONMP

See documentation in SNMP::Info::SONMP for details.

=head2 Table Methods imported from SNMP::Info::Airespace

See documentation in SNMP::Info::Airespace for details.

=cut