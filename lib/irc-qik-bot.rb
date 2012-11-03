# irc-qik-bot

irc_libs = File.join(File.dirname(File.expand_path __FILE__), 'irc-qik-bot', 'irc-motor.rb')
Dir.glob(irc_libs).each do |lib|
  require lib
end

module IRC
  module Qikbot

    def self.chat(irc_svr = nil, irc_chanl = nil, irc_nick = nil)
      begin
        if irc_svr.nil?
          cnf       = IRC::Motor.ymlconf["network"]["default"]
          irc_svr   = cnf["server"]
          irc_chanl = cnf["channel"]
          irc_nick  = cnf["nick"]
        elsif irc_chanl.nil?
          cnf       = IRC::Motor.ymlconf["network"][irc_svr]["default"]
          irc_chanl = cnf["channel"]
          irc_nick  = cnf["nick"]
        elsif irc_nick.nil?
          irc_nick  = IRC::Motor.ymlconf["network"][irc_svr][irc_chanl]["nick"]
        end
        IRC::Motor.connect irc_svr
        IRC::Motor.join_channel irc_chanl, irc_nick
        IRC::Motor.in_channel
      rescue
        puts "\n\n\n\nOUCH!!!\n\n\n"
      end
    end
  end
end
