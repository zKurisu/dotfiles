# use Mojolicious::Lite -signatures;
#
# # Not found (404)
# get '/missing' => sub ($c) {
#   $c->render(template => 'does_not_exist');
# };
#
# # Exception (500)
# get '/dies' => sub { die 'Intentional error' };
#
# app->start;
#
use Mojolicious::Lite;

get '/with_layout';

app->start;
__DATA__

@@ with_layout.html.ep
% title 'Green';
% layout 'green';
Hello World!

@@ layouts/green.html.ep
<!DOCTYPE html>
<html>
  <head><title><%= title %></title></head>
  <body><%= content %></body>
</html>
