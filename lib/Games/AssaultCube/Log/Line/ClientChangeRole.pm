# Declare our package
package Games::AssaultCube::Log::Line::ClientChangeRole;

# import the Moose stuff
use Moose;

# Initialize our version
use vars qw( $VERSION );
$VERSION = '0.03';

extends 'Games::AssaultCube::Log::Line::Base';

with	'Games::AssaultCube::Log::Line::Base::RoleInfo',
	'Games::AssaultCube::Log::Line::Base::NickIP';

has 'tostr' => (
	isa		=> 'Str',
	is		=> 'ro',
	lazy		=> 1,
	default		=> sub {
		my $self = shift;
		return $self->nick . " from " . $self->ip . " changed role to " . $self->role_name;
	},
);

no Moose;
__PACKAGE__->meta->make_immutable;

1;
__END__

=for stopwords ADMIN
=head1 NAME

Games::AssaultCube::Log::Line::ClientChangeRole - Describes the ClientChangeRole event in a log line

=head1 ABSTRACT

Describes the ClientChangeRole event in a log line

=head1 DESCRIPTION

This module holds the "ClientChangeRole" event data from a log line. Normally, you would not use this class directly
but via the L<Games::AssaultCube::Log::Line> class.

This line is emitted when a client changes their role.

=head2 Attributes

Those attributes hold information about the event. As this class extends the L<Games::AssaultCube::Log::Line::Base>
class, you can also use it's attributes too.

=head3 ip

The ip of the client who changed the role

=head3 nick

The nick of the client

=head3 role

The id of the client's role

	0 = DEAFULT
	1 = ADMIN

=head3 role_name

The role name of the client ( DEFAULT, ADMIN )

=head1 AUTHOR

Apocalypse E<lt>apocal@cpan.orgE<gt>

Props goes to the BS clan for the support!

This project is sponsored by L<http://cubestats.net>

=head1 COPYRIGHT AND LICENSE

Copyright 2009 by Apocalypse

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=cut
