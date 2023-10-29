import 'package:digital_dreams_shop/config/theme/media_resource.dart';
import 'package:digital_dreams_shop/features/home/domain/entities/advertisement.dart';

const String baseUrl = 'https://localhost:3000/api/v1/';

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
