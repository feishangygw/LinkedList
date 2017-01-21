
class LinkedList
	class Node
		attr_accessor :value, :next_node
		
		def initialize(value = nil)
			@value = value
		end
	end
	
	attr_accessor :head, :tail
	attr_reader :size


	private

	attr_writer :size


	public

	def initialize
		@size = 0
	end
	
	def append(data)
		node = Node.new(data)
		if size == 0
			self.head = self.tail = node
		elsif size == 1
			self.head.next_node = self.tail = node
		else
			self.tail.next_node = node
			self.tail = node
		end
		self.size += 1
	end
	
	def prepend(data)
		node = Node.new(data)		
		if size == 0
			self.head = self.tail = node
		else
			node.next_node = head
			self.head = node
		end
		self.size += 1
	end
	
	def at(index)
		begin
			node = head
			index.times do
				node = node.next_node
			end
			node
		rescue
		end
	end
	
	def pop
		return if size == 0
		
		value = tail		
		if size == 1
			self.head = self.tail = nil			
		else		
			node = find_node { |node_| node_.next_node.eql? tail }			
			node.next_node = nil
			self.tail = node
		end
		self.size -= 1
		return value
	end
	
	def contains?
		if block_given?
			node = head
			until(node.nil?) do
				return true if yield(node.value)
				node = node.next_node
			end
			return false
		else
			return true
		end
	end

	def find_node
		if block_given?
			node = head
			until(node.nil?) do
				return node if yield(node)
				node = node.next_node
			end	
		end
	end
	
	def find_by
		if block_given?
			node = head
			count = 0
			until(node.nil?) do
				return count if yield(node)
				count += 1
				node = node.next_node
			end	
		end
	end

	def find(data)
		find_by { |node| node.value == data }
	end
	
	def to_s
		string = ""
		node = head
		loop do
			if node.nil?
				string += "nil"
				return string
			end
			string += "(#{node.value}) -> "
			node = node.next_node
		end
	end
	
	def insert_at(index, data)
		return false unless index.between?(0, size)

		node = Node.new(data)				

		if size == 0						# Empty list
			self.head = node
			self.tail = node		
		else 								# Non empty list
			if index == 0
				node.next_node = head
				self.head = node				
			elsif index < size				# prepend
				node.next_node = at(index)
				self.at(index - 1).next_node = node				
			else							# append
				self.tail.next_node = self.tail = node				
			end			
		end	
		self.size += 1
		true
	end

	def remove_at(index)
		return false if size == 0
		return false unless index.between?(0, size - 1)

		if size == 1
			self.head = nil
			self.tail = nil
		else
			if index == 0
				self.head = head.next_node
			elsif index < (size - 1)
				self.at(index - 1).next_node = at(index).next_node
			else
				self.tail = at(index - 1)
				self.tail.next_node = nil
			end 
		end
		self.size -= 1
		true
	end
	
end