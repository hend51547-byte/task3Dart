//////tas 1/////
void main() {
  BankAccount b = BankAccount(accountNumber: 1234);
  b.setBalance(100000);
  print(" your total balance is ${b.getBalance()}");
  b.deposit(5432);
  b.withdraw(200000);
}

class BankAccount {
  double _balance = 0.0;
  int accountNumber = 0000;

  BankAccount({required this.accountNumber}) {}
  void setBalance(double balance) {
    this._balance = balance;
  }

  double getBalance() => _balance;
  double deposit(double amount) {
    if (amount > 0) {
      _balance += amount;
      print("Your balance is $_balance");
    } else {
      print("please enter postive number");
    }
    return _balance;
  }

  double withdraw(double amount) {
    if (amount < _balance || amount > 0) {
      _balance -= amount;
      print("our balance after withdraw is $_balance");
      
    } else {
      print("Please enter postive number");
    }
    return _balance;
  }
}
/////task2//////
void main() {
  Develpor E = Develpor(track: "flutter", name: "Hend", Salary: 9000);
  E.info(2);
  Designer d = Designer(
    designTools: ["Photoshop"],
    name: "Ahmed",
    Salary: 17000,
  );
  d.info("self learner");
}

class Employee {
  String? name;
  double? Salary;
  Employee({required this.name, required this.Salary});
}

class Develpor extends Employee {
  String track;
  Develpor({required this.track, required super.name, required super.Salary});
  void info(int year) {
    if (year > 4) {
      print("the developer is senior");
    } else {
      print("He /she is junior");
    }
  }
}

class Designer extends Employee {
  List<String> designTools;
  Designer({
    required this.designTools,
    required super.name,
    required super.Salary,
  });
  void info(String skill) {
    designTools.add(skill);
    print("your new skill is $skill");
  }
}
/////task 3//////
void main() {
  CashPayment c = CashPayment(credit: 1000);
  CreditCardPayment c1 = CreditCardPayment(credit: 5000);

  c.pay(2000);
  c1.pay(3000);
}

abstract class PaymentMethod {
  double credit = 0.0;
  PaymentMethod({required this.credit});
  pay(double amount);
}

class CreditCardPayment extends PaymentMethod {
  CreditCardPayment({required super.credit});

  @override
  void pay(double amount) {
    if (amount > 0 && amount <= credit) {
      credit -= amount;
      print("the CreditCardPayment process is successful");
    } else {
      print("Please try again");
    }
  }
}

class CashPayment extends PaymentMethod {
  CashPayment({required super.credit});
  @override
  void pay(double amount) {
    if (amount > 0 && amount <= credit) {
      credit -= amount;
      print("the CashPayment process is successful");
    } else {
      print("please tr again");
    }
  }
}
// The class 'PaymentMethod' is abstract and can't be instantiated
//////////task 4//////
void main() {
   EmailNotification();
   SmsNotification();
 PushNotification();
 List<NotificationServices> name = [EmailNotification(), SmsNotification(), PushNotification()];
  for (NotificationServices info in name) {
    info.sendNotification();
  }
}

abstract class NotificationServices {
  void sendNotification();
}

class EmailNotification extends NotificationServices {
  EmailNotification();
  @override
  void sendNotification() {
    print("you have a notification from email");
  }
}

class SmsNotification extends NotificationServices {
  SmsNotification();
  @override
  void sendNotification() {
    print("you have a notification from sms");
  }
}

class PushNotification extends NotificationServices {
  PushNotification();
  @override
  void sendNotification() {
    print("you have a notification from push");
  }
}
///////task 5////////
void main() {
 Electronics tv= Electronics(name: "tv", price: 10000);
  Clothing skirt=Clothing(name: "skirt", price: 500);
  List<Product> list = [tv, skirt];
  for (Product p in list) {
    p.calculateDiscount();
  }
  ShoppingCart cart = ShoppingCart();
  cart.addProduct(tv);
  cart.removeProduct(tv);
  print(cart.getFinalTotal());
}

abstract class Product {
  String name;
  double price;
  double calculateDiscount();
  Product({required this.name, required this.price});
}

class Electronics extends Product {
  Electronics({required super.name, required super.price});
  double discountRate = 0.25;
  @override
  double calculateDiscount() {
    double pricedBought = price;
    if (pricedBought >= 20000) {
      pricedBought -= (pricedBought * discountRate);
      print("the price of electronics after discount is $pricedBought");
    } else {
      print("Sorry you don't have an discounts");
    }
    return pricedBought;
  }
}

class Clothing extends Product {
  Clothing({required super.name, required super.price});
  double discountRate = 0.05;

  double calculateDiscount() {
    double pricedBought = price;
    if (pricedBought >= 5000) {
      pricedBought -= (pricedBought * discountRate);
      print("the price of clothes after discount is $pricedBought");
    } else {
      print("Sorry you don't have any discounts");
    }
    return pricedBought;
  }
}

class ShoppingCart {
  List<Product> _products = [];
  void addProduct(Product product) {
    for (Product item in _products) {
      _products.add(product);
    }
  }

  void removeProduct(Product item) {
    for (Product item in _products) {
      _products.remove(item);
    }
  }

  double getFinalTotal() {
    double total = 0;
    for (Product item in _products) {
      total += item.calculateDiscount();
    }
    return total;
  }
}
