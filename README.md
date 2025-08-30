A sample command-line application with an entrypoint in `bin/`, library code
in `lib/`, and example unit test in `test/`.

String Calculator:
This project is a robust string calculator that can process various input formats to sum a list of numbers. It is built to handle a variety of delimiters, including custom ones, and includes validation for negative numbers and large values.

1. Execution Code (lib/ or bin/ folder)
The core logic of your add function would be located in a Dart file within the lib/ directory, for example, lib/string_calculator.dart. If your project were a command-line application, you might also have a bin/main.dart file to run the code.
The add method and its helper functions (_parseNumbers, _validateNegatives) are defined in this file. The main function for a standalone program to demonstrate the add method.
2. Test Cases (test/ folder)
Your test cases are written in a separate file, typically located in the test/ directory. By convention, this file's name should end with _test.dart. For example, test/string_calculator_test.dart.

This file contains all the test() and group() functions that use the test package to verify the behavior of your add method. Each test case, such as test('single number returns its value', ...) and test('negative number returns exception', ...) is a small, self-contained check of one specific feature.
3. Giving Input
For string calculator, there are a couple of ways to provide input to the add function:
Within the Test File: This is the most common way. The input strings (e.g., "1,5", "//;\n1;2") are hardcoded directly within each expect statement. This ensures that each test is deterministic and repeatable.
As a Command-Line Argument: If you had a main function in a bin/ directory, you could take user input directly from the terminal.


Features:
Any Amount of Numbers: The add method can handle any number of inputs.

Flexible Delimiters: Supports commas (,), newlines (\n), and custom delimiters defined in the input string.

Custom Delimiters:

Single Character: Supports a single custom delimiter with the format //[delimiter]\n (e.g., //;\n1;2 returns 3).

Any Length: Supports delimiters of any length, such as //[***]\n1***2***3 which returns 6.

Negative Number Handling: Throws an exception with the message "negative numbers not allowed <negative_number>" if any negative numbers are found. If there are multiple, all are listed in the exception message.

Number Filtering: Any number greater than 1000 is ignored in the sum, so 2,1001 returns 2.

Empty Input: An empty string ("") or a string with just whitespace returns 0.

Usage
To run the tests and see the calculator in action, execute the following command in your terminal:dart test 
code examples here :
<img width="1776" height="1034" alt="image" src="https://github.com/user-attachments/assets/4ed575fb-0658-49d8-8574-bb1bbf7642ec" />
also uploaded case wise sceenshots in branch V2.0 of github repository 
