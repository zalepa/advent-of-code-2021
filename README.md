# Advent of Code 2021 (in Ruby)
Solutions to Advent of Code 2021 in Ruby. Some odds and ends notes here.

## Day 1
The solution makes use of the `each_cons` method (in part 1) which essentially
returns a sliding window across an array without running off the end. Also of
note was the `positive?` method on integers which is straightforward, but a 
method that I don't frequently use (relying on `> 0`).


