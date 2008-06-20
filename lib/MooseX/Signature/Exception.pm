package MooseX::Signature::Exception;

use Moose;

use overload '""' => \&stringify;

has 'message' => (
  is       => 'rw',
  isa      => 'Str',
  required => 1, 
);

sub throw {
  my ($class,$reason) = @_;

  my $self = $class->new (message => $reason);

  die $self;
}

sub rethrow {
  my ($self,$reason) = @_;

  $self->message ($reason)
    if defined $reason;

  die $self;
}

sub stringify {
  my ($self) = @_;

  return $self->message;
}

1;

