# Nauseating Numbers

Time for more problems! As you progress through this set of problems, the difficulty will ramp up. There are no RSpec tests for this exercise, so you'll want to create your own ruby file to code and test your work against the examples provided.

The solution is available here, but please do not look at it until you have attempted all of the problems!

## Phase 1: No big deal.

### strange_nums

Write a method `strange_sums` that accepts an array of numbers as an argument. The method should return a count of the number of distinct pairs of elements that have a sum of zero. You may assume that the input array contains unique elements.

Examples

```ruby
p strange_sums([2, -3, 3, 4, -2])     # 2
p strange_sums([42, 3, -1, -42])      # 1
p strange_sums([-5, 5])               # 1
p strange_sums([19, 6, -3, -20])      # 0
p strange_sums([9])                   # 0
```

### pair_product

Write a method `pair_product` that accepts an array of `numbers` and a `product` as arguments. The method should return a boolean indicating whether or not a pair of distinct elements in the array result in the product when multiplied together. You may assume that the input array contains unique elements.

Examples

```ruby
p pair_product([4, 2, 5, 8], 16)    # true
p pair_product([8, 1, 9, 3], 8)     # true
p pair_product([3, 4], 12)          # true
p pair_product([3, 4, 6, 2, 5], 12) # true
p pair_product([4, 2, 5, 7], 16)    # false
p pair_product([8, 4, 9, 3], 8)     # false
p pair_product([3], 12)             # false
```