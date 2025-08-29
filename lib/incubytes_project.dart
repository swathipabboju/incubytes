int add(String input) {
  if (input.isEmpty) return 0; // Handle empty string

  // Ensure input contains at least one digit
  if (!RegExp(r'\d').hasMatch(input)) return 0;


 

  // Single number case
  if ((input.length == 1) && RegExp(r'^\d+$').hasMatch(input)) {
    int number = int.tryParse(input) ?? 0;
    if (number < 0) throw Exception("negative numbers not allowed $number");
    return number;
  }

    // Default delimiter regex
  final delimiterRegex = RegExp(r'[,;\-\s|\n]+');
  print(delimiterRegex.hasMatch(input));

 return 0;
}
