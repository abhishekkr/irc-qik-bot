# irc-handlers

irc_libs = File.join(File.dirname(File.expand_path __FILE__), '*', '*.rb')
Dir.glob(irc_libs).each do |lib|
  require lib
end

module IRC
  module Handlers

    def self.socket(server, port)
      IRC::Handlers::Socket.tcp_connect server, port
    end

    def self.channel(irc_motor, irc_stream)
      IRC::Handlers::Channel.response irc_motor, irc_stream
    end
  end
end
