use Test::Most;
use Catalyst::Test 'PSGIService::Web';

ok( get('/catalyst-hello') =~ /Catalyst/ );
ok( get('/websimple-hello') =~ /web-simple/ );
ok( get('/catalyst-now') =~ /The time is now:/ );
ok( get('/now') );

done_testing;

