proxy_request
=============

proxy_request is a simple helper to Rails routes. 

	match 'proxy/*all' => proxy_request('http://other.api.com/%{all}')
