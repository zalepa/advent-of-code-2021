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

# Day 5
Loved this one, this is what I think of when I think of AoC. First attempt at 
part 1 simply wound not complete execution because I naively represented the 
grid as a matrix. Put it aside for the day and realized only the data (and not
absence of data) need be stored, which led to a hash-based implementation of 
the lines.  Also, a quick search for finding all points on a line between two 
points led to the Bresenham library, which made the solution quite short. Also
enjoyed that part 1's solution was only a guard clause away from part 2's 
solution.

# Day 6
Another good one. For part 1, the brute force approach worked but in part 2 I 
quickly grinded to a halt. If you data can grow arbitrarily but a set of 
designated states is constant, represent your data with the states if possible.

# Day 7
Fairly straightfoward implementation. Difficulties included remembering the term
arithemtic sequence for part 2 and choosing the value of `@max` (still may not 
have chosen it right).

# Day 8
Part 1 was straightforward counting, but part 2 was a bit of a mess. Took a bit 
of time to make sense of the actual problem statement and then some trial and 
error until arriving at a more graphical interpreation of the problem. After 
that, things wrapped up pretty quickly.

# Day 9
(still need to finish part 2)

# Day 10
A straightforward stack-based parser

# Day 11
A few misteps with a recursive solution until I tried out a null trick. Switched
to JavaScript for this one after sketching out the solution in Ruby, which was
not happening. Sadly, feel a bit more productive hacking in JavaScript these days.

