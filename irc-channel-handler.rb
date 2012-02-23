#!/usr/bin/env ruby

require File.join File.dirname(File.expand_path __FILE__), "irc-auto-babble.rb"
require File.join File.dirname(File.expand_path __FILE__), "irc-web-handler.rb"

module IRCChannelHandler

  def self.response(irc_motor, irc_stream)
    p irc_stream
    msg = irc_stream.split(":#{irc_motor.nick}:")[1]
    if irc_stream.match(/^PING :(.+)$/i)
      puts "[ Server ping ]"
      irc_motor.ircsend "PONG :#{$1}"
    else
      unless msg.nil?
        puts  "","*"*10,msg,"*"*10,""
        cmd = msg.chomp.split.first
        if cmd.match(/(hi|hello|hey).*/i)
          privmsg irc_motor, "Hello to you too"
        elsif cmd.match(/(unshort|google).*/i)
          privmsg irc_motor, "just a moment, I'm looking it up"
          privmsg irc_motor, w3c_lookup(msg.strip)
        elsif cmd.match(/(babble|help|quote).*/i)
          privmsg irc_motor, babble(msg.strip)
        else
          privmsg irc_motor, "Waddya want x("
        end
      end
    end
  end

  def self.babble(ircmd)
    if ircmd.match(/^babble(.*)$/i)
      return IRCAutoBabble.babble("#{$1}")
    elsif ircmd.match(/^quote(.*)$/i)
      return IRCAutoBabble.quote("#{$1}")
    elsif ircmd.match(/^help(.*)$/i)
      return IRCAutoBabble.helper("#{$1}")
    end
    "BaaBaaBooBoo, try help."
  end

  def self.w3c_lookup(ircmd)
    if ircmd.match(/^google (.+)$/i)
      return IRCWebHandler.google("#{$1}") || "Google seems busy for the while :("
    elsif ircmd.match(/^unshort (.+)$/i)
      return IRCWebHandler.unshort("#{$1}") || "Un-shortener Service Un-available for the moment"
    end
    "Can't understand your Web lookup, try help."
  end

  def self.privmsg(irc_motor, msglines)
    msglines = msglines.split("\n")
    for_time = (msglines.size/5).to_i + 0.5
    msglines.each do |msg|
      sleep 0.5
      irc_motor.ircsend "PRIVMSG #{irc_motor.channel} :#{msg}"
    end
  end

end
