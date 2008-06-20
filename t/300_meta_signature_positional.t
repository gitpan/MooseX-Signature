use Test::More;
use Test::Exception;
use Test::Moose;

use MooseX::Signature::Meta::Parameter;
use MooseX::Signature::Meta::Signature::Positional;

use strict;
use warnings;

plan tests => 6;

# create, interface, passthrough

{
  my $signature = MooseX::Signature::Meta::Signature::Positional->new;

  isa_ok $signature,'MooseX::Signature::Meta::Signature::Positional';

  does_ok $signature,'MooseX::Signature::Interface::Signature';

  is_deeply [$signature->validate (42,84)],[42,84];
}

# with parameters

{
  my $signature = MooseX::Signature::Meta::Signature::Positional->new (parameter_list => [
      MooseX::Signature::Meta::Parameter->new (required => 1),
      MooseX::Signature::Meta::Parameter->new,
    ],
  );

  is_deeply [$signature->validate (42,84)],[42,84];

  throws_ok { $signature->validate } qr/Parameter \(0\): Parameter is required/;
}

# strict

{
  my $signature = MooseX::Signature::Meta::Signature::Positional->new (parameter_list => [
      MooseX::Signature::Meta::Parameter->new,
    ],
    strict => 1,
  );

  is_deeply [$signature->validate (42,84)],[42];
}

