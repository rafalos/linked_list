# frozen_string_literal: true

require_relative 'node'

class LinkedList
  def initialize
    @head = nil
    @tail = nil
    @size = 0
  end

  def append(val)
    node = Node.new(val)
    if @size == 0
      @tail = node
      @head = node
    else
      @tail.next_node = node
      @tail = node
    end
    @size += 1
  end

  def prepend(val)
    node = Node.new(val)
    if @size == 0
      @tail = node
      @head = node
    else
      node.next_node = @head
      @head = node
    end
    @size += 1
  end

  def pop
    return if @size == 0

    iterator do |element, element_index|
      if element_index == @size - 1
        element.next_node = nil
        @tail = element
      end
    end
    @size -= 1
  end

  def head
    @head.val
  end

  def tail
    @tail.next_node
  end

  attr_reader :size

  def at(index)
    iterator do |element, element_index|
      return element.val if index == element_index
    end
  end

  def find(value)
    iterator do |element, element_index|
      return element_index if element.val == value
    end
    nil
  end

  def instert_at(val, index)
    return if index > @size

    if index == 1
      prepend(val)
    elsif index == @size
      append(val)
    else
      node = Node.new(val)
      iterator do |element, element_index|
        if element_index == index - 1
          node.next_node = element.next_node
          element.next_node = node
        end
      end
    end
  end

  def remove_at(index)
    iterator do |element, element_index|
      element.next_node = element.next_node.next_node if element_index == index - 1
    end
  end

  def contains?(value)
    iterator do |element|
      return true if element.val == value
    end
    false
  end

  def to_s
    iterator do |element, _index|
      print "( #{element.val} ) -> "
    end
    print "End"
  end

  private

  def iterator(node = @head, times = 0, &block)
    times += 1
    return unless node

    yield(node, times)
    iterator(node.next_node, times, &block)
  end
end
