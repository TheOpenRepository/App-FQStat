use 5.008001;
use ExtUtils::MakeMaker;
# See lib/ExtUtils/MakeMaker.pm for details of how to influence
# the contents of the Makefile that is written.
WriteMakefile1(
    NAME              => 'App::FQStat',
    VERSION_FROM      => 'lib/App/FQStat.pm', # finds $VERSION
    PREREQ_PM         => {
      DateTime => '0',
      File::HomeDir => '0',
      Package::Alias => '0',
      String::ShellQuote => '0',
      String::Trigram => '0',
      Term::ANSIScreen => '0',
      Term::CallEditor => '0',
      Time::HiRes => '0',
      Term::ReadKey => '0',
      Time::Zone => '0',
      YAML::Tiny => '0',
      threads => '0',
      threads::shared => '0',
    }, # e.g., Module::Name => 1.1
    ABSTRACT_FROM => 'lib/App/FQStat.pm',
    AUTHOR => 'Steffen Mueller <smueller@cpan.org',
    LICENSE => 'perl',
    MIN_PERL_VERSION => '5.008001',
    META_MERGE => {
        resources => {
            repository => 'http://svn.ali.as/cpan/trunk/App-FQStat',
        },
    },
);

sub WriteMakefile1 {  #Written by Alexandr Ciornii, version 0.20
  my %params=@_;
  my $eumm_version=$ExtUtils::MakeMaker::VERSION;
  $eumm_version=eval $eumm_version;
  die "EXTRA_META is deprecated" if exists $params{EXTRA_META};
  die "License not specified" if not exists $params{LICENSE};
  if ($params{BUILD_REQUIRES} and $eumm_version < 6.5503) {
    #EUMM 6.5502 has problems with BUILD_REQUIRES
    $params{PREREQ_PM}={ %{$params{PREREQ_PM} || {}} , %{$params{BUILD_REQUIRES}} };
    delete $params{BUILD_REQUIRES};
  }
  delete $params{CONFIGURE_REQUIRES} if $eumm_version < 6.52;
  delete $params{MIN_PERL_VERSION} if $eumm_version < 6.48;
  delete $params{META_MERGE} if $eumm_version < 6.46;
  delete $params{META_ADD} if $eumm_version < 6.46;
  delete $params{LICENSE} if $eumm_version < 6.31;
  delete $params{AUTHOR} if $] < 5.005;
  delete $params{ABSTRACT_FROM} if $] < 5.005;
  delete $params{BINARY_LOCATION} if $] < 5.005;

  WriteMakefile(%params);
}
