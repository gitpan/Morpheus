package Morpheus::Key;
BEGIN {
  $Morpheus::Key::VERSION = '0.35';
}
use strict;

# ABSTRACT: class representing config key

use overload
    'eq' => sub { @_ = upgrade(@_); ${$_[0]} eq ${$_[1]} },
    'lt' => \&less,
    'le' => sub { @_ = upgrade(@_); $_[0] lt $_[1] or $_[0] eq $_[1] },
    'gt' => sub { @_ = upgrade(@_); $_[1] lt $_[0] },
    'ge' => sub { @_ = upgrade(@_); $_[1] lt $_[0] or $_[0] eq $_[1] }, #ATTN 'not $x < $y' does not mean '$x >= $y'

    '""' => sub { ${$_[0]} },
    '@{}' => \&parts;

use base qw(Exporter);
our @EXPORT_OK = qw(key);

sub new {
    my $class = shift;
    my $key = shift;
    
    $key =~ s{/+}{/}g;
    $key =~ s{^/*}{/}; #TODO: support relative keys?
    $key =~ s{/+$}{};

    bless \$key => $class;
}

sub upgrade {
    map { ref $_ ? $_ : __PACKAGE__->new($_) } @_;
}

sub less ($$) {
    @_ = upgrade(@_);
    my ($key1, $key2) = @_;
    $key1 = "$key1";
    $key2 = "$key2";
    return length $key1 < length $key2 && substr($key2, 0, 1 + length $key1) eq "$key1/";
}

sub parts ($) {
    my ($key) = @_;
    $key = "$key";
    $key =~ s{^/}{};
    return [split qr{/}, $key];
}

sub key {
    __PACKAGE__->new($_[0]);
}

1;

__END__
=pod

=head1 NAME

Morpheus::Key - class representing config key

=head1 VERSION

version 0.35

=head1 AUTHOR

Andrei Mishchenko <druxa@yandex-team.ru>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2010 by Yandex LLC.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut

