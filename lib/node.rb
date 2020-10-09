# frozen_string_literal: true

class Node
  attr_reader :val
  attr_accessor :next_node

  def initialize(val)
    @val = val
    @next_node = nil
  end
end
