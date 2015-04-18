# coding: utf-8

require 'optparse'

module Yhoshino11Todo
  class Command
    module Options
      def self.parse!(argv)
        options = {}

        sub_command_parsers = Hash.new do |key,val|
          raise ArgumentError, "'#{val}' is not yhoshino11_todo sub command."
        end

        sub_command_parsers['create'] = OptionParser.new do |opt|
          opt.on('-n VAL', '--name=VAL', 'task name') { |val| options[:name] = val }
          opt.on('-c VAL', '--content=VAL', 'task content') { |val| options[:content] = val }
        end

        command_parser = OptionParser.new do |opt|
          opt.on_head('-v', '--version', 'Show program version') do |v|
            opt.version = Yhoshino11Todo::VERSION
            opt.ver
            puts opt.ver
            exit
          end
        end

        begin
          command_parser.order!(argv)
          options[:command] = argv.shift
          sub_command_parsers[options[:command]].parse!(argv)
        rescue OptionParser::MissingArgument, OptionParser::InvalidOption, ArgumentError => e
          abort e.message
        end

        options
      end
    end
  end
end
