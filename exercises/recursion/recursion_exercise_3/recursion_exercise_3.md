# Recursion exercises

## Recursion

### Learning Goals

- Know how to reason about recursive programs
  - Be able to write a base case for a recursive method
  - Be able to write the inductive step for a recursive method
- Be able to explain the benefits of writing a method recursively vs. iteratively
- Be able to trace a recursive method and figure out how many recursive steps it will take
- Know how to write recursive sorting and searching algorithms

#### Warmup

- Write a recursive method, `range`, that takes a start and an end and returns an array of all numbers in that range, exclusive. For example, `range(1, 5)` should return `[1, 2, 3, 4]`. If `end < start`, you can return an empty array.
- Write both a recursive and iterative version of sum of an array.

#### Exponentiation

Write two versions of exponent that use two different recursions:

```ruby
# this is math, not Ruby methods.

# recursion 1
exp(b, 0) = 1
exp(b, n) = b * exp(b, n - 1)

# recursion 2
exp(b, 0) = 1
exp(b, 1) = b
exp(b, n) = exp(b, n / 2) ** 2             [for even n]
exp(b, n) = b * (exp(b, (n - 1) / 2) ** 2) [for odd n]
```

Note that for recursion 2, you will need to square the results of `exp(b, n / 2)` and `(exp(b, (n - 1) / 2)`. Remember that you don't need to do anything special to square a number, just calculate the value and multiply it by itself. *So don't cheat and use exponentiation in your solution.*

*Suggestion*: [Break the methods down into parts..](https://open.appacademy.io/learn/full-stack-online/ruby/breaking-methods-into-parts)

*Suggestion 2*: Try walking through your code with Simple Examples.

If the `n == 256`, about how many nested recursive steps will we run in the first case?

How deep will we need to recurse for the second? Keep in mind that the first reduces the exponent by one for each recursion, while the second reduces it by half.

In addition to testing your methods by running the code, try the following exercise:

On paper, write out the value of each variable for every line in the code:

- Write out what happens with base 0 and power 0 as inputs (should be easy). e.g., if you had run `exp(0,0)`.
- Write out what happens for base 0 and power 1. e.g., if you had run `exp(0,1)`.
- Write out what happens for base 1 and power 0.
- Write out what happens for base 1 and power 1.
- Write out what happens for base 1 and power 2.
- Write out what happens for base 2 and power 0.
- Write out what happens for base 2 and power 1.
- Write out what happens for base 2 and power 2.

Make sure you can trace from the very beginning to the very end in these examples.

How many examples do you need to walk through to be confident that it works?

#### Deep dup

The `#dup` method doesn't make a *deep copy*:

```ruby
robot_parts = [
  ["nuts", "bolts", "washers"],
  ["capacitors", "resistors", "inductors"]
]

robot_parts_copy = robot_parts.dup

# shouldn't modify robot_parts
robot_parts_copy[1] << "LEDs"
# but it does
robot_parts[1] # => ["capacitors", "resistors", "inductors", "LEDs"]
```

When we `dup` an `Array`, it creates a new array to hold the elements, but doesn't recursively `dup` any arrays contained therein. So the `dup` method creates one new array, but just copies over references to the original interior arrays.

Sometimes you want a shallow dup and sometimes you want a deep dup. Ruby keeps things simple by giving you shallow dup, and letting you write deep dup yourself.

*Using recursion and the `is_a?` method, write an `Array#deep_dup` method that will perform a "deep" duplication of the interior arrays.*

*Note:* For simplicity's sake, we are only going to ensure the deep duplication of arrays. Don't worry about deep-duping (or regular-duping) other types of mutable objects (like strings, hashes, instances of custom classes, etc.), since this would require that we implement a deep dup method for each of those classes, as well.

It's okay to iterate over array elements using the normal `each` for this one :-)

*You should be able to handle "mixed" arrays*. For instance: `[1, [2], [3, [4]]]`.