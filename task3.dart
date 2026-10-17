

void main() {
  print(calculate_total(50.0, 3));
  print(calculate_total(25.5, 2));
  ///====================///////
  print(greetUser("Hend"));
  /////==================/////
  print(calculateOrder(150, 2));
  print(
    filterNumbers([1, 2, 5, 8, 12, 15], min: 2, max: 12, includeEven: true),
  );
  print(
    calculateCartTotal(
      [100, 200, 50],
      discountPercent: 10,
      taxPercent: 14,
      deliveryFee: 25,
    ),
  );
  /////================//////
  print(
    calculateCartTotal(
      [100, 200, 50],
      discountPercent: 10,
      isMember: true,
      maxDiscount: 12,
    ),
  );
  ///////===============///////
  print(calculateCartTotal([]));
  print(calculateCartTotal([100, 200, 50], isMember: true));
  print(
    calculateCartTotal(
      [100, 200, 50],
      discountPercent: 10,
      isMember: true,
      maxDiscount: 12,
    ),
  );
  print(calculateCartTotal([100, 200]));
}

  /////task 1/////
  double calculate_total(double price, int quantity) {
    double totalPrice = price * quantity;
    return totalPrice;
  }

  //////task 2///////
  String greetUser(String name, [String greeting = "Hello"]) {
    return "$greeting ! $name";
  }

  ///////task 3/////
  double calculateOrder(
    double price,
    int quantity, {
    double discount = 0,
    double deliveryFee = 0,
  }) {
    double orderPrice = (price * quantity) - discount + deliveryFee;
    return orderPrice;
  }

  ///////task 4/////
  List<int> filterNumbers(
    List<int> numbers, {
    int min = 0,
    int max = 100,
    bool includeEven = true,
  }) {
    List<int> output = [];
    for (int N in numbers) {
      if (N >= min && N <= max) {
        if (N % 2 == 0 || !includeEven) {
          output.add(N);
        }
      }
    }
    return output;
  }
  ///////task 5////////////

  double calculateCartTotal(
    List<double> prices, {
    double discountPercent = 0,
    double taxPercent = 14,
    double deliveryFee = 0,
    bool isMember = false,
    double maxDiscount = 100,
  }) {
    List<double> result = [];
    double subtotal = 0;

    for (double item in prices) {
      subtotal += item;
    }
    double discounted_subtotal = subtotal - subtotal * discountPercent * 0.01;
    double price_tax = discounted_subtotal * (1 + taxPercent);
    double final_total = price_tax + deliveryFee + discounted_subtotal;
    print("subtotal is :$subtotal ");
    double discountTotal = discountPercent;
    if (isMember) {
      double discountTotal = discountPercent;
      discountTotal += 5;
      print(
        "Congrats you've taken 5% discount so your total price becomes ${discountTotal}",
      );
    }
    if (discountTotal > maxDiscount) {
      discountTotal = maxDiscount;
    }

    return final_total;
  }
}
