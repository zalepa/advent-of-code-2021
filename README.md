# Advent of Code 2021 (in Ruby)
Solutions to Advent of Code 2021 in Ruby. Some odds and ends notes here.

## Day 1
The solution makes use of the `each_cons` method (in part 1) which essentially
returns a sliding window across an array without running off the end. Also of
note was the `positive?` method on integers which is straightforward, but a 
method that I don't frequently use (relying on `> 0`).

## Day 2
Nothing overly interesting, but a few things not used often and a heavily OO 
approach.

# Day 3
Used Ruby's native `Matrix` class, it was not great. Quite tired for part 2, so
not very clever.

# Day 4
A fairly straightfoward solution, `Matrix::transpose` makes another apperance.