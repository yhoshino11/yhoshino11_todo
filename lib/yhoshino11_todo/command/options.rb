# coding: utf-8

require 'optparse'

module Yhoshino11Todo
  class Command
    module Options
      def self.parse!(argv)
        command_parser = OptionParser.new do |opt|
          opt.on_head('-v', '--version', 'Show program version') do |v|
            opt.version = Yhoshino11Todo::VERSION
            opt.ver
            puts opt.ver
            exit
          end
        end

        command_parser.parse!(argv)
      end
    end
  end
end
