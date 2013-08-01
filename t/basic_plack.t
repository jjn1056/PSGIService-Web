use strict;
use warnings FATAL => 'all';

use Test::More;
use Plack::Test;
use HTTP::Request::Common;

use PSGIService::Web;
use PSGIService::Web::Simple;

my $app = PSGIService::Web::Simple->new(app => 'PSGIService::Web')->to_psgi_app;
test_psgi $app, sub {
    my $cb  = shift;

    #my $cat_res = $cb->(GET '/catalyst-hello');
    #is($cat_res->code, '200', '200 response');
    #like($cat_res->content, qr/Catalyst/, 'response content');

#use Data::Dumper;
#print "### cat response: ", Dumper($cat_res);

    my $ws_res = $cb->(GET '/websimple-hello');
#print "### WS response: ", Dumper($ws_res);
    is($ws_res->code, '200', '200 response');
    like($ws_res->content, qr/web-simple/, 'response content');
};

done_testing;

