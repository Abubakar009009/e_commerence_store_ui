import 'package:e_commerence_store_ui/models/products_model.dart';
import 'package:e_commerence_store_ui/models/review_model.dart';

import '../models/brand_model.dart';
import '../models/orders_model.dart';

class AppConstants {
  static List<ProductsModel> adidasList = [];
  static List<ProductsModel> nikeList = [];
  static List<ProductsModel> filaList = [];
  static List<String> wishlist = [];
  static List<ProductsModel> getDataList = [];

  static List<ProductsModel> wishlistProducts = [];
  static List<ProductsModel> addToCartLocal = [];
  static List<OrdersModel> orderList = [];

  static bool username = false;
  static bool password = false;
  static bool email = false;

  static String usernameGiven = '';
  static String emailGiven = '';
  static String passwordGiven = '';

  static List<BrandModel> brandList = [];
  static List<String> brandList1 = [
    'nike',
    'puma',
    'adidas',
    'fila',
    'sketchers',
    'ali',
    'khan',
    'musa',
    'reebok',
    'under armour',
    'new balance',
    'converse',
    'vans',
    'asics',
    'salomon',
    'lacoste',
    'polo ralph lauren',
    'timberland',
    'clarks',
    'dr. martens',
    'caterpillar',
    'skechers',
    'gucci',
    'prada',
    'versace',
    'calvin klein',
    'tommy hilfiger',
    'hugo boss',
    'armani',
    'louis vuitton',
    'burberry',
    'coach',
    'michael kors',
    'fendi',
    'dior',
    'chanel',
    'hermes',
    'givenchy',
    'balenciaga',
    'valentino',
    'yves saint laurent',
    'bottega veneta',
    'balmain',
    'alexander mcqueen',
    'jimmy choo',
    'prabal gurung',
    'rolex',
    'omega',
    'tag heuer',
    'breitling',
    'patek philippe',
    'audemars piguet',
    'citizen',
    'seiko',
    'swatch',
    'g-shock',
    'casio',
    'nixon',
    'apple',
    'samsung',
    'huawei',
    'xiaomi',
    'oneplus',
    'sony',
    'lg',
    'panasonic',
    'philips',
    'logitech',
    'lenovo',
    'acer',
    'dell',
    'hp',
    'asus',
    'msi',
    'alienware',
    'corsair',
    'razer',
    'steelseries',
    'adobe',
    'microsoft',
    'autodesk',
    'ibm',
    'oracle',
    'intel',
    'amd',
    'nvidia',
    'qualcomm',
    'siemens',
    'honeywell',
    '3m',
    'generalelectric',
    'boeing',
    'lockheed martin',
    'northrop grumman',
    'raytheon',
    'rolls-royce',
    'shell',
    'exxonmobil',
    'chevron',
    'bp',
    'total',
    'saudi aramco',
    'petrochina',
    'sinopec',
    'tesla',
    'ford',
    'toyota',
    'honda',
    'chevrolet',
    'bmw',
    'volkswagen',
    'audi',
    'mercedes-benz',
  ];

  static List<ReviewModel> reviewsList = [
    ReviewModel(
        date: '20 - sep -2019',
        ratingValue: '3.5',
        reviewText:
            'The jacket exceeded my expectations. The fit is perfect, and the quality is outstanding. The attention to detail in the design is impressive. I\'m thrilled with this purchase and can confidently recommend it to others. Five stars!',
        name: 'Donald hemisphere',
        imageLink: 'assets/images/image4.jpg')
  ];

  static List<String> sizes = ['S', 'M', 'L', 'XL', '2XL'];
}
