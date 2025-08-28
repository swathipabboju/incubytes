int add(String input) {
  if (input.isEmpty) return 0; // Implemented logic for empty string

  if ((input.length == 1) && (RegExp(r'^\d+$').hasMatch(input))) {
    int.tryParse(input) ?? 0; // Implemented logic for single number
  }

  //any amount of numbers splitted  by comma
  final parts = input.split(',');
  return parts.map(int.parse).reduce((a, b) => a + b);

}
