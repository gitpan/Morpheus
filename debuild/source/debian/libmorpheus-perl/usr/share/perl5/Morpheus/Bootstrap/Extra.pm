package Morpheus::Bootstrap::Extra;
BEGIN {
  $Morpheus::Bootstrap::Extra::VERSION = '0.42';
}
use strict;
use warnings;

# ABSTRACT: extra plugins - Env and File

use Morpheus::Plugin::Env;
use Morpheus::Plugin::File;

use Morpheus::Plugin::Simple;

use Morpheus -defaults => {
    '/morpheus/plugin/file/options/path' => ['./etc/', '/etc/'],
};

sub new {
    return Morpheus::Plugin::Simple->new({
        "morpheus" => {
            "plugins" => {

                File => {
                    priority => 30,
                    object => Morpheus::Plugin::File->new(),
                },

                Env => {
                    priority => 70,
                    object => Morpheus::Plugin::Env->new(),
                }
            }
        }
    });
}

1;


__END__
=pod

=head1 NAME

Morpheus::Bootstrap::Extra - extra plugins - Env and File

=head1 VERSION

version 0.42

=head1 AUTHOR

Andrei Mishchenko <druxa@yandex-team.ru>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2011 by Yandex LLC.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut

