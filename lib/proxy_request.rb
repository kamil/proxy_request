# coding: utf-8

require 'httpclient'

def _proxy_request(env,path,args)


  args = {
    :csrf => true 
  }.merge(args)

  req = ActionDispatch::Request.new(env)

  if args[:csrf] and env['rack.session']['_csrf_token'] != req.headers["X-CSRF-Token"]
    return [
      403,
      {'Content-Type' => 'text/html', 'Content-Length' => '3'},
      ['403']
    ]
  end

  path_params = path.to_s % Hash[req.params.map{|a| [a.first.to_sym, a.last]}]

  if path_params.starts_with?("http:/")
    path_params.gsub!('http:/','http://')
  end

  if req.params['format']
    path_params += "." + req.params['format']
  end

  uri = URI.parse( path_params )

  http_req = HTTPClient.new

  elapsed_time = Benchmark.ms do
    @response = http_req.request(req.method,uri.to_s)
  end

  [
    @response.status,
    {
      'Content-Type' => @response.header.contenttype,
      'X-Proxy-Runtime' => (elapsed_time/1000.0).to_s
    },
    [@response.body.content]
  ]

end

module ActionDispatch
  module Routing
    class Mapper
      module HttpHelpers

        def proxy_request(path,args = {})
          lambda do |env|
            _proxy_request(env,path,args)
          end
        end

      end
    end
  end
end

