#!/bin/bash

a=5
b=2

echo "$a+$b" | bc
echo "$a-$b" | bc
echo "$a*$b" | bc
echo "scale=2;$a/$b" | bc

# Bash can’t handle floating point division natively.

# So what do you do? You pipe values into an external tool like bc.
echo "scale=2; 5/2" | bc

# This gives you 2.50, not just 2.

# Tip for beginners:

# Use (( )) for integer math

# Use bc for floats

# Use echo | bc to combine them
