#!/usr/bin/env ruby

require File.join File.dirname(File.expand_path __FILE__), "irc-socket-handler.rb"
require File.join File.dirname(File.expand_path __FILE__), "irc-channel-handler.rb"

module IRCMotor

  def self.nick(nick=nil)
    @nick = nick unless nick.nil?
    @nick 
  end

  def self.channel(channel=nil)
    @channel = channel unless channel.nil?
    @channel
  end

  def self.connect(server, port="6667")
    @irc = IRCSocketHandler.tcp_connect server, port
  end

  def self.ircsend(msg)
    return err("No IRC Connection Found") unless @irc
    @irc.send "#{msg}\n", 0
  end

  def self.join_channel(irc_chanl, irc_nick="qbot")
    channel irc_chanl
    nick irc_nick
    ircsend "USER irc ab bot :joining you"
    ircsend "NICK #{nick}"
    ircsend "JOIN #{channel}"
  end

  def self.in_channel
    while true
      ready = select([@irc, $stdin], nil)
      next if !ready
      for status in ready[0]
        if status == $stdin then
          admin_input
        elsif status == @irc then
          channel_input
        end
      end
    end
  end

  def self.admin_input
    return if $stdin.eof
    irc_command = $stdin.gets
    ircsend irc_command
  end

  def self.channel_input
    return if @irc.eof
    irc_stream = @irc.gets
    IRCChannelHandler.response self, irc_stream
  end

  if ENV["VERBOSE"]=="1"
    def self.err(msg)
      STDERR.puts "ERROR: #{msg}"
    end
  end

end
