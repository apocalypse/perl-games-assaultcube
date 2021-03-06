# Declare our package
package Games::AssaultCube::Log::Line::ClientVersion;

# import the Moose stuff
use Moose;

# Initialize our version
use vars qw( $VERSION );
$VERSION = '0.04';

extends 'Games::AssaultCube::Log::Line::Base';

# TODO improve validation for everything here, ha!

has 'ip' => (
	isa		=> 'Str',
	is		=> 'ro',
	required	=> 1,
);

has 'version' => (
	isa		=> 'Int',
	is		=> 'ro',
	required	=> 1,
);

has 'defs' => (
	isa		=> 'Str',
	is		=> 'ro',
	required	=> 1,
);

has 'tostr' => (
	isa		=> 'Str',
	is		=> 'ro',
	lazy		=> 1,
	default		=> sub {
		my $self = shift;
		return "Client from " . $self->ip . " connected with version " . $self->version;
	},
);

no Moose;
__PACKAGE__->meta->make_immutable;

1;
__END__

=for stopwords defs ip

=head1 NAME

Games::AssaultCube::Log::Line::ClientVersion - Describes the ClientVersion event in a log line

=head1 ABSTRACT

Describes the ClientVersion event in a log line

=head1 DESCRIPTION

This module holds the "ClientVersion" event data from a log line. Normally, you would not use this class directly
but via the L<Games::AssaultCube::Log::Line> class.

This line is emitted when a client connects to the AC server.

=head2 Attributes

Those attributes hold information about the event. As this class extends the L<Games::AssaultCube::Log::Line::Base>
class, you can also use it's attributes too.

=head3 ip

The ip of the client who just connected

=head3 version

The AC version of the client

=head3 defs

The loaded defs on the client ( not sure what it exactly means, ha! )

=head1 AUTHOR

Apocalypse E<lt>apocal@cpan.orgE<gt>

Props goes to the BS clan for the support!

This project is sponsored by L<http://cubestats.net>

=head1 COPYRIGHT AND LICENSE

Copyright 2009 by Apocalypse

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=cut
