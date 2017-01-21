
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
		index = 0 if head.nil?
		index = self.size if index > size


		node = Node.new(data)				# Empty list
		if size == 0
			index = 0
			self.head = node
			self.tail = node
			self.size += 1
		elsif size == 1		 				# 1 element
			if index == 0					# prepend				
				node.next_node = head
				self.head = node
				self.size += 1
			else 							# append
				self.head.next_node = self.tail = node
				self.size += 1				
			end
		else 								# 2 elements and above
			if index == 0
				node.next_node = head
				self.head = node
				self.size += 1
			elsif index < size				# prepend
				node.next_node = at(index)
				self.at(index - 1).next_node = node
				self.size += 1
			else							# append
				self.tail.next_node = self.tail = node
				self.size += 1
			end
		end	
	end

	def remove_at(index)
	end
	
	
end