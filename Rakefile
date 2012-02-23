require File.join File.dirname(File.expand_path __FILE__), "irc-abbot.rb"

namespace :irc do
  namespace :abbot do
    desc 'Start the IRC ABbot at given IRC="irc.network" CHANNEL="#channel" NICK="mynick"'
    task :join do
      IRCAbbot.demo ENV['IRC'], ENV['CHANNEL'], ENV['NICK']
    end
  end
end
