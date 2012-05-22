#######################################################################################
#
# BrainMemory class
#
# This class holds the memory of the interpreter. All interaction with the memory
# in brainfuck is done by incrementing the pointer and the value pointed to
# by the pointer. An exception is raised if the pointer is out of bounds.
#
# Mike Vollmer, 2012
# Code is GPL; See included LICENSE
#
#######################################################################################

class BrainMemory

  # instance variables:
  #    @size  ->  size of the memory array
  #    @mem   ->  memory array     
  #    @ptr   ->  memory pointer

  # create an array of specified size
  def initialize(size)
    @size = size
    @mem = Array.new(size,0)
    @ptr = 0
  end
  
  # the rest of the methods should be self-explanatory

  def increment_ptr
    @ptr += 1
    # error if pointer goes beyond edge of memory
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
