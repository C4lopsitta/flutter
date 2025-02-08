void main() {
  dynamic something = "a string";
  print(something);
  
  something = 42;
  print(something);
  
  Map<String, dynamic> myJson = {
    "greeting": "hello",
    "age": 42
  };
  
  var myInstance = MyClass.fromJson(myJson);
  
  print(myInstance.toString());
}

class MyClass {
  MyClass({required this.greeting, required this.age});
  
  MyClass.byGreet(String greet): this(greeting: greet, age: 42);
  
  factory MyClass.fromJson(Map<String ,dynamic> json) {
    return MyClass( greeting: json["greeting"], age: json["age"] );
  }
  
  final String greeting;
  final int age;
  
  @override
  String toString() {
    return "MyClass(greeting: $greeting, age: $age)";
  }
}
