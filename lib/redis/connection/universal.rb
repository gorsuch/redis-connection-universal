require 'redis'
require 'openssl'

class Redis
  module Connection
    class Universal < Ruby
      def connect(uri, timeout)
        super if uri.scheme == 'redis'
        return connect_ssl(uri, timeout) if uri.scheme == 'redis+ssl'
      end

      def connect_ssl(uri, timeout)
        with_timeout(timeout.to_f / 1_000_000) do
          tcp_sock = TCPSocket.new(uri.host, uri.port)
	  tcp_sock.setsockopt Socket::IPPROTO_TCP, Socket::TCP_NODELAY, 1
	  ssl_context = OpenSSL::SSL::SSLContext.new()
	  @sock = OpenSSL::SSL::SSLSocket.new(tcp_sock, ssl_context)
	  @sock.sync_close = true
	  @sock.connect
	end
      end
    end
  end
end

Redis::Connection.drivers << Redis::Connection::Universal
