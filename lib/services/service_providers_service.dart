import 'package:instantsewa/model/provider_model.dart';

class ServiceProvidersService {
  List<Provider> addProvider() {
    return [
      Provider(
        name: 'Ram Hamal',
        job: 'Plumbing',
        image: 'images/photos/provider.png',
        desc:
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
        rate: 5,
        distance: 2.3,
      ),
      Provider(
        name: 'Shyam Gurung',
        job: 'Electrical',
        image: 'images/photos/provider.png',
        desc:
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
        rate: 4,
        distance: 0.5,
      ),
      Provider(
        name: 'Gopal Magar',
        job: 'Carpentering',
        image: 'images/photos/provider.png',
        desc:
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
        rate: 4,
        distance: 2.0,
      ),
      Provider(
        name: 'Hari Tharu',
        job: 'Painting',
        image: 'images/photos/provider.png',
        desc:
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
        rate: 5,
        distance: 1.4,
      )
    ];
  }
}
