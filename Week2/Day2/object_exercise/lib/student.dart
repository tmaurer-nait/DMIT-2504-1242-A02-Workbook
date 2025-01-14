class Student {
  /// Properties
  late String _firstName;
  late String _lastName;
  late int _idNumber;

  /// Constructors
  Student(
      {required String firstName,
      required String lastName,
      required int idNumber}) {
    this.firstName = firstName;
    _lastName = lastName;
    _idNumber = idNumber;
  }

  Student.emptyStudent() {
    _firstName = '';
    _lastName = '';
    _idNumber = 0;
  }

  /// Methods
  set firstName(String value) {
    if (value.isEmpty) {
      throw Exception('First Name must be at least 1 character');
    }
    _firstName = value;
  }

  String get firstName {
    return _firstName;
  }

  set lastName(String value) {
    if (value.isEmpty) {
      throw Exception('Last Name must be at least 1 character');
    }
    _lastName = value;
  }

  String get lastName {
    return _lastName;
  }

  set idNumber(int value) {
    if (value < 0) {
      throw Exception('ID number cannot be less than 0');
    }
    _idNumber = value;
  }

  int get idNumber {
    return _idNumber;
  }

  String get fullName {
    return '$_lastName, $_firstName';
  }

  void incrementID() {
    _idNumber++;
  }
}
