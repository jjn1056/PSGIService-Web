package PSGIService::Web;

use Catalyst;
use PSGIService::Web::Simple;

__PACKAGE__->config(
  psgi_middleware => [
    'Delegate' => { psgi_app =>
      PSGIService::Web::Simple->new(
        app => __PACKAGE__
      )->to_psgi_app },
  ]);

__PACKAGE__->setup;
