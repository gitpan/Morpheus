package Morpheus::Plugin::Core;
BEGIN {
  $Morpheus::Plugin::Core::VERSION = '0.32';
}
use strict;

# ABSTRACT: plugin providing some core constants

use Sys::Hostname::Long;

use Morpheus::Plugin::Simple;

sub new {
    return Morpheus::Plugin::Simple->new(sub {
        return {
            'system' => {
                hostname => hostname_long(),
                script => $0,
            }
        };
    });
}

1;

__END__
=pod

=head1 NAME

Morpheus::Plugin::Core - plugin providing some core constants

=head1 VERSION

version 0.32

=head1 AUTHOR

Andrei Mishchenko <druxa@yandex-team.ru>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2010 by Yandex LLC.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut

