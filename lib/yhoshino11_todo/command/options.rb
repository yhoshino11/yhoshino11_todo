# coding: utf-8

require 'optparse'

module Yhoshino11Todo
  class Command
    module Options
      def self.parse!(argv)
        options = {}

        sub_command_parsers = create_sub_command_parsers(options)
        command_parser = create_command_parser(options)

        begin
          command_parser.order!(argv)
          options[:command] = argv.shift
          sub_command_parsers[options[:command]].parse!(argv)
        rescue OptionParser::MissingArgument, OptionParser::InvalidOption, ArgumentError => e
          abort e.message
        end

        options
      end

      def self.create_sub_command_parsers(options)
        sub_command_parsers = Hash.new do |key,val|
          raise ArgumentError, "'#{val}' is not yhoshino11_todo sub command."
        end

        sub_command_parsers['create'] = OptionParser.new do |opt|
          opt.on('-n VAL', '--name=VAL', 'task name') { |val| options[:name] = val }
          opt.on('-c VAL', '--content=VAL', 'task content') { |val| options[:content] = val }
        end

        sub_command_parsers['search'] = OptionParser.new do |opt|
          opt.on('-s VAL', '--status=VAL', 'search status') { |val| options[:status] = val }
        end

        sub_command_parsers['update'] = OptionParser.new do |opt|
          opt.on('-n VAL', '--name VAL', 'update name') { |val| options[:name] = val }
          opt.on('-c VAL', '--content VAL', 'update content') { |val| options[:content] = val }
        end
        sub_command_parsers
     end

      def self.create_command_parser(options)
        OptionParser.new do |opt|
          opt.on_head('-v', '--version', 'Show program version') do |v|
            opt.version = Yhoshino11Todo::VERSION
            opt.ver
            puts opt.ver
            exit
          end
        end
      end
    end
  end
end
