require File.join File.dirname(File.expand_path __FILE__), "irc-qikbot.rb"

namespace :irc do
  namespace :qikbot do
    desc 'Start the IRC QikBot at given IRC="irc.network" CHANNEL="#channel" NICK="mynick"'
    task :join do
      IRCQikbot.demo ENV['IRC'], ENV['CHANNEL'], ENV['NICK']
    end
  end
end
