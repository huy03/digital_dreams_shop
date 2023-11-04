import 'package:digital_dreams_shop/config/theme/media_resource.dart';
import 'package:digital_dreams_shop/features/home/domain/entities/advertisement.dart';

const String kBaseUrl = 'http://192.168.8.1:3000/api/v1';
const String kAuthToken = 'AUTH_TOKEN';

final advertisements = [
  Advertisement(
    image: MediaResource.advertisementOne,
    discountValue: '50% Off',
    description: 'On everything today',
    code: 'FSCREATION',
  ),
  Advertisement(
    image: MediaResource.advertisementTwo,
    discountValue: '70% Off',
    description: 'On everything today',
    code: 'FSCREATION',
  ),
  Advertisement(
    image: MediaResource.advertisementOne,
    discountValue: '50% Off',
    description: 'On everything today',
    code: 'FSCREATION',
  ),
  Advertisement(
    image: MediaResource.advertisementOne,
    discountValue: '50% Off',
    description: 'On everything today',
    code: 'FSCREATION',
  ),
];

enum UserInfo {
  userName,
  phoneNumber,
  email,
  password,
  avatarUrl,
  birthDate,
  addresses,
}
