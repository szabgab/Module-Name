use strict;
use warnings;

use ExtUtils::MakeMaker;
WriteMakefile(
    NAME         => 'Module::Name',
    AUTHOR       => 'Foo Bar <foobar@cpan.org>',
    VERSION_FROM => 'lib/Module/Name.pm',
    PREREQ_PM    => {
      'Test::Simple'  => 0.47,
      'Test::Builder' => 0.01,
      'File::Temp'    => 0.01,
    },
    META_MERGE        => {
       resources => {
           repository  =>  'https://github.com/szabgab/Module-Name',
           license    => 'http://dev.perl.org/licenses/',
       },
       x_contributors => [
            'Peti Bar <petibar@cpan.org>',
       ],
   },
);

