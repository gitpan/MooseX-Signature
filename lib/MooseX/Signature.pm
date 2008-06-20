package MooseX::Signature;

use strict;
use warnings;

our $VERSION = '0.00_01';

1;

__END__

=pod

=head1 NAME 

MooseX::Signature - A framework for signatures in Moose

=head1 WARNING

As the version number should indicate, this is a developer release and
is subject to change at any time. It is put on CPAN so that people may
experiment with it and provide feedback but is not intended to be used
in production quite yet. You have been warned.

=head1 DESCRIPTION

MooseX::Signature is a framework for signatures in Moose. A signature
is (For the purpose of this module) a specification of what parameters
functions and methods should accept. This module isn't intended for
direct use, but rather as backend to any number of modules that needs
this functionality, such as L<MooseX::Method> which will eventually be
converted to use this.

This being a developer release, the API used to working with
signatures is subject to change. My goal is that when this module gets
out of developer status, the API will remains backwards compatible in
any future release.

=head1 SEE ALSO

=over 4

=item L<MooseX::Method>

=item L<Moose>

=back

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

