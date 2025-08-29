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
  test('numbers separated by newline', () {
    expect(add('1\n2\n3'), equals(6));
  });

 
   
}
