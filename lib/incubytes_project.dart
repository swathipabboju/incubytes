int add(String input) {
  try {
    // Handling empty or whitespace-only strings
    if (input.trim().isEmpty) {
      return 0;
    }

    // Determine numbers and delimiter based on the input format
    List<int> numbers;
    String numbersPart;

    if (input.startsWith("//")) {
      // Custom delimiter format (e.g., "//;\n1;2;3")
      if (input.length < 4 || input[3] != '\n') {
        throw Exception("Invalid input: missing newline after delimiter");
      }

      String delimiter = input[2];
      if (RegExp(r'^\d+$').hasMatch(delimiter)) {
        throw Exception("Digit delimiters are not allowed: $delimiter");
      }

      numbersPart = input.substring(4);
      numbers = _parseNumbers(numbersPart, delimiter);
    } else {
      // Default delimiters (comma and newline)
      numbersPart = input;
      numbers = _parseNumbers(numbersPart, r'[,\n]');
    }

    // Validate and check for negative numbers
    _validateNegatives(numbers);

    // Calculate and return the sum
    return numbers.reduce((a, b) => a + b);

  } catch (e) {
    print('invalid input!! $e');
    rethrow;
  }
}

/// A private helper function to parse numbers from a string
List<int> _parseNumbers(String numbersPart, String delimiter) {
  return numbersPart
      .split(RegExp(delimiter))
      .where((s) => s.isNotEmpty)
      .map((s) {
        return int.parse(s);
      })
      .toList();
}

/// A private helper function to check for negative numbers and throw an exception
void _validateNegatives(List<int> numbers) {
  final negatives = numbers.where((n) => n < 0).toList();
  if (negatives.isNotEmpty) {
    throw Exception("negative numbers not allowed ${negatives.join(",")}");
  }
}

