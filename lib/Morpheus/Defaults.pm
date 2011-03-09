package Morpheus::Defaults;
BEGIN {
  $Morpheus::Defaults::VERSION = '0.38';
}
use strict;

# ABSTRACT: plugin for defining configuration from perl code

use base qw(Morpheus::Overrides);

our $cache = {};
sub cache {
    return $cache;
}

1;

__END__
=pod

=head1 NAME

Morpheus::Defaults - plugin for defining configuration from perl code

=head1 VERSION

version 0.38

=head1 AUTHOR

Andrei Mishchenko <druxa@yandex-team.ru>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2011 by Yandex LLC.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut

