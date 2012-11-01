#!/usr/bin/env rake

require "bundler/gem_tasks"

require 'rake'

namespace :lint do

  desc 'remove tailing whitespace'
  task :notail do
    Dir.glob(File.join Dir.pwd, '*.rb').each do |fyl|
      %x{sed -i 's/\ *$//g' #{fyl}}
    end
    Dir.glob(File.join Dir.pwd, '*', '*.rb').each do |fyl|
      %x{sed -i 's/\ *$//g' #{fyl}}
    end
    Dir.glob(File.join Dir.pwd, '*', '*', '*.rb').each do |fyl|
      %x{sed -i 's/\ *$//g' #{fyl}}
    end
  end
end
