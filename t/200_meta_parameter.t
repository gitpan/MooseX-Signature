use Test::More;
use Test::Exception;
use Test::Moose;

use MooseX::Signature::Meta::Parameter;

use strict;
use warnings;

plan tests => 4;

# create, interface, passthrough

{
  my $parameter = MooseX::Signature::Meta::Parameter->new;

  isa_ok $parameter,'MooseX::Signature::Meta::Parameter';

  does_ok $parameter,'MooseX::Signature::Interface::Parameter';

  is $parameter->validate (42,1),42;
}

# required

{
  my $parameter = MooseX::Signature::Meta::Parameter->new (required => 1);

  throws_ok { $parameter->validate (42,0) } qr/Parameter is required/;
}

