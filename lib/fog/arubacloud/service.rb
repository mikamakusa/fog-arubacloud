#
# Author:: Alessio Rocchi (<alessio.rocchi@staff.aruba.it>)
# © Copyright ArubaCloud.
#
# LICENSE: MIT (http://opensource.org/licenses/MIT)
#

module Fog
  module ArubaCloud
    class Service
      def datacenter
        raise Fog::Errors::NotImplemented.new('Please implement the #datacenter method')
      end

      def ws_enduser_url(url=nil)
        @ws_enduser_url = url || Fog::ArubaCloud::DEFAULT_WS_ENDUSER_URL
      end

      def request(options)
        http_method = options[:http_method] || :get
        @request_url = "#{@ws_enduser_url}/#{options[:method]}"

        params = {headers: headers}
        params[:expects] = options[:expected] || [200, 201]
        unless options[:body].nil?
          params[:body] = options[:body]
        end
        params[:read_timeout] = 360

        # initialize connection object
        @connection = Fog::Core::Connection.new(@request_url, false, params)

        # send request
        begin
          response = @connection.request(:method => http_method)
        rescue Excon::Errors::Timeout
          # raise an error
          raise Fog::ArubaCloud::Errors::RequestTimeOut.new("Request timed out after: #{60 unless params[:read_timeout]}")
        end

        # decode the response and return it
        Fog::JSON.decode(response.body)
      end

      def headers(options={})
        {'Content-Type' => 'application/json'}.merge(options[:headers] || {})
      end

      def login

      end
    end
  end
end