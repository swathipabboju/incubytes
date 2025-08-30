import 'package:incubytes_project/incubytes_project.dart';
import 'package:test/test.dart';

void main() {
// Added test for empty string
  test('empty string returns 0', () {
    expect(add(""), 0);
     expect(add('   '), equals(0));
  });
  test("single digit ", () {
    expect(add("6"), 6);
  });
 
 
  test("any amount of numbers seperated by commas", () {
    expect(add("6,1,3"), 10);
  });

  test('sum of numbers separated by commas and newlines', () {
    expect(add('1\n2,3'), equals(6));
  });
  test('sum of numbers separated by newline', () {
    expect(add('1\n2\n3'), equals(6));
  });

  test('Custom delimiter ";"', () {
    expect(add("//;\n1;2;3"), equals(6));
  });

 

  test('Custom delimiter with multi-digit numbers', () {
    expect(add("//;\n81;9;10"), equals(100));
  });

  test('negative number throws with message including negatives', () {
   
   
  
    expect(
      () => add('-8'),
      throwsA(predicate((e) => e.toString().contains('negative numbers not allowed -8'))),
    );
    expect(
      () => add('1,-2,3'),
      throwsA(predicate((e) => e.toString().contains('negative numbers not allowed -2'))),
    );

    expect(
      () => add('-1,-2'),
      throwsA(predicate((e) => e.toString().contains('-1') && e.toString().contains('-2'))),
    );

    expect(
      () => add('-1\n-2'),
      throwsA(predicate((e) => e.toString().contains('-1') && e.toString().contains('-2'))),
    );
    expect(
      () => add('//>\n-2>7'),
      throwsA(predicate((e) =>  e.toString().contains('-2'))),
    );
  });

 

  // test('Throws exception for multiple negative numbers', () {
  //   expect(
  //       () => add("//;\n-1;-2;-3"),
  //       throwsA(predicate((e) =>
  //           e is Exception &&
  //           e.toString().contains("negative numbers not allowed -1,-2,-3"))));
  // });

  
 // test('Custom delimiter "-"', () {
  //   expect(add("//-\n10-20-30"), equals(60));
  // });
  
}
