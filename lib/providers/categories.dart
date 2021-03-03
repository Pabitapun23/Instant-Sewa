import 'package:flutter/material.dart';
import 'package:instantsewa/model/sub_categories_model.dart';

//add global variables and getters and functions to modify the contents of variable here
class Categories with ChangeNotifier {
  //add global variables
  List<Service> _services = [
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
        subSubCategoriesImage: [
          'images/photos/switchAndSockets.jpg',
          'images/photos/switchAndSockets.jpg',
          'images/photos/switchAndSockets.jpg',
          'images/photos/switchAndSockets.jpg'
        ],
        subSubCategoriesId: [
          '1',
          '2',
          '3',
          '4',
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
        subSubCategoriesImage: [
          'images/photos/fan.jpg',
          'images/photos/fan.jpg',
          'images/photos/fan.jpg',
          'images/photos/fan.jpg',
          'images/photos/fan.jpg'
        ],
        subSubCategoriesId: [
          '5',
          '6',
          '7',
          '8',
          '9',
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
        subSubCategoriesImage: [
          'images/photos/electrician.jpg',
          'images/photos/electrician.jpg',
          'images/photos/electrician.jpg',
          'images/photos/electrician.jpg',
          'images/photos/electrician.jpg',
        ],
        subSubCategoriesId: [
          '10',
          '11',
          '12',
          '13',
          '14',
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
        subSubCategoriesImage: [
          'images/photos/mcbAndFuse.jpg',
          'images/photos/mcbAndFuse.jpg',
          'images/photos/mcbAndFuse.jpg',
          'images/photos/mcbAndFuse.jpg',
          'images/photos/mcbAndFuse.jpg',
        ],
        subSubCategoriesId: [
          '15',
          '16',
          '17',
          '18',
          '19',
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
        subSubCategoriesImage: [
          'images/photos/inverter.jpg',
          'images/photos/inverter.jpg',
        ],
        subSubCategoriesId: [
          '20',
          '21',
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
        subSubCategoriesImage: [
          'images/photos/wiring.jpg',
          'images/photos/wiring.jpg',
          'images/photos/wiring.jpg',
        ],
        subSubCategoriesId: [
          '22',
          '23',
          '24',
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
        subSubCategoriesImage: [
          'images/photos/doorbell.jpg',
        ],
        subSubCategoriesId: [
          '25',
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
        subSubCategoriesImage: [
          'images/photos/securitycam.jpg',
        ],
        subSubCategoriesId: [
          '26',
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
        subSubCategoriesImage: [
          'images/photos/electricmotor.jpg',
        ],
        subSubCategoriesId: [
          '27',
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

  //outside ui to access to this global variables by using getter function
  List<Service> get services => [..._services];
}
