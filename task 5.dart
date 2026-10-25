////task 1////

void main() {
  Student std = Student();
  std.setAge(19);
  print("your age is :${std.getAge()}");

  std.setName("Hend");
  print("Your name is ${std.getName()}");
  std.setGrade(87);
  print("your grade is ${std.getGrade()}");
}

class Student {
  String _name = "unknown";
  int _age = 1;
  double _grade = 0.0;
  Student();
  String getName() => _name;
  int getAge() => _age;
  double getGrade() => _grade;
  void setName(String name) {
    this._name = name;
    
  }

  void setAge(int age) {
    if (age < 0) {
      print("Please enter a postive number");
    } else {
      this._age = age;
    }
  }

  void setGrade(double grade) {
    if (grade > 0 && grade <= 100) {
      this._grade = grade;
    } else {
      print("our answer is wrong");
    }
  }
}

///////task 2//////
void main() {
  BankAccount b = BankAccount();
  b.setAccounrHolder("Hend");
  print("your name is :${b.getAccountHolder()}");
  b.setBalance(10000);
  print("your balance is :${b.getBalance()}");
  print("our balnce after withdraw is ${b.withdraw(2000)}");
  b.deposit(900);
}

class BankAccount {
  String _accountHolder = "unknown";
  double _balance = 0.0;
  BankAccount();
  void setAccounrHolder(String accountHolder) {
    this._accountHolder = accountHolder;
  }

  void setBalance(double balance) {
    this._balance = balance;
  }

  String getAccountHolder() => _accountHolder;
  double getBalance() => _balance;

  void deposit(double amount) {
    if (amount > 0) {
      _balance += amount;
      print("your balance after deposit is $_balance");
    } else {
      print("please enter postive number");
    }
  }

  double withdraw(double amount) {
    if (amount < 0 || amount > _balance) {
      print("you can't complete as amount is invalid or exceeding the balance");
    } else {
      _balance -= amount;
    }
    return _balance;
  }
}
/////task 3/////
void main() {
  Student s = Student(grade: 89, studentId: 2345);
  s.setAge(19);
  s.setName("Hend");
  s.displayInfo();
}

class Person {
  String _name = "unknown";
  int _age = 1;
  Person();
  void setName(String name) {
    this._name = name;
  }

  void setAge(int age1) {
    _age = age1;
  }

  String getName() => _name;
  int getAge() => _age;
  displayInfo() {
    print("your name is :$_name");
    print("Your age is :$_age");
  }
}

class Student extends Person {
  int studentId;
  double grade;
  Student({required this.studentId, required this.grade});
  void setStudentId(int studentId) {
    this.studentId = studentId;
  }

  void setGrade(double grade) {
    this.grade = grade;
  }

  displayInfo() {
    super.displayInfo();

    print("your Id is :$studentId");
    print("Your grade is :$grade");
  }
}