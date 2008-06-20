package MooseX::Signature::Meta::Parameter;

use Moose;

use MooseX::Signature::Exception;

with qw/MooseX::Signature::Interface::Parameter/;

has 'required' => (
  isa     => 'Bool',
  default => 0,
);

sub get_required { $_[0]->{required} }

sub validate {
  my ($self,$value,$is_provided) = @_;

  MooseX::Signature::Exception->throw ('Parameter is required')
    unless $is_provided;

  return $value;
}

1;

__END__

=pod

=head1 NAME

MooseX::Signature::Meta::Parameter - MooseX::Signature parameter metaclass

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

