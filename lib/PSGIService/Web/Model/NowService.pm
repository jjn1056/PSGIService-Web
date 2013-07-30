package PSGIService::Web::Model::NowService;

use base 'Catalyst::Model::Adaptor';

__PACKAGE__->config(
  class => 'PSGIService::NowService',
  args => {
    psgi => PSGIService::Web::Simple->new(
      app => 'PSGIService::Web')->to_psgi_app
  });
