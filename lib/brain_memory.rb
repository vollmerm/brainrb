class BrainMemory

	def initialize(size)
		@size = size
		@mem = Array.new(size,0)
		@ptr = 0
	end

	def increment_ptr
		@ptr += 1
		raise "ptr out of bounds" if @ptr > @size - 1
	end

	def decrement_ptr
		@ptr -= 1
		raise "ptr out of bounds" if @ptr < 0
	end

	def at_ptr
		@mem[@ptr]
	end

	def store_at_ptr(i)
		@mem[@ptr] = i
	end

	def increment_at_ptr
		@mem[@ptr] += 1
	end

	def decrement_at_ptr
		@mem[@ptr] -= 1
	end

end
