# frozen_string_literal: true

class Node
  attr_accessor :next_node, :val

  def initialize(val)
    @val = val
    @next_node = nil
  end
end
