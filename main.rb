require "./linkedlist"

def help
	puts	"#[a]ppend adds a new node to the end of the list",
			"#[p]repend adds a new node to the start of the list",
			"#[s]ize returns the total number of nodes in the list",
			"#[h]ead returns the first node in the list",
			"#[t]ail returns the last node in the list",
			"#at(index) [@] returns the node at the given index"

	puts	"#p[o]p removes the last element from the list",
			"#[c]ontains? returns true if the passed in value is in the list and otherwise returns false.",
			"#[f]ind(data) returns the index of the node containing data, or nil if not found.",
			"help [?] show all commands",
			"#to_s [<space>] represent your LinkedList objects as strings, so you can print them out and",
			"#[i]nsert_at(index) that inserts the data at the given index",
			"#[r]emove_at(index) that removes the node at the given index.",
			"#e[x]it to close"
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
		puts popped.nil? ? "The list is empty." : "Updated list: #{list}\nPopped: #{popped.value}"
	when "c"
		puts "---Contains? mode---"
		print "string to search> "
		string = gets.chomp
		puts list.contains? { |data| data == string } ? "A match has been found." : "Nothing matched."
	when "f"
		puts "---Find mode---"
		print "string to search> "
		result = list.find(gets.chomp)
		puts result.nil? ? "Nothing matched." : "Found a match at index #{result}."
	when "i"
		puts "---Insert mode---"		
		print "index> "
		index = gets.to_i
		print "string to insert> "
		string = gets.chomp
		puts list.insert_at(index, string)? "Inserted successfully." : "Insertion failed. Index is out of bounds."
		puts list
	when "r"
		puts "---Delete-at mode---"		
		print "index> "
		index = gets.to_i
		puts list.remove_at(index) ? "Deleted successfully." : "Deletion failed. Index is out of bounds."
		puts list
	when "?"
		help
	when " "
		puts "---Print mode---"
		puts list
	when "x"
		puts "Exiting..."
		break
	else
		puts "Invalid command."
	end
end
