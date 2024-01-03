import 'package:intl/intl.dart';

const String kBaseUrl = 'http://192.168.8.1:3000/api/v1';

const String kAuthToken = 'AUTH_TOKEN';

const String kStripePublishKey =
    'pk_test_51OIwCIGJQyVtA8BLqPYW456vFDf8jAQKuapxb3rOgV9zgMYDYpmSE9lm2gAcvzJLF3sHgowAPYBCLvHYyyG4RaI800IppyEHCK';
const String kStripeSecretKey =
    'sk_test_51OIwCIGJQyVtA8BL2TjbFA1j1xJFEJsi3KIEbArRbgsOtMsZV26HYXCrHBnExg5qPxgc6YEVzNHplL7fzdiEsg3m0035DCltQt';

final currency = NumberFormat('#,##0', 'vi-VN');

enum PhoneBrand { apple, samsung, xiaomi, oppo, vivo, realme, huawei, oneplus }

enum LaptopBrand { apple, dell, hp, asus, acer, lenovo, msi, lg, microsoft }

enum TabletBrand { apple, samsung, xiaomi, huawei, lenovo, oppo }

enum WatchBrand { apple, samsung, xiaomi, huawei, oppo, amazfit, garmin }

enum HeadphoneBrand {
  apple,
  samsung,
  xiaomi,
  huawei,
  oppo,
  sony,
  jbl,
  edifier,
  havit
}

enum CameraBrand { canon, nikon, sony, fujifilm, panasonic, gopro }

const brands = {
  'Phone': PhoneBrand.values,
  'Laptop': LaptopBrand.values,
  'Tablet': TabletBrand.values,
  'Watch': WatchBrand.values,
  'Headphone': HeadphoneBrand.values,
  'Camera': CameraBrand.values,
};
