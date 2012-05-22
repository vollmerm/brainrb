#######################################################################################
#
# BrainInterpreter class
#
# The interpreter has an instruction list and an instruction pointer. It executes
# the code by looking at one instruction at a time and moving the pointer.
# Because brainfuck is such a simple language, a complicated parser (or any parser)
# is not necessary. add_instruction discards comments and adds valid instructions
# to the instruction list.
#
# Mike Vollmer, 2012
# Code is GPL; See included LICENSE
#
#######################################################################################

class BrainInterpreter

  # instance variables:
  #    @mem      ->  the memory object
  #    @ins      ->  the instructions list
  #    @ins_ptr  ->  the instruction pointer
  
	def initialize(size)
		@mem = BrainMemory.new(size)
		@ins = []
		@ins_ptr = 0
	end

  # execute reads one instruction at a time until it reaches the end
	def execute
		while not end_of_instruction?
			read_instruction
		end
	end

  # add instruction adds instructions, discarding invalid characters (comments)
	def add_instruction(chr)
		@ins.push chr if ['>','<','+','-','.',',','[',']'].include? chr
	end

	def end_of_instruction?
		return @ins_ptr == @ins.length
	end

	def read_instruction
		# decide what to do for the current instruction
	  case @ins[@ins_ptr]
		when '>'
			@mem.increment_ptr
			@ins_ptr += 1
		when '<'
			@mem.decrement_ptr
			@ins_ptr += 1
		when '+'
			@mem.increment_at_ptr
			@ins_ptr += 1
		when '-'
			@mem.decrement_at_ptr
			@ins_ptr += 1
		when '.'
			print @mem.at_ptr.chr
			@ins_ptr += 1
		when ','
			@mem.store_at_ptr get_character
			@ins_ptr += 1
		when '['
			# loop start
			if @mem.at_ptr == 0
				match_end
			else
				@ins_ptr += 1
			end
		when ']'
			if @mem.at_ptr != 0
				match_begin
			else
				@ins_ptr += 1
			end
		end
	end	

	def match_end
		count = 1 # start bracket count at 1
		while @ins_ptr < @ins.length - 1 and count != 0
			# increment the instruction pointer
			@ins_ptr += 1
			# look for brackets
			if @ins[@ins_ptr] == '['
				count += 1
			elsif @ins[@ins_ptr] == ']'
				count -= 1
			end
		end
		# loop stops at matching end bracket or end of instruction list
		if @ins_ptr == @ins.length - 1 and @ins[@ins_ptr] != ']'
			raise "unmatched '['"
		else
			@ins_ptr += 1
		end
	end

	def match_begin
		# same as above, only in reverse
		count = 1
		while @ins_ptr > 1 and count != 0
			@ins_ptr -= 1
			if @ins[@ins_ptr] == '['
				count -= 1
			elsif @ins[@ins_ptr] == ']'
				count += 1
			end
		end
		if @ins_ptr == 0 and @ins[@ins_ptr] != '['
			raise "unmatched ']'"
		else
			@ins_ptr += 1
		end
	end

end
