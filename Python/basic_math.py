# module basic math
"""
This is an example of docstring to demonstrate a module.
"""

# addition function
def add(a, b):
    """Return the sum of two numbers."""
    return a + b

# substract function
def subtract(a, b):
    """Return the difference of two numbers."""
    return a - b

# multiply function
def multiply(a, b):
    """Return the product of two numbers."""
    return a * b

# divide function
def divide(a, b):
    """
    Return the quotient of two numbers. 
    If division by zero is attempted, return a message.
    """
    if b == 0:
        return "Error: Division by zero!"
    return a / b