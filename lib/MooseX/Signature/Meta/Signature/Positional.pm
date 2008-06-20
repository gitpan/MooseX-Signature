package MooseX::Signature::Meta::Signature::Positional;

use Moose;

use Scalar::Util qw/blessed/;

with qw/MooseX::Signature::Interface::Signature/;

has 'strict' => (
  isa      => 'Bool',
  required => 1,
  default  => 0,
);

has 'parameter_list' => (
  isa      => 'ArrayRef',
  required => 1,
  default  => sub { [] },
);

sub validate {
  my ($self,@arguments) = @_;

  my @new_arguments;

  my $parameter_count = 0;

  eval {
    while (my $parameter = $self->{parameter_list}->[$parameter_count]) {
      if (scalar @arguments) {
        my $argument = shift @arguments;

        push @new_arguments,$parameter->validate ($argument,1);
      } else {
        push @new_arguments,$parameter->validate (undef,0);
      }

      $parameter_count++;
    }
  };

  if ($@) {
    if (blessed $@ && $@->isa ('MooseX::Signature::Exception')) {
      $@->rethrow ("Parameter ($parameter_count): " . $@->message);
    } else {
      die $@;
    }
  }

  push @new_arguments,(@arguments) unless $self->{strict};

  return @new_arguments;
}

1;

__END__

=pod

=head1 NAME

MooseX::Signature::Meta::Signature::Positional - MooseX::Signature positional signature metaclass

=head1 BUGS

Most software has bugs. This module probably isn't an exception.
If you find a bug please either email me, or add the bug to cpan-RT.

=head1 AUTHOR

Anders Nor Berle E<lt>berle@cpan.orgE<gt>

=head1 COPYRIGHT AND LICENSE

Copyright 2008 by Anders Nor Berle.

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

