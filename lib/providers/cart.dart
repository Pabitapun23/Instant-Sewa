import 'package:flutter/foundation.dart';

class CartItem {
  final String id;
  final String subCategoryName;
  final String subSubCategoryName;
  final int quantity;
  final int price;

  CartItem(
      {@required this.id,
      @required this.subCategoryName,
      @required this.subSubCategoryName,
      @required this.quantity,
      @required this.price});
}

class Cart with ChangeNotifier {
  Map<String, CartItem> _services = {};
  Map<String, CartItem> get services {
    return {..._services};
  }

  int get serviceCount {
    return _services.length;
  }

  double get totalAmount {
    var total = 0.0;
    _services.forEach((key, cardItem) {
      total += cardItem.price * cardItem.quantity;
    });
    return total;
  }

  String quantityCount(String subSubCategoryName) {
    String quantity = '0';
    _services.forEach((key, cardItem) {
      if (cardItem.subSubCategoryName == subSubCategoryName) {
        quantity = cardItem.quantity.toString();
      }
    });

    return quantity;
  }

  void deleteService(
    String serviceId,
    String subCategoryName,
    String subSubCategoryName,
    int price,
  ) {
    if (quantityCount(subSubCategoryName) == '1') {
      removeItem(serviceId);
    } else if (quantityCount(subSubCategoryName) == '0') {
    } else {
      _services.update(
          serviceId,
          (existingCartService) => CartItem(
                id: existingCartService.id,
                subSubCategoryName: existingCartService.subSubCategoryName,
                subCategoryName: existingCartService.subCategoryName,
                price: existingCartService.price,
                quantity: existingCartService.quantity - 1,
              ));
    }
    notifyListeners();
  }

  void addServices(
    String serviceId,
    String subCategoryName,
    String subSubCategoryName,
    int price,
  ) {
    if (_services.containsKey(serviceId)) {
      //change quantity
      _services.update(
          serviceId,
          (existingCartService) => CartItem(
                id: existingCartService.id,
                subSubCategoryName: existingCartService.subSubCategoryName,
                subCategoryName: existingCartService.subCategoryName,
                price: existingCartService.price,
                quantity: existingCartService.quantity + 1,
              ));
    } else {
      _services.putIfAbsent(
        (serviceId),
        () => CartItem(
          id: DateTime.now().toString(),
          subCategoryName: subCategoryName,
          subSubCategoryName: subSubCategoryName,
          price: price,
          quantity: 1,
        ),
      );
    }
    notifyListeners();
  }

  void removeItem(String serviceId) {
    _services.remove(serviceId);
    notifyListeners();
  }
  int numberById(String serviceName)
  {
    int i=0;
    int count;
    _services.forEach((key, cardItem) {
      if (cardItem.subSubCategoryName == serviceName) {
        count = i;
      }
      i++;
    });
    return count;
  }

  List<String> getId(String subCategoryName) {
    List<String> cartList = [];
    _services.forEach((key, cardItem) {
      if (cardItem.subCategoryName == subCategoryName) {
        cartList.add(cardItem.id);
      }
    });

    return cartList;
  }


  String getServiceName(String id) {
    String service;
    _services.forEach((key, cardItem) {
      if (cardItem.id == id) {
        service = cardItem.subSubCategoryName;
      }
    });

    return service;
  }
}
