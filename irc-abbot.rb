#!/usr/bin/env ruby

require File.join File.dirname(File.expand_path __FILE__), "irc-motor.rb"

module IRCAbbot

  def self.demo(irc_svr="irc.freenode.com", irc_chanl="#ruby", irc_nick="abbot")
    begin
      IRCMotor.connect irc_svr
      IRCMotor.join_channel irc_chanl, irc_nick
      IRCMotor.in_channel
    rescue
      puts "\n\n\n\nOUCH!!!\n\n\n"
    end
  end

end
