package Morpheus::Overrides;
BEGIN {
  $Morpheus::Overrides::VERSION = '0.35';
}
use strict;

# ABSTRACT: plugin for overriding configuration from perl code

use Morpheus::Utils qw(merge normalize);

our $cache = {};
sub cache {
    return $cache;
}

sub import ($$) {
    my ($class, $patch) = @_;
    return unless $patch;
    die "unexpected $patch" unless ref $patch eq "HASH";
    my $cache = $class->cache();
    push @{$cache->{list}}, $patch;
}

sub list ($$) {
    return ('' => '');
}

sub get ($$) {
    my ($class, $ns) = @_;
    die "mystery" if $ns;

    my $cache = $class->cache();
    while($cache->{list} and @{$cache->{list}}) {
        my $patch = shift @{$cache->{list}};
        $patch = normalize($patch);
        $cache->{data} = merge($cache->{data}, $patch);
    }
    return $cache->{data};
}

1;

__END__
=pod

=head1 NAME

Morpheus::Overrides - plugin for overriding configuration from perl code

=head1 VERSION

version 0.35

=head1 AUTHOR

Andrei Mishchenko <druxa@yandex-team.ru>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2010 by Yandex LLC.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut

