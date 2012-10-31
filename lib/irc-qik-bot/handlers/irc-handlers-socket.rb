#!/usr/bin/env ruby

require "socket"

module IRC
  module Handlers
    module Socket

      def self.tcp_connect(server, port)
        begin
          return TCPSocket.open server, port
        rescue
          return nil
        end
      end

    end
  end
end
