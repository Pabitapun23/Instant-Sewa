import 'package:instantsewa/model/service_model.dart';
class HandyMansService{
  List<Service> addServices() {
    return[
      new Service(name:'Electrical',img:'images/photos/electric.png'),
      new Service(name:'Painting',img:'images/photos/painting1.png'),
      new Service(name:'Plumbing',img:'images/photos/plumb.png'),
      new Service(name:'Beauty',img:'images/photos/beautician.png'),
      new Service(name:'Cleaning',img:'images/photos/clean2.png'),
      new Service(name:'Appliances',img:'images/photos/appliance1.png'),
      new Service(name:'Laundry',img:'images/photos/laundry.png'),
      new Service(name:'Tv mounting',img:'images/photos/tvMounting.png'),
      new Service(name:'Handyman',img:'images/photos/plumb1.png'),
    ];
  }
}
