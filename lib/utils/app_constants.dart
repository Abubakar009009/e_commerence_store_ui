import 'package:e_commerence_store_ui/models/products_model.dart';
import 'package:e_commerence_store_ui/models/review_model.dart';

import '../models/brand_model.dart';

class AppConstants {
  static bool username = false;
  static bool password = false;
  static bool email = false;

  static String? usernameGiven = '';
  static String? emailGiven = '';
  static String? passwordGiven = '';

  static List<BrandModel> brandList = [
    BrandModel(name: 'Adidas', imageLink: 'assets/images/Adidas.jpg'),
    BrandModel(name: 'Puma', imageLink: 'assets/images/Nike.jpg'),
    BrandModel(name: 'Fila', imageLink: 'assets/images/fila.jpg'),
    BrandModel(name: 'Nike', imageLink: 'assets/images/Adidas.jpg'),
    BrandModel(name: 'Adidas', imageLink: 'assets/images/Nike.jpg'),
    BrandModel(name: 'Puma', imageLink: 'assets/images/Nike.jpg'),
    BrandModel(name: 'Fila', imageLink: 'assets/images/fila.jpg'),
    BrandModel(name: 'Nike', imageLink: 'assets/images/Adidas.jpg'),
    BrandModel(name: 'Adidas', imageLink: 'assets/images/Nike.jpg'),
    BrandModel(name: 'Puma', imageLink: 'assets/images/Nike.jpg'),
    BrandModel(name: 'Fila', imageLink: 'assets/images/fila.jpg'),
    BrandModel(name: 'Nike', imageLink: 'assets/images/Adidas.jpg'),
    BrandModel(name: 'Adidas', imageLink: 'assets/images/Nike.jpg'),
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

  static List<String> desImages = [
    'assets/images/des1.jpg',
    'assets/images/des2.jpg',
    'assets/images/des3.jpg',
    'assets/images/des4.jpg',
    'assets/images/des4.jpg',
    'assets/images/des4.jpg'
  ];
  static List<String> sizes = ['S', 'M', 'L', 'XL', '2XL'];

  static List<ProductsModel> productsList = [
    ProductsModel(
        name: 'Adidas',
        imageLink: [
          'assets/images/jackets01.jpg',
          'assets/images/des1.jpg',
          'assets/images/des2.jpg',
          'assets/images/des3.jpg',
          'assets/images/des4.jpg',
          'assets/images/des4.jpg',
          'assets/images/des4.jpg'
        ],
        reviews: [
          ReviewModel(
              date: '12-sep-2013',
              ratingValue: '3.5',
              reviewText:
                  ' thia fsaf sakf safkhf jsa mf sfkkds fjdf hkjdf sdkfhds fkjf lkdsfj kf dsjhds ifj ld ',
              name: 'Abubakar Rana',
              imageLink: 'assets/images/jackets02.jpg')
        ],
        description:
            'Experience unmatched comfort and elegance with our  sf aksa ks fsh ak ak sfdsa ff safksf sf hf kfskf kjf k ka kaf akfla faslkf alfj dslfadf shf sdfafu askfas.lfsaifas;dfajsf sdhfsd fhfd fsdjfd fsdiyd kgd dzl dkddygfdgkjfdyfdsjghdskhgksdgkdshgifd gfdsjg fdgds gkh dkgsdldkjf gfkdshgkd jacket. Its meticulous craftsmanship and tailored fit ensure a stylish appearance while providing warmth and ease',
        totalPrice: '\$139',
        category: 'Night Suite',
        price: '\$109'),
    ProductsModel(
        name: 'Adidas',
        imageLink: [
          'assets/images/jackets02.jpg',
          'assets/images/des1.jpg',
          'assets/images/des2.jpg',
          'assets/images/des3.jpg',
          'assets/images/des4.jpg',
          'assets/images/des4.jpg',
          'assets/images/des4.jpg'
        ],
        reviews: [
          ReviewModel(
              date: '12-sep-2013',
              ratingValue: '3.5',
              reviewText:
                  ' thia fsaf sakf safkhf jsa mf sfkkds fjdf hkjdf sdkfhds fkjf lkdsfj kf dsjhds ifj ld ',
              name: 'Abubakar / ahmad',
              imageLink: 'assets/images/jackets02.jpg')
        ],
        description:
            'Elevate your outdoor ensemble with our contemporary jacket. Engineered with high-performance features and refined aesthetics, it\'s the embodiment of modern urban fashion',
        totalPrice: '\$18',
        category: 'Men\'s Printed Pullover Hoodie',
        price: '\$10'),
    ProductsModel(
        name: 'Adidas',
        imageLink: [
          'assets/images/jackets04.jpg',
          'assets/images/des1.jpg',
          'assets/images/des2.jpg',
          'assets/images/des3.jpg',
          'assets/images/des4.jpg',
          'assets/images/des4.jpg',
          'assets/images/des4.jpg'
        ],
        reviews: [
          ReviewModel(
              date: '12-sep-2013',
              ratingValue: '3.5',
              reviewText:
                  ' thia fsaf sakf safkhf jsa mf sfkkds fjdf hkjdf sdkfhds fkjf lkdsfj kf dsjhds ifj ld ',
              name: 'Musa',
              imageLink: 'assets/images/jackets02.jpg')
        ],
        description:
            'Embrace sophistication and warmth with our premium jacket. Crafted for both style and functionality, it\'s an essential addition to your wardrobe for a polished look',
        totalPrice: '\$20',
        category: 'Men\'s Printed Pullove',
        price: '\$19'),
    ProductsModel(
        name: 'Adidas',
        imageLink: [
          'assets/images/jackets05.jpg',
          'assets/images/des1.jpg',
          'assets/images/des2.jpg',
          'assets/images/des3.jpg',
          'assets/images/des4.jpg',
          'assets/images/des4.jpg',
          'assets/images/des4.jpg'
        ],
        reviews: [
          ReviewModel(
              date: '12-sep-2013',
              ratingValue: '3.5',
              reviewText:
                  ' thia fsaf sakf safkhf jsa mf sfkkds fjdf hkjdf sdkfhds fkjf lkdsfj kf dsjhds ifj ld ',
              name: 'ali',
              imageLink: 'assets/images/jackets02.jpg'),
          ReviewModel(
              date: '12-sep-2013',
              ratingValue: '4',
              reviewText:
                  ' thia fsaf sakf safkhf jsa mf sfkkds fjdf hkjdf sdkfhds fkjf lkdsfj kf dsjhds ifj ld ',
              name: 'Ahmad',
              imageLink: 'assets/images/jackets07.jpg'),
          ReviewModel(
              date: '12-sep-2013',
              ratingValue: '4',
              reviewText:
                  ' thia fsaf sakf safkhf jsa mf sfkkds fjdf hkjdf sdkfhds fkjf lkdsfj kf dsjhds ifj ld ',
              name: 'Khan',
              imageLink: 'assets/images/jackets06.jpg'),
          ReviewModel(
              date: '12-sep-2013',
              ratingValue: '4.7',
              reviewText:
                  ' thia fsaf sakf safkhf jsa mf sfkkds fjdf hkjdf sdkfhds fkjf lkdsfj kf dsjhds ifj ld ',
              name: 'Musa',
              imageLink: 'assets/images/jackets05.jpg')
        ],
        description:
            'Gear up for every season with our versatile jacket. Whether braving the cold or embarking on adventures, it\'s the ultimate companion for your modern lifestyle',
        totalPrice: '\$1009',
        category: 'Grocery',
        price: '\$1000'),
    ProductsModel(
        name: 'Adidas',
        imageLink: [
          'assets/images/jackets06.jpg',
          'assets/images/des1.jpg',
          'assets/images/des2.jpg',
          'assets/images/des3.jpg',
          'assets/images/des4.jpg',
          'assets/images/des4.jpg',
          'assets/images/des4.jpg'
        ],
        reviews: [
          ReviewModel(
              date: '12-sep-2013',
              ratingValue: '3.5',
              reviewText:
                  ' thia fsaf sakf safkhf jsa mf sfkkds fjdf hkjdf sdkfhds fkjf lkdsfj kf dsjhds ifj ld ',
              name: 'Ali',
              imageLink: 'assets/images/jackets02.jpg')
        ],
        description:
            'Stay ahead of the curve with our cutting-edge jacket. Its innovative design offers protection against the elements, all while exuding contemporary charm and urban allure',
        totalPrice: '\$139',
        category: 'Night Suite',
        price: '\$109'),
    ProductsModel(
        name: 'Adidas',
        imageLink: [
          'assets/images/jackets07.jpg',
          'assets/images/des1.jpg',
          'assets/images/des2.jpg',
          'assets/images/des3.jpg',
          'assets/images/des4.jpg',
          'assets/images/des4.jpg',
          'assets/images/des4.jpg'
        ],
        category: 'Walking',
        description:
            'Stay warm and stylish with our versatile jacket. Crafted with premium materials, it\'s designed for comfort in any weather, making it a must-have addition to your wardrobe',
        reviews: [
          ReviewModel(
              date: '12-sep-2013',
              ratingValue: '3.5',
              reviewText:
                  ' thia fsaf sakf safkhf jsa mf sfkkds fjdf hkjdf sdkfhds fkjf lkdsfj kf dsjhds ifj ld ',
              name: 'Rana',
              imageLink: 'assets/images/jackets02.jpg')
        ],
        totalPrice: '\$18',
        price: '\$10'),
    ProductsModel(
        name: 'Adidas',
        imageLink: [
          'assets/images/jackets08.jpg',
          'assets/images/des1.jpg',
          'assets/images/des2.jpg',
          'assets/images/des3.jpg',
          'assets/images/des4.jpg',
          'assets/images/des4.jpg',
          'assets/images/des4.jpg'
        ],
        category: 'Fleece',
        reviews: [
          ReviewModel(
              date: '12-sep-2013',
              ratingValue: '3.5',
              reviewText:
                  ' thia fsaf sakf safkhf jsa mf sfkkds fjdf hkjdf sdkfhds fkjf lkdsfj kf dsjhds ifj ld ',
              name: 'Talha',
              imageLink: 'assets/images/jackets02.jpg')
        ],
        description:
            'Introducing the epitome of fashion and function – our jacket. Ideal for both casual outings and active pursuits, it offers a perfect balance of style and practicality.',
        totalPrice: '\$107',
        price: '\$19'),
    ProductsModel(
        name: 'Adidas',
        imageLink: [
          'assets/images/jackets05.jpg',
          'assets/images/des1.jpg',
          'assets/images/des2.jpg',
          'assets/images/des3.jpg',
          'assets/images/des4.jpg',
          'assets/images/des4.jpg',
          'assets/images/des4.jpg'
        ],
        category: 'Grocery',
        reviews: [
          ReviewModel(
              date: '12-sep-2013',
              ratingValue: '3.5',
              reviewText:
                  ' thia fsaf sakf safkhf jsa mf sfkkds fjdf hkjdf sdkfhds fkjf lkdsfj kf dsjhds ifj ld ',
              name: 'Tahir',
              imageLink: 'assets/images/jackets02.jpg')
        ],
        description:
            'Elevate your outerwear game with this chic jacket. Its modern design blends fashion and functionality, ensuring you\'re ready for urban adventures while keeping you cozy.',
        totalPrice: '\$1008',
        price: '\$1000')
  ];
}
