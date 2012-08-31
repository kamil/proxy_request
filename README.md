proxy_request
=============

proxy_request is a simple helper to Rails routes. It's usefull for eg.
making local Ajax request to remote sites.

just add gem to Gemfile:

  	gem 'proxy_request'

and in routes.rb, use new helper *proxy_request* to proxy request to
other url

	match 'proxy/*all' => proxy_request('http://other.api.com/%{all}')


