require File.join File.dirname(File.expand_path __FILE__), "irc-qikbot.rb"

namespace :irc do
  namespace :qikbot do
    desc 'Start the IRC QikBot at given IRC="irc.network" CHANNEL="#channel" NICK="mynick"'
    task :join do
      print "IRC Server   : #{ENV['IRC'].chomp} "
      irc     = ENV['IRC'].chomp || STDIN.gets.chomp
      print "Join #Channel: #{ENV['CHANNEL'].chomp} "
      channel = ENV['CHANNEL'].chomp || STDIN.gets.chomp
      print "IRC NickName : #{ENV['NICK'].chomp} "
      nick    = ENV['NICK'].chomp || STDIN.gets.chomp
      IRCQikbot.demo irc, channel, nick
    end
  end
end
