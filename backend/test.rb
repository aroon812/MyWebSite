#!/usr/bin/ruby -w

=begin 
yo
yo
yo
=end
BEGIN {
    puts "Initializing Ruby Program"
}

$global_variable = 10

class Sample
    @@no_of_customers = 0 #class variable (think static variable)
    CONSTANT = 100 #A constant

    def initialize(id, name, addr)
        @cust_id = id #instance variables
        @cust_name = name
        @cust_addr = addr
    end

    def hello
        puts "Hello Ruby!"
    end

    def print_global
        puts "Global variable is #$global_variable"

        #substituting literals
        puts "Mult value : #{24*60*60}"
    end
end

cust1 = Sample.new("1", "x", "bigtuba")
cust2 = Sample.new("2", "y", "tombstone")

cust1.print_global

#simple array
array = ["yo", 10, 7, "cheese"]
array.each do |i|
    puts i 
end

#simple hash
hsh = colors = {"red" => 0xf00, "green" => 0x0f0, "blue" => 0x00f }
hsh.each do |key, value|
    print key, " is ", value, "\n"
end

#ranges
(10..15).each do |i|
    print i, ' '
end

END {
    puts "Terminating Ruby Program"
}
