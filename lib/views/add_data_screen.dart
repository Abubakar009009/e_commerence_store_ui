// // ignore_for_file: use_build_context_synchronously, prefer_final_fields, library_private_types_in_public_api

// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'dart:io';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

// class AddDataScreen extends StatefulWidget {
//   const AddDataScreen({Key? key}) : super(key: key);

//   @override
//   _AddDataScreenState createState() => _AddDataScreenState();
// }

// class _AddDataScreenState extends State<AddDataScreen> {
//   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
//   final TextEditingController _nameController = TextEditingController();
//   final TextEditingController _categoryController = TextEditingController();
//   final TextEditingController _priceController = TextEditingController();
//   final TextEditingController _descriptionController = TextEditingController();
//   final TextEditingController _totalPriceController = TextEditingController();

//   List<XFile>? _selectedImages = [];

//   Future<void> _submitData() async {
//     if (_formKey.currentState!.validate() && _selectedImages!.isNotEmpty) {
//       // Validate form fields and check if images are selected

//       // Upload images to Firebase Storage
//       final List<String> imageUrls = [];
//       final FirebaseStorage storage = FirebaseStorage.instance;

//       for (int i = 0; i < _selectedImages!.length; i++) {
//         final Reference storageRef =
//             storage.ref().child('product_images/${DateTime.now()}_$i.jpg');
//         final UploadTask uploadTask =
//             storageRef.putFile(File(_selectedImages![i].path));
//         final TaskSnapshot downloadUrl = (await uploadTask);
//         final String imageUrl = await downloadUrl.ref.getDownloadURL();
//         imageUrls.add(imageUrl);
//       }

//       // Save data to Firestore
//       final FirebaseFirestore firestore = FirebaseFirestore.instance;
//       await firestore.collection('products').add({
//         'name': _nameController.text,
//         'category': _categoryController.text,
//         'price': _priceController.text,
//         'description': _descriptionController.text,
//         'totalPrice': _totalPriceController.text,
//         'images': imageUrls,
//       });

//       // Clear form fields and show a success message
//       _nameController.clear();
//       _categoryController.clear();
//       _priceController.clear();
//       _descriptionController.clear();
//       _totalPriceController.clear();
//       setState(() {
//         _selectedImages!.clear();
//       });

//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(
//           content: Text('Product added successfully!'),
//         ),
//       );
//     } else {
//       // Show an error message if form fields are not valid or no images are selected
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(
//           content:
//               Text('Please fill in all fields and select at least one image.'),
//           backgroundColor: Colors.red,
//         ),
//       );
//     }
//   }

//   Future<void> _pickImages() async {
//     final List<XFile> result = await ImagePicker()
//         .pickMultiImage(imageQuality: 5 - (_selectedImages!.length));
//     if (result.isNotEmpty) {
//       setState(() {
//         _selectedImages!.addAll(result);
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Add Product'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Form(
//           key: _formKey,
//           child: ListView(
//             children: [
//               TextFormField(
//                 controller: _nameController,
//                 decoration: const InputDecoration(labelText: 'Name of Product'),
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Please enter the name of the product.';
//                   }
//                   return null;
//                 },
//               ),
//               TextFormField(
//                 controller: _categoryController,
//                 decoration:
//                     const InputDecoration(labelText: 'Category of Product'),
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Please enter the category of the product.';
//                   }
//                   return null;
//                 },
//               ),
//               TextFormField(
//                 controller: _priceController,
//                 decoration:
//                     const InputDecoration(labelText: 'Price of Product'),
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Please enter the price of the product.';
//                   }
//                   return null;
//                 },
//               ),
//               TextFormField(
//                 controller: _descriptionController,
//                 decoration:
//                     const InputDecoration(labelText: 'Description of Product'),
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Please enter the description of the product.';
//                   }
//                   return null;
//                 },
//               ),
//               TextFormField(
//                 controller: _totalPriceController,
//                 decoration:
//                     const InputDecoration(labelText: 'Total Price of Product'),
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Please enter the total price of the product.';
//                   }
//                   return null;
//                 },
//               ),
//               ElevatedButton(
//                 onPressed: _pickImages,
//                 child: const Text('Select Images'),
//               ),
//               if (_selectedImages!.isNotEmpty)
//                 Column(
//                   children: _selectedImages!.map((image) {
//                     return Image.file(File(image.path));
//                   }).toList(),
//                 ),
//               ElevatedButton(
//                 onPressed: _submitData,
//                 child: const Text('Submit'),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AddDataScreen extends StatefulWidget {
  const AddDataScreen({Key? key}) : super(key: key);

  @override
  _AddDataScreenState createState() => _AddDataScreenState();
}

class _AddDataScreenState extends State<AddDataScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _categoryController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _totalPriceController = TextEditingController();

  List<XFile>? _selectedImages = [];

  Future<void> _submitData() async {
    if (_formKey.currentState!.validate() && _selectedImages!.isNotEmpty) {
      final FirebaseStorage storage = FirebaseStorage.instance;
      final FirebaseFirestore firestore = FirebaseFirestore.instance;

      // Generate a random document ID for the product
      final DocumentReference productRef =
          firestore.collection('products').doc();
      final String productId = productRef.id;

      // Upload images to Firebase Storage and get download URLs
      final List<String> imageUrls = [];

      for (int i = 0; i < _selectedImages!.length; i++) {
        final Reference storageRef =
            storage.ref().child('product_images/$productId/$i.jpg');
        final UploadTask uploadTask =
            storageRef.putFile(File(_selectedImages![i].path));
        final TaskSnapshot downloadUrl = await uploadTask;
        final String imageUrl = await downloadUrl.ref.getDownloadURL();
        imageUrls.add(imageUrl);
      }

      // Save product data to Firestore
      await productRef.set({
        'name': _nameController.text,
        'category': _categoryController.text,
        'price': _priceController.text,
        'description': _descriptionController.text,
        'totalPrice': _totalPriceController.text,
        'images': imageUrls,
      });

      // Save the generated product ID in a separate collection
      await firestore.collection('product_ids').doc(productId).set({});

      // Clear form fields and show a success message
      _nameController.clear();
      _categoryController.clear();
      _priceController.clear();
      _descriptionController.clear();
      _totalPriceController.clear();
      setState(() {
        _selectedImages!.clear();
      });

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Product added successfully!'),
        ),
      );
    } else {
      // Show an error message if form fields are not valid or no images are selected
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content:
              Text('Please fill in all fields and select at least one image.'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  Future<void> _pickImages() async {
    final List<XFile> result = await ImagePicker()
        .pickMultiImage(imageQuality: 5 - (_selectedImages!.length));
    if (result.isNotEmpty) {
      setState(() {
        _selectedImages!.addAll(result);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Product'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(labelText: 'Name of Product'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the name of the product.';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _categoryController,
                decoration:
                    const InputDecoration(labelText: 'Category of Product'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the category of the product.';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _priceController,
                decoration:
                    const InputDecoration(labelText: 'Price of Product'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the price of the product.';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _descriptionController,
                decoration:
                    const InputDecoration(labelText: 'Description of Product'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the description of the product.';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _totalPriceController,
                decoration:
                    const InputDecoration(labelText: 'Total Price of Product'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the total price of the product.';
                  }
                  return null;
                },
              ),
              ElevatedButton(
                onPressed: _pickImages,
                child: const Text('Select Images'),
              ),
              if (_selectedImages!.isNotEmpty)
                Column(
                  children: _selectedImages!.map((image) {
                    return Image.file(File(image.path));
                  }).toList(),
                ),
              ElevatedButton(
                onPressed: _submitData,
                child: const Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
