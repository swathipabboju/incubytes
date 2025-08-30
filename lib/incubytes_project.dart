int add(String input) {
  try {

  if (input.isEmpty) return 0; // Implemented logic for empty string

  if ((input.length == 1) && (RegExp(r'^\d+$').hasMatch(input))) {
    int.tryParse(input) ?? 0; // Implemented logic for single number
  }
  // Case: default delimiters (comma or newline)
 if (input.trim().isEmpty) {
    throw FormatException("Input cannot be empty or spaces only");
  }

  // check if at least one digit exists
  if (!RegExp(r'\d').hasMatch(input)) {
    throw FormatException("Input must contain at least one number");
  }

// case : default delimiters: , and \n
  if (!input.startsWith("//")) {
    final parts = input
        .split(RegExp(r'[,\n]')) // default delimiters: , and \n
        .where((e) => e.isNotEmpty)
        .map(int.parse)
        .toList();

    return parts.reduce((a, b) => a + b);
  }

  //Case: custom delimiter format -> starts with //
  if (input.startsWith("//")) {
    if (input.length < 4) {
      throw Exception("Invalid input: missing delimiter or numbers");
    }

    // delimiter is at index 2
    String delimiter = input[2];
    if (RegExp(r'^\d+$').hasMatch(delimiter)) {
      throw Exception("Digit delimiters are not allowed: $delimiter");
    }

    // Must have newline right after delimiter
    if (input[3] != '\n') {
      throw Exception("Invalid input: missing newline after delimiter");
    }

    // Numbers start after newline
    String numbersPart = input.substring(4);

    if (numbersPart.isEmpty) return 0;

    List<String> parts = numbersPart.split(delimiter);

    // Handle negatives
    List<int> numbers = parts.map((p) {
      if (p.trim().isEmpty) {
        throw Exception("Invalid input: empty number between delimiters");
      }
      return int.parse(p);
    }).toList();

    List<int> negatives = numbers.where((n) => n < 0).toList();
    if (negatives.isNotEmpty) {
      throw Exception("negative numbers not allowed ${negatives.join(",")}");
    }

    return numbers.reduce((a, b) => a + b);
    
  }
   return 0;
 
}
catch (e) {
  
    print('Error: $e'); // only show the error message, no stack trace
     return 0;
  }
}
