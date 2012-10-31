# irc-handler-channel

module IRC
  module Handlers
    module Channel

      def self.response(irc_motor, irc_stream)
        p irc_stream
        msg = irc_stream.split(":#{irc_motor.nick}:")[1]
        if irc_stream.match(/^PING :(.+)$/i)
          puts "[ Server ping ]"
          irc_motor.ircsend "PONG :#{$1}"
        elsif !msg.nil?
          puts  "","*"*10,msg,"*"*10,""
          cmd = msg.chomp.split.first
          if cmd.match(/(hi|hello|hey).*/i)
            privmsg irc_motor, "Hello to you too"
          elsif cmd.match(/(unshort|google|whois).*/i)
            privmsg irc_motor, "just a moment, I'm looking it up"
            privmsg irc_motor, w3c_lookup(msg.strip)
          elsif cmd.match(/(babble|help|quote).*/i)
            privmsg irc_motor, babble(msg.strip)
          else
            privmsg irc_motor, "Waddya want x("
          end
        end
      end

      def self.babble(ircmd)
        if ircmd.match(/^babble(.*)$/i)
          return IRC::AutoBabble.babble("#{$1}")
        elsif ircmd.match(/^quote(.*)$/i)
          return IRC::AutoBabble.quote("#{$1}")
        elsif ircmd.match(/^help(.*)$/i)
          return IRC::AutoBabble.helper("#{$1}")
        end
        "BaaBaaBooBoo, try help."
      end

      def self.w3c_lookup(ircmd)
        if ircmd.match(/^google (.+)$/i)
          return IRC::WWW.google("#{$1}") || "Google seems busy for the while :("
        elsif ircmd.match(/^unshort (.+)$/i)
          return IRC::WWW.unshort("#{$1}") || "Un-shortener Service Un-available for the moment"
        elsif ircmd.match(/^whois (.+)$/i)
          return IRC::WWW.whois("#{$1}") || "WHOIS Service Un-available for the moment"
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
  end
end
