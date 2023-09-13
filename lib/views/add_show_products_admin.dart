import 'package:e_commerence_store_ui/views/add_data_screen.dart';
import 'package:flutter/material.dart';

import 'show_all_products_admin.dart';

class AddShowProductsAdmin extends StatefulWidget {
  const AddShowProductsAdmin({super.key});

  @override
  State<AddShowProductsAdmin> createState() => _AddShowProductsAdminState();
}

class _AddShowProductsAdminState extends State<AddShowProductsAdmin> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2, // Number of tabs
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Products'),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'All Products'),
              Tab(text: 'Add Product'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            // Show Products Tab
            ShowAllProductsAdmin(),

            // Add Product Tab
            AddDataScreen(),
          ],
        ),
      ),
    );
  }
}

class ShowProductsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Show Products Screen'),
    );
  }
}
