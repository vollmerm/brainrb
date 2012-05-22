#!/usr/bin/env ruby

#######################################################################################
#
# brainrb: a simple brainfuck interpreter in Ruby
#
# See README for more information. Run interpreter with -h for options.
# Comments explaining the functionality of this interpreter are in the brain_memory.rb
# and brain_interpreter.rb files
#
# Created by Mike Vollmer, 2012
# All code licensed under GPL
#
#######################################################################################


require 'trollop' # for parsing command line options
require 'highline/system_extensions' # for reading single characters
include HighLine::SystemExtensions

# include the memory and interpreter classes
$LOAD_PATH << './lib'
require 'brain_memory.rb'
require 'brain_interpreter.rb'

# set up the command line option parsing
opts = Trollop::options do
	version "brainrb 0.1a"
	banner <<-EOS
brainrb: a simple brainfuck interpreter created by Mike Vollmer and implemented in Ruby.

Usage:
brain.rb [options] <filename>

Available options:
EOS
	
	opt :mem, "Size of allocated memory in bytes", 
		{ :type => Integer, :default => 30000 }
end

# file must exist
Trollop::die :file, "must exist" unless File.exist?(opts[:file]) if opts[:file]

if not ARGV[0] 
	puts "Nothing to do. Try brainrb -h for more information"
else
  # open the file for reading
	file = File.new(ARGV[0],"r")
	# create the interpreter object
	interpreter = BrainInterpreter.new(opts[:mem])
	# read in the instructions
	while char = file.getc
		interpreter.add_instruction(char)
	end
	interpreter.execute # run the program
end
