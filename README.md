proxy_request
=============

proxy_request is a simple helper to Rails routes. It's usefull for eg.
making local Ajax request to remote sites.

Rails 3.x compatibile

#### Installation

just add gem to Gemfile:

```ruby
gem 'proxy_request'
```

#### Usage

and in routes.rb, use new helper *proxy_request* to proxy request to
other url

```ruby
match 'proxy/*all' => proxy_request('http://other.api.com/%{all}')
```

proxy_request **by default validates CSRF protection** for every http method ( GET, POST ... ).

To disable it just set ```:csrf``` option to ```false```

```ruby
match 'api/*all' => proxy_request('http://other.api.com/%{all}', :csrf => false )
```

##### Copyright

Kamil Załęski, http://kamilzaleski.com