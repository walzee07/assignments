#!/bin/bash

# declare variables (prompt user for input

read -p "Enter the first number: " num1
read -p "Enter an operator (+, -, *, /): " operator
read -p "Enter the second number: " num2



# Perform calculation
case "$operator" in
    +)
        result=$(echo "$num1 + $num2" | bc)
        ;;
    -)
        result=$(echo "$num1 - $num2" | bc)
        ;;
    \*)
        result=$(echo "$num1 * $num2" | bc)
        ;;
    /)
        # Check for division by zero
        if [ "$num2" == "0" ]; then
            echo "Error: Division by zero"
            exit 1
        fi
        result=$(echo "scale=2; $num1 / $num2" | bc)
        ;;
    *)
        echo "Error: Invalid operator. Use +, -, *, or /"
        exit 1
        ;;
esac

echo "Result of $num1 $operator $num2: $result"