class MyClass {
  String greeting;
  int age;

  MyClass({
    this.age = 42,
    required this.greeting
  });


  String greet() {
    return "Hello $greeting";
  }
}

var x = MyClass(greeting: "hello");
var y = MyClass(greeting: "hello", age: 41);
