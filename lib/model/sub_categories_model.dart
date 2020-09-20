class SubCategories {
  static List<SubCategories> getSubCategories() => [
        SubCategories(
            img: 'images/photos/switchAndSockets.jpg',
            name: 'Switch board and Socket',
            subSubCategories: [
              'Socket Installation and Repair',
              'Switch Installation and Repair',
              'Holder Installation and Repair',
              'Switch/ Socket Replacement',
            ],
            price: [
              '\$20',
              '\$10',
              '\$15',
              '\$11',
            ]),
        SubCategories(
            img: 'images/photos/fan.jpg',
            name: 'Fan',
            subSubCategories: [
              'Celing Fan Servicing',
              'Wall Fan Servicing',
              'Table Stand Servicing',
              'Exhaust Fan Servicing',
              'Fan installation',
            ],
            price: [
              '\$20',
              '\$10',
              '\$15',
              '\$11',
              '\$11',
            ]),
        SubCategories(
          img: 'images/photos/electrician.jpg',
          name: 'Light',
          subSubCategories: [
            'Tubelight/ Energy lights Installation',
            'Bulb/ CFL/ LED Replacement',
            'Bulb holder installation',
            'Choke Replacement',
            'Fancy Light Installation/Repair',
          ],
          price: ['\$20', '\$10', '\$15', '\$11', '\$11'],
        ),
        SubCategories(
          img: 'images/photos/mcbAndFuse.jpg',
          name: 'MCB and Fuse',
          subSubCategories: [
            'Fuse Replacement',
            'Single Pole MCB Replacement',
            'Sub Meter Installation',
            'Pannel Board Installation',
            'Air Circuit Breaker Installation',
          ],
          price: [
            '\$20',
            '\$10',
            '\$15',
            '\$11',
            '\$11',
          ],
        ),
        SubCategories(
          img: 'images/photos/inverter.jpg',
          name: 'Inverter and Stabilizer',
          subSubCategories: [
            'Inverter Installation and Repair',
            'Stabilizer Installation and Repair',
          ],
          price: [
            '\$20',
            '\$10',
          ],
        ),
        SubCategories(
          img: 'images/photos/wiring.jpg',
          name: 'Wiring',
          subSubCategories: [
            'Full house electric wiring',
            'Cable Wiring',
            'Network Cable Wiring',
          ],
          price: [
            '\$20',
            '\$10',
            '\$15',
          ],
        ),
        SubCategories(
          img: 'images/photos/doorbell.jpg',
          name: 'Doorbell',
          subSubCategories: [
            'Doorbell Installation and Repair',
          ],
          price: [
            '\$10',
          ],
        ),
        SubCategories(
          img: 'images/photos/securitycam.jpg',
          name: 'Securitycam Installation',
          subSubCategories: [
            'Security Cam Installation and Repair',
          ],
          price: [
            '\$20',
          ],
        ),
        SubCategories(
          img: 'images/photos/electricmotor.jpg',
          name: 'Electric Motor',
          subSubCategories: [
            'Electric Motor Installation and Repair',
          ],
          price: [
            '\$20',
          ],
        ),
      ];
  String img;
  String name;
  List<String> subSubCategories;
  List<String> price;
  SubCategories({this.img, this.name, this.subSubCategories, this.price});
}
