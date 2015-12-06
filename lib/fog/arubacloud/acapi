#
# Author:: Alessio Rocchi (<alessio.rocchi@staff.aruba.it>)
# © Copyright ArubaCloud.
#
# LICENSE: MIT (http://opensource.org/licenses/MIT)
#

module Fog
  module Arubacloud
    module Acapi
      def self.acapi_request(options)
        http_method = options[:http_method] || :get
        @request_url = options[:arubacloud_api_url] || Fog::Arubacloud::AC_API_URL

        params = {headers: content}
        params[:expects] = options[:expected] || [200, 201]
        unless options[:body].nil?
          params[:body] = Fog::JSON.encode({:parameters => options[:body]})
        end

        # initialize connection object
        @connection = Fog::Core::Connection.new(@request_url, false, params)

        # send request
        response = @connection.request(:method => http_method)

        # decode the response
        response.body = Fog::JSON.decode(response.body)

        # return response
        response
      end

      def self.content
        {Content-Type => 'application/json'}
      end
    end
  end
end