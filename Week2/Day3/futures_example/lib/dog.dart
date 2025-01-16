class Dog {
  late String message;
  late String status;

  Dog({required this.message, required this.status});
  // Equivalent to Below
  // Dog({required String message, required String status}){
  //   this.message = message;
  //   this.status = status;
  // }

  factory Dog.fromJson(dynamic json) {
    return Dog(message: json['message'], status: json['status']);
  }

  @override
  String toString() {
    return message;
  }
}
