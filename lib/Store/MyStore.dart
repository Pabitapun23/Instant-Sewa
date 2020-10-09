import 'package:flutter/material.dart';
import 'package:instantsewa/model/cart_model.dart';

//add global variables and getters and functions to modify the contents of variable here
class MyStore extends ChangeNotifier {
  //add global variables
  List<Service> _services = [];
  List<Service> _carts = [];
  Service _activeService = null;
  //constructor to initialize the variables
  MyStore() {
    _services = [
      Service(
          categories: 'Electrical',
          img: 'images/photos/switchAndSockets.jpg',
          subCategories: 'Switch board and Socket',
          subSubCategories: [
            'Socket Installation and Repair',
            'Switch Installation and Repair',
            'Holder Installation and Repair',
            'Switch/ Socket Replacement',
          ],
          subSubCategoriesId: [
            1,
            2,
            3,
            4
          ],
          price: [
            20,
            10,
            15,
            11,
          ],
          qty: [
            1,
            1,
            1,
            1
          ],
          desc: [
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.',
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.',
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur',
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.',
          ]),
      Service(
          categories: 'Electrical',
          img: 'images/photos/fan.jpg',
          subCategories: 'Fan',
          subSubCategories: [
            'Celing Fan Servicing',
            'Wall Fan Servicing',
            'Table Stand Servicing',
            'Exhaust Fan Servicing',
            'Fan installation',
          ],
          subSubCategoriesId: [
            5,
            6,
            7,
            8,
            9,
          ],
          price: [
            20,
            10,
            15,
            11,
            11,
          ],
          qty: [
            1,
            1,
            1,
            1,
            1,
          ],
          desc: [
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.',
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.',
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur',
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.',
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.',
          ]),
      Service(
          categories: 'Electrical',
          img: 'images/photos/electrician.jpg',
          subCategories: 'Light',
          subSubCategories: [
            'Tubelight/ Energy lights Installation',
            'Bulb/ CFL/ LED Replacement',
            'Bulb holder installation',
            'Choke Replacement',
            'Fancy Light Installation/Repair',
          ],
          subSubCategoriesId: [
            10,
            11,
            12,
            13,
            14,
          ],
          price: [
            20,
            10,
            15,
            11,
            11
          ],
          qty: [
            1,
            1,
            1,
            1,
            1,
          ],
          desc: [
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.',
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.',
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur',
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.',
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.',
          ]),
      Service(
          categories: 'Electrical',
          img: 'images/photos/mcbAndFuse.jpg',
          subCategories: 'MCB and Fuse',
          subSubCategories: [
            'Fuse Replacement',
            'Single Pole MCB Replacement',
            'Sub Meter Installation',
            'Pannel Board Installation',
            'Air Circuit Breaker Installation',
          ],
          subSubCategoriesId: [
            15,
            16,
            17,
            18,
            19,
          ],
          price: [
            20,
            10,
            15,
            11,
            11,
          ],
          qty: [
            1,
            1,
            1,
            1,
            1,
          ],
          desc: [
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.',
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.',
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur',
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.',
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.',
          ]),
      Service(
          categories: 'Electrical',
          img: 'images/photos/inverter.jpg',
          subCategories: 'Inverter and Stabilizer',
          subSubCategories: [
            'Inverter Installation and Repair',
            'Stabilizer Installation and Repair',
          ],
          subSubCategoriesId: [
            20,
            21,
          ],
          price: [
            20,
            10,
          ],
          qty: [
            1,
            1,
          ],
          desc: [
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.',
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.',
          ]),
      Service(
          categories: 'Electrical',
          img: 'images/photos/wiring.jpg',
          subCategories: 'Wiring',
          subSubCategories: [
            'Full house electric wiring',
            'Cable Wiring',
            'Network Cable Wiring',
          ],
          subSubCategoriesId: [
            22,
            23,
            24,
          ],
          price: [
            20,
            10,
            15,
          ],
          qty: [
            1,
            1,
            1,
          ],
          desc: [
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.',
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.',
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur',
          ]),
      Service(
          categories: 'Electrical',
          img: 'images/photos/doorbell.jpg',
          subCategories: 'Doorbell',
          subSubCategories: [
            'Doorbell Installation and Repair',
          ],
          subSubCategoriesId: [
            25,
          ],
          price: [
            10,
          ],
          qty: [
            1,
          ],
          desc: [
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.',
          ]),
      Service(
          categories: 'Electrical',
          img: 'images/photos/securitycam.jpg',
          subCategories: 'Securitycam Installation',
          subSubCategories: [
            'Security Cam Installation and Repair',
          ],
          subSubCategoriesId: [
            26,
          ],
          price: [
            20,
          ],
          qty: [
            1,
          ],
          desc: [
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.',
          ]),
      Service(
          categories: 'Electrical',
          img: 'images/photos/electricmotor.jpg',
          subCategories: 'Electric Motor',
          subSubCategories: [
            'Electric Motor Installation and Repair',
          ],
          subSubCategoriesId: [
            27,
          ],
          price: [
            20,
          ],
          qty: [
            1,
          ],
          desc: [
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.',
          ]),
    ];
    //send notification to the provider
    notifyListeners();
  }
  //outside ui to access to this global variables by using getter function
  List<Service> get services => _services;
  List<Service> get carts => _carts;
  Service get activeService => _activeService;

  //function to make changes to the contents of data
  setActiveService(Service s) {
    _activeService = s;
  }

  //add or remove object in qty
  increaseQty(Service s, int subSubCategoryIndex) {
    Service found = _carts.firstWhere(
        (a) =>
            a.subSubCategoriesId[subSubCategoryIndex] ==
            s.subSubCategoriesId[subSubCategoryIndex],
        orElse: () => null);
    if (found != null) {
      //found.qty[subSubCategoryIndex] += 1;
      var foundQty = found.qty[subSubCategoryIndex];
      ++foundQty;
    } else {
//      _carts.add(s);
    }
    notifyListeners();
  }

  decreaseQty(Service s, int subSubCategoryIndex) {
    Service found = _carts.firstWhere(
        (a) =>
            a.subSubCategoriesId[subSubCategoryIndex] ==
            s.subSubCategoriesId[subSubCategoryIndex],
        orElse: () => null);
    if (found != null && found.qty[subSubCategoryIndex] == 1) {
//      _carts.remove(s);
    } else {
      found.qty[subSubCategoryIndex] -= 1;
    }
    notifyListeners();
  }

  addOneItemToCart(Service s, int subSubCategoryIndex) {
    Service found = _carts.firstWhere(
        (a) =>
            a.subSubCategoriesId[subSubCategoryIndex] ==
            s.subSubCategoriesId[subSubCategoryIndex],
        orElse: () => null);
    if (found == null) {
      _carts.add(s);
    } else {}

    notifyListeners();
  }

  getCartNumber(int subSubCategoryIndex) {
    int total = 0;
    for (int i = 0; i < carts.length; i++) {
      total += carts[i].qty[subSubCategoryIndex];
    }
    return total;
  }
}
