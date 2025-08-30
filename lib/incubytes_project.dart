int add(String input) {
  try {
    if (input.trim().isEmpty) {
      return 0;
    }

    List<int> numbers;
    String numbersPart;
    String delimiter;

    if (input.startsWith("//[")) {
      // New custom delimiter format (e.g., "//[***]\n1***2***3")

      // Find the position of the closing bracket and newline
      final endBracket = input.indexOf(']\n');
      print(endBracket);

      // If not found, the format is invalid
      if (endBracket == -1) {
        throw Exception("Invalid input: custom delimiter format missing ']\n'");
      }

      // The delimiter is the text between "//[" and "]\n"
      delimiter = RegExp.escape(input.substring(3, endBracket));

      // The numbers start right after "]\n"
      numbersPart = input.substring(endBracket + 2);

      // Parse the numbers using the extracted delimiter
      numbers = _parseNumbers(numbersPart, delimiter);
    } else if (input.startsWith("//")) {
      // Old custom single-character delimiter format
      if (input.length < 4 || input[3] != '\n') {
        throw Exception(
            "Invalid input: missing newline after single-character delimiter");
      }
      delimiter = input[2];
      numbersPart = input.substring(4);
      numbers = _parseNumbers(numbersPart, RegExp.escape(delimiter));
    } else {
      // Default delimiters (comma and newline)
      numbersPart = input;
      numbers = _parseNumbers(numbersPart, r'[,\n]');
    }

    _validateNegatives(numbers);

    final validNumbers = numbers.where((n) => n <= 1000).toList();

    return validNumbers.reduce((a, b) => a + b);
  } catch (e) {
    print('invalid input!! $e');
    rethrow;
  }
}

// helper function to parse numbers from a string
List<int> _parseNumbers(String numbersPart, String delimiter) {
  return numbersPart
      .split(RegExp(delimiter))
      .where((s) => s.isNotEmpty)
      .map((s) {
    return int.parse(s);
  }).toList();
}

// helper function to check for negative numbers and throw an exception
void _validateNegatives(List<int> numbers) {
  final negatives = numbers.where((n) => n < 0).toList();
  if (negatives.isNotEmpty) {
    throw Exception("negative numbers not allowed ${negatives.join(",")}");
  }
}
