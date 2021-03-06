use strict;
use warnings;
use ExtUtils::MakeMaker;

my %conf = (
	NAME          => 'Module::Name',
	AUTHOR        => 'Foo Bar <foobar@cpan.org>',
	VERSION_FROM  => 'lib/Module/Name.pm',
	ABSTRACT_FROM => 'lib/Module/Name.pm',
	PREREQ_PM     => {
		'HTML::Template'    => '2.95',
	},
);

if (eval { ExtUtils::MakeMaker->VERSION(6.3002) }) {
	$conf{LICENSE} = 'perl';
}


if (eval { ExtUtils::MakeMaker->VERSION(6.46) }) {
	$conf{META_MERGE} = {
		'meta-spec' => { version => 2 },
		resources => {
			repository => {
				type       => 'git',
				url        => 'http://github.com/szabgab/Module-Name.git',
				web        => 'http://github.com/szabgab/Module-Name',
				license    => 'http://dev.perl.org/licenses/',
			},
			bugtracker => {
				web        => 'http://github.com/szabgab/Module-Name/issues',
			},
			homepage   => 'http://perlmaven.com/',
		},
		x_contributors => [
			'Peti Bar <petibar@cpan.org>',
		],
		x_IRC => 'irc://irc.perl.org/#perl',
		x_MailingList => 'http://lists.perl.org/list/perl-qa.html',
	};
}

my %configure_requires = (
	'ExtUtils::MakeMaker' => '6.64',
);
my %build_requires = ();
my %test_requires = (
	'Test::More'      => '1.00',
	'Test::Exception' => '0.32',

	# standard modules:
	'File::Temp' => 0,
);

###   merging data "standard code"
if (eval { ExtUtils::MakeMaker->VERSION(6.52) }) {
	$conf{CONFIGURE_REQUIRES} = \%configure_requires;
} else {
	%{ $conf{PREREQ_PM} } = (%{ $conf{PREREQ_PM} }, %configure_requires);
}

if (eval { ExtUtils::MakeMaker->VERSION(6.5503) }) {
	$conf{BUILD_REQUIRES} = \%build_requires;
} else {
	%{ $conf{PREREQ_PM} } = (%{ $conf{PREREQ_PM} }, %build_requires);
}
if (eval { ExtUtils::MakeMaker->VERSION(6.64) }) {
	$conf{TEST_REQUIRES} = \%test_requires;
} else {
	%{ $conf{PREREQ_PM} } = (%{ $conf{PREREQ_PM} }, %test_requires);
}


WriteMakefile(%conf);

