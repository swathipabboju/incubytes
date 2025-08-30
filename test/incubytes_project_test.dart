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

 test('numbers bigger than 1000 are ignored', () {
  expect(add('2,1001'), equals(2));
  expect(add('1000,2,1001'), equals(1002));
  expect(add('//;\n2;1001;1002;3'), equals(5));
});

  
  
}
