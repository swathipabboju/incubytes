int add(String input) {
  try {
   

// handling empty string
  if (input.trim().isEmpty) return 0; 


// handling  single number
  if ((input.length == 1)&& ((int.tryParse(input) ?? 0)<0) && (RegExp(r'^\d+$').hasMatch(input))) {
    int.tryParse(input) ?? 0;
  }
  

// handling default delimiters: , and \n
  if (!input.startsWith("//")) {
    final parts = input
        .split(RegExp(r'[,\n]')) 
        .where((e) => e.isNotEmpty)
        .map(int.parse)
        .toList();
    return parts.reduce((a, b) => a + b);
  }

  //handling custom delimiter format -> starts with //
  if (input.startsWith("//") && input.length > 4) {
   
    
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

    List<String> splittedNumbers = numbersPart.split(delimiter);

    // Handling negative numbers 
    List<int> numbers = splittedNumbers.map((number) {
      if (number.trim().isEmpty) {
        throw Exception("Invalid input: empty number between delimiters");
      }
      return int.parse(number);
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
    print('invalid input!! $e'); 
     return 0;
  }
}


// // check if at least one digit exists
//   if (!RegExp(r'\d').hasMatch(input)) {
//     throw FormatException("Input must contain at least one number");
//   }

// -------------
//  if (input.startsWith("//")) {
//     if (input.length < 4) {
//       throw Exception("Invalid input: missing delimiter or numbers");
//     }

//     // delimiter is at index 2
//     String delimiter = input[2];
//     if (RegExp(r'^\d+$').hasMatch(delimiter)) {
//       throw Exception("Digit delimiters are not allowed: $delimiter");
//     }

//     // Must have newline right after delimiter
//     if (input[3] != '\n') {
//       throw Exception("Invalid input: missing newline after delimiter");
//     }

//     // Numbers start after newline
//     String numbersPart = input.substring(4);

//     if (numbersPart.isEmpty) return 0;

//     List<String> parts = numbersPart.split(delimiter);

//     // Handle negatives
//     List<int> numbers = parts.map((p) {
//       if (p.trim().isEmpty) {
//         throw Exception("Invalid input: empty number between delimiters");
//       }
//       return int.parse(p);
//     }).toList();

//     List<int> negatives = numbers.where((n) => n < 0).toList();
//     if (negatives.isNotEmpty) {
//       throw Exception("negative numbers not allowed ${negatives.join(",")}");
//     }

//     return numbers.reduce((a, b) => a + b);
    
//   }