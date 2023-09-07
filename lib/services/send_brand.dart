import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerence_store_ui/models/brand_model.dart';

class SendBrand {
  static Future<void> addBrand(String name, String imageLink) async {
    try {
      final FirebaseFirestore firestore = FirebaseFirestore.instance;

      final CollectionReference brandCollection =
          firestore.collection('Brands');

      await brandCollection.add({
        'name': name,
        'imageLink': imageLink,
      });

      print('Brand added to Firestore: $name');
    } catch (e) {
      // Handle errors here
      print('Error adding brand to Firestore: $e');
      throw e;
    }
  }

  static Future<List<BrandModel>> getBrandsFromFirebase() async {
    try {
      final FirebaseFirestore firestore = FirebaseFirestore.instance;

      final CollectionReference brandCollection =
          firestore.collection('Brands');

      final QuerySnapshot querySnapshot = await brandCollection.get();

      final List<BrandModel> brandList = querySnapshot.docs.map((doc) {
        final data = doc.data() as Map<String, dynamic>;
        return BrandModel(
          name: data['name'] as String,
          imageLink: data['imageLink'] as String,
        );
      }).toList();

      return brandList;
    } catch (e) {
      // Handle errors here
      print('Error getting brands from Firestore: $e');
      throw e;
    }
  }
}
