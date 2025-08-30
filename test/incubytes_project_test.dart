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

  test("any amount of numbers seperated by commas", () {
    expect(add("6,1,3"), 10);
  });

  test('sums numbers separated by commas and newlines', () {
    expect(add('1\n2,3'), equals(6));
  });
  test('sums numbers separated by newline', () {
    expect(add('1\n2\n3'), equals(6));
  });

  test('sums numbers with mixed delimiters', () {
    expect(add('1,2\n3;4-5 6|7'), equals(28));
  });

  test('ignores empty values between delimiters', () {
    expect(add('1,,2\n\n3'), equals(6));
  });

  test('works with single-digit numbers and spaces', () {
    expect(add(' 1 2 3 '), equals(6));
  });
  test('sums multiple numbers with custom delimiter', () {
    expect(add('//1;2;3'), equals(6));
  });

  test('trims first 2 characters correctly', () {
    expect(add('//4;5;6'), equals(15));
  });

  test('ignores empty values between delimiters', () {
    expect(add('//1;;2;3'), equals(6));
  });

  test('works with single number', () {
    expect(add('//7'), equals(7));
  });

  test('returns 0 if input starts with // but has no numbers', () {
    expect(add('//'), equals(0));
    expect(add('///'), equals(0));
  });

  test('handles numbers with spaces (ignored)', () {
    expect(add('//1; 2;3'), equals(6));
  });
  test('throws exception for single negative number', () {
    expect(
        () => add('-5'),
        throwsA(predicate((e) =>
            e is Exception &&
            e.toString() == 'Exception: negative numbers not allowed -5')));
  });

  test('throws exception for multiple negative numbers', () {
    expect(
        () => add('1,-2,3,-4'),
        throwsA(predicate((e) =>
            e is Exception &&
            e.toString() == 'Exception: negative numbers not allowed -2,-4')));
  });

  test('returns 0 if input has no digits', () {
    expect(add('abc'), equals(0));
    expect(add('///;;;'), equals(0));
  });
}
