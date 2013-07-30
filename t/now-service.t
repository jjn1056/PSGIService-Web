use Test::Most;
use PSGIService::Web;
use PSGIService::Web::Simple;
use PSGIService::NowService;

ok my $service = PSGIService::NowService
  ->new(psgi => PSGIService::Web::Simple
    ->new(app => 'PSGIService::Web')
      ->to_psgi_app);

ok $service->now;

done_testing;

