#!/usr/bin/env ruby

require File.join File.dirname(File.expand_path __FILE__), "irc-motor.rb"

module IRCQikbot

  def self.demo(irc_svr, irc_chanl, irc_nick)
    begin
      if irc_svr.nil?
        cnf       = IRCMotor.ymlconf["network"]["default"]
        irc_svr   = cnf["server"]
        irc_chanl = cnf["channel"]
        irc_nick  = cnf["nick"]
      elsif irc_chanl.nil?
        cnf       = IRCMotor.ymlconf["network"][irc_svr]["default"]
        irc_chanl = cnf["channel"]
        irc_nick  = cnf["nick"]
      elsif nick.nil?
        cnf       = IRCMotor.ymlconf["network"][irc_svr][irc_chanl]["nick"]
        irc_nick  = cnf["nick"]
      end
      IRCMotor.connect irc_svr
      IRCMotor.join_channel irc_chanl, irc_nick
      IRCMotor.in_channel
    rescue
      puts "\n\n\n\nOUCH!!!\n\n\n"
    end
  end

end
