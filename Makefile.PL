# SNMP::Info -  Makefile.PL
# $Id: Makefile.PL,v 1.2 2003/02/19 17:38:30 maxbaker Exp $

use ExtUtils::MakeMaker;
WriteMakefile(
    'NAME'               => 'SNMP::Info',
    'VERSION_FROM'       => 'Info.pm',
    'PREREQ_PM'          => {'SNMP' => '4'},
    ($] >= 5.005 ?    
          (ABSTRACT_FROM => 'Info.pm', 
           AUTHOR        => 'Max Baker <max@warped.org>')
                 : () 
    ),
    'PMLIBDIRS'          => ['Info','$(BASEEXT)'],
             );

sub MY::postamble { "
.PHONY: readme
readme:
	pod2text -l Info.pm > README" }
