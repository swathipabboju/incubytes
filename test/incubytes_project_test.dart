import 'package:incubytes_project/incubytes_project.dart';
import 'package:test/test.dart';

void main() {
// Added test for empty string
  test('empty string returns 0', () {
    expect(add(""), 0);
  });
  test("single digit ", () {
    expect(add("6"), 6);
  });
 
 
  test("any amount of numbers seperated by commas", () {
    expect(add("6,1,3"), 10);
  });

  test('sums numbers separated by commas and newlines', () {
    expect(add('1\n2,3'), equals(6));
  });
  test('sums numbers separated by newline', () {
    expect(add('1\n2\n3'), equals(6));
  });

  test('Custom delimiter ";"', () {
    expect(add("//;\n1;2;3"), equals(6));
  });

  test('Custom delimiter "-"', () {
    expect(add("//-\n10-20-30"), equals(60));
  });

  test('Custom delimiter with multi-digit numbers', () {
    expect(add("//;\n81;9;10"), equals(100));
  });

  test('Throws exception for negative numbers', () {
    expect(
        () => add("//;\n1;-2;3"),
        throwsA(predicate((e) =>
            e is Exception &&
            e.toString().contains("negative numbers not allowed -2"))));
  });

  test('Throws exception for multiple negative numbers', () {
    expect(
        () => add("//;\n-1;-2;-3"),
        throwsA(predicate((e) =>
            e is Exception &&
            e.toString().contains("negative numbers not allowed -1,-2,-3"))));
  });

  test('Invalid custom delimiter definition (missing newline)', () {
    expect(() => add("//;\t1;2"), throwsException);
  });

  test('Empty number between delimiters should throw exception', () {
    expect(() => add("//;\n1;;2"), throwsException);
  });
}
