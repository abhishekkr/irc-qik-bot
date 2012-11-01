# irc-motor


irc_libs = File.join(File.dirname(File.expand_path __FILE__), '*.rb')
Dir.glob(irc_libs).each do |lib|
  require lib
end

module IRC
  module Motor

    def self.nick(nick=nil)
      @nick = nick unless nick.nil?
      @nick
    end

    def self.channel(channel=nil)
      @channel = channel unless channel.nil?
      @channel
    end

    def self.connect(server, port="6667")
      @irc = IRC::Handlers.socket server, port
    end

    def self.ircsend(msg)
        return err("No IRC Connection Found") unless @irc
        @irc.send "#{msg}\n", 0
    end

    def self.join_channel(irc_chanl, irc_nick="qbot")
      channel irc_chanl
      nick irc_nick
      ircsend "USER irc qik bot :#{ENV['USERNAME']} qbot"
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
      IRC::Handlers.channel self, irc_stream
    end

    def self.ymlconf
      require 'yaml'
      resource_dir  = File.expand_path File.join(File.dirname(__FILE__), '..', '..', 'resource')
      irc_yaml      = File.join resource_dir, 'irc.yaml'
      YAML.load_file irc_yaml
    end

    if ENV["VERBOSE"]=="1"
      def self.err(msg)
        STDERR.puts "ERROR: #{msg}"
      end
    end
  end
end
