package PSGIService::Web::Middleware::Delegate;

use base 'Plack::Middleware';

our $VERSION = '0.001';
our $CODE = 404;

use strict;
use warnings;
use Plack::Util::Accessor 'psgi_app';

sub call {
  my ($self, $env) = @_;
  my $psgi_response = $self->psgi_app->($env);

  return $psgi_response->[0] == $CODE ? 
    $self->app->($env) : $psgi_response;
}

1;

=head1 NAME

PSGIService::Web::Middleware::Delegate - Delegate $env to another application.

=head1 SYNOPSIS

  my $outer_psgi = OuterPSIG->to_app;
  my $inner_psgi = InnerPSGI->to_app;

  my $wrapped_psgi = PSGIService::Web::Middleware::Delegate
    ->new(psgi_app => $inner_psgi)
    ->wrap($outer_psgi);


=head1 DESCRIPTION

Delegate the L<PSGI> request to a PSGI application, but if that inner application
declines to handle it, continue with the next middleware or application in the
stack.

=head1 USE CASE

Sometimes you may wish to allow a different application or framework to handle 
the incoming request.  For example, if you are using L<Catalyst>, you might
wish to delegate some requests to a light weight framework such as L<Web::Simple>
or a custom L<Plack::Application>.  The value of this is that you can avoid all
the overhead associated with 'heavyweight' frameworks for simple requests.  You
could also use this as a way to start migrating your application to a different
framework, or as a way to do a major refactor of your application while still
maintaining compatibility.

=head1 SEE ALSO

The following modules or resources may be of interest.

L<PLack>, L<PSGI>.

=head1 AUTHOR

    John Napiorkowski C<< <jjnapiork@cpan.org> >>

=head1 COPYRIGHT & LICENSE

    Copyright 2013, John Napiorkowski C<< <jjnapiork@cpan.org> >>

This program is owned by John Napiorkowski and contributors as noted or
otherwise described in external documention or legal agreements.

=cut

