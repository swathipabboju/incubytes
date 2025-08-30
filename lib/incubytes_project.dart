int add(String input) {
  if (input.isEmpty) return 0; // Implemented logic for empty string


  if ((input.length == 1) && (RegExp(r'^\d+$').hasMatch(input))) {
    int.tryParse(input) ?? 0; // Implemented logic for single number
  }


  //any amount of numbers splitted  by comma


//  if (input.contains(',')) {
//     final parts = input.split(',');
//     return parts.map(int.parse).reduce((a, b) => a + b);
//   }


  // handling newlines in addition to comma
  final delimiterRegex = RegExp(r'[,;\-\s|\n]+');
  if (!input.startsWith("//") && (input.length > 2)) {
    final parts = input
        .split(delimiterRegex)
        .where((e) => e.isNotEmpty)
        .map(int.parse)
        .toList();


    return parts.reduce((value, element) => value + element);
  }


  //custom regex
  if (input.startsWith("//") && (input.length > 2)) {
    String trimmed = input.substring(2);
    final p = trimmed
        .split(delimiterRegex)
        .where((e) => e.isNotEmpty)
        .map(int.parse)
        .toList();


    var r = p.reduce((value, element) => value + element);
    return r;
  }
  return 0;


  //
}
