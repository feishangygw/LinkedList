
class LinkedList
	class Node
		attr_accessor :value, :next_node
		
		def initialize(value = nil)
			@value = value
		end
	end
	
	attr_accessor :head, :tail
	
	def append(data)
		node = Node.new(data)
		if head.nil?
			self.head = self.tail = node
		elsif head.next_node.nil?
			self.head.next_node = self.tail = node
		else
			self.tail.next_node = node
			self.tail = node
		end
	end
	
	def prepend(data)
		node = Node.new(data)
		if head.nil?
			self.head = self.tail = node
		else
			node.next_node = head
			self.head = node
		end
	end
	
	def size
		count = 0
		node = head
		loop do
			return count if node.nil?
			count += 1
			node = node.next_node
		end
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
		return if head.nil?
		
		value = tail
		
		if head.next_node.nil?
			self.head = self.tail = nil 
			return value
		end
		
		node = head
		loop do
			break if node.next_node.eql? tail
			node = node.next_node
		end
		
		node.next_node = nil
		self.tail = node
		
		return value
	end
	
	def contains?
		if block_given?
			node = head
			until(node.nil?) do
				return true if yield(node.value)
				node.next_node
			end
		end
	end
	
	def find(data)
	end
	
	def to_s
		string = ""
		node = head
		loop do
			if node.nil?
				string += "nil"
				return string
			end
			string += "#{node.value.inspect} -> "
			node = node.next_node
		end
	end
	
	def insert_at(index)
	end

	def remove_at(index)
	end
	
	
end

def help
	puts	"#[a]ppend adds a new node to the end of the list",
			"#[p]repend adds a new node to the start of the list",
			"#[s]ize returns the total number of nodes in the list",
			"#[h]ead returns the first node in the list",
			"#[t]ail returns the last node in the list",
			"#at(index) [@] returns the node at the given index",
			"#p[o]p removes the last element from the list",
			"#[c]ontains? returns true if the passed in value is in the list and otherwise returns false.",
			"#[f]ind(data) returns the index of the node containing data, or nil if not found.",
			"help [?] show all ",
			"#to_s [<space>] represent your LinkedList objects as strings, so you can print them out and"
end

list = LinkedList.new

help


loop do
	puts
	print "command> "
	case gets.chomp
	when "a"
		puts "---Append mode---"
		print "string> "
		list.append(gets.chomp)
		puts list
	when "p"
		puts "---Prepend mode---"
		print "string> "
		list.prepend(gets.chomp)
		puts list
	when "s"
		puts list.size
	when "h"
		p list.head.nil? ? nil : list.head.value.to_s
	when "t"
		p list.tail.nil? ? nil : list.tail.value.to_s
	when "@"
		puts "---At(index) mode---"
		print "index> "
		index = gets.to_i
		 puts list.at(index).nil? ? "Index out of bounds." : list.at(index).value
	when "o"
		puts "---Pop mode---"
		popped = list.pop
		puts popped.nil? ? "The list is empty." : popped.value.to_s
	when "c"
	when "f"
	when "?"
		help
	when " "
		puts "---Print mode---"
		puts list
	when "x"
		puts "Exiting..."
		break
		#exit
	else
		puts "Invalid command."
	end
end



