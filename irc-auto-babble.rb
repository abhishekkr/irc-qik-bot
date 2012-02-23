#!/usr/bin/env ruby

module IRCAutoBabble

  def self.babble(args)
    dat = from_file "datastore/babble_data"
    return dat unless dat.nil?
    "Babbler is drunk enough to babble more."
  end

  def self.quote(args)
    dat = from_file "datastore/babble_quotes"
    return dat unless dat.nil?
    "Abbot is still thinking."
  end

  def self.helper(args)
    return <<-IRC_ABBOT_HELP
      *******************************
      | IRC-ABbot                   |
      |   its IRC Automated Babbler |
      | \\ Command-Set:              |
      |  |> hi/hey/hello            |
      |  |> babble BABBLE_ABOUT     |
      |  |> quote                   |
      |  |> unshort http://SHORTURL |
      |  |> google SEARCH_TERMS     |
      | talk to me, with my name    |
      |   like                      |
      |     > abbot: google irc-bot |
      *******************************
      IRC_ABBOT_HELP
  end

  private
  def self.from_file(fylname)
    begin
      fylname = File.join(File.dirname(File.expand_path __FILE__), fylname)
      babble = File.open(fylname, "r") do |fyl|
                 fyl.readlines[rand0m]
               end
      return babble
    rescue
      return "Babbler cannot read its babble-o-paedia."
    end
  end

  def self.rand0m
    (rand * 10).to_i
  end

end
