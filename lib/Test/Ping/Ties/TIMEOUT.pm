package Test::Ping::Ties::TIMEOUT;

use strict;
use warnings;

use Net::Ping;
use Tie::Scalar;

our $VERSION = '0.01';

sub TIESCALAR { return bless {}, shift;      }
sub FETCH     { return $Test::Ping::TIMEOUT; }

sub STORE {
    Test::Ping->_ping_object(
        Net::Ping->new( $Test::Ping::PROTO, $_[1] )
    );
}

1;

__END__

=head1 NAME

Test::Ping::Ties::TIMEOUT - Timeout Tie variable to Test::Ping

=head1 VERSON

Version 0.01

=head1 DESCRIPTION

In order to allow complete procedural interface to Net::Ping, even though it's an object, I use a Tie::Scalar interface. Every variable is also defined separately to make it cleaner and easier.

At some point they might be joined together in a single file, but I doubt it.

Please refrain from using this directly.

=head1 EXPORT

None.

=head1 COPYRIGHT & LICENSE

Copyright 2009 Sawyer X, all rights reserved.

This program is free software; you can redistribute it and/or modify it
under the same terms as Perl itself.

