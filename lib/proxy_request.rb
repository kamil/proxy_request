# coding: utf-8
module ActionDispatch
  module Routing
    class Mapper
      module HttpHelpers
      
        def proxy_request(path)

          lambda do |env|

            req = Request.new(env)

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
            
            [ @response.status, {'Content-Type' => @response.header.contenttype }, [@response.body.content] ]
          end
        end

      end
    end
  end
end

