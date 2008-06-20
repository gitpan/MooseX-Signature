use inc::Module::Install;

name 'MooseX-Signature';

all_from 'lib/MooseX/Signature.pm';

build_requires 'Test::Exception' => '0.27';
build_requires 'Test::More'      => '0.72';

requires 'Moose'        => '0.50';
requires 'Scalar::Util' => '1.19';

WriteAll;

