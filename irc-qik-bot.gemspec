# -*- encoding: utf-8 -*-
$:.push File.expand_path('../lib', __FILE__)
require 'irc-qik-bot/version'

Gem::Specification.new do |s|
  s.name        = 'irc-qik-bot'
  s.version     = IRC::Qikbot::VERSION
  s.authors     = ['abhishekkr']
  s.email       = ['abhikumar163@gmail.com']
  s.homepage    = 'http://abhishekkr.github.com/irc-qik-bot'
  s.summary     = %q{a babbling IRC Bot very quick to setup and act ;) aiming to be intelligent}
  s.description = %q{pure socket no framework :: IRC Qik Bot ~ its a babbling IRC Bot very quick to setup and act ;) aiming to be intelligent...
Current Features: https://github.com/abhishekkr/irc-qik-bot/blob/master/README
}

  s.rubyforge_project = 'irc-qik-bot'

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.require_paths = ["lib"]

  s.executables   = %w( irc-qik-bot )

  s.add_runtime_dependency 'xml-motor', '>= 0.1.6'
  s.add_development_dependency 'xml-motor', '>= 0.1.6'
end
