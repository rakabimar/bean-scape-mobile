import 'package:flutter/material.dart';
import 'package:bean_scape/models/product_entry.dart';
import 'package:bean_scape/widgets/left_drawer.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';
import 'package:bean_scape/screens/product_detail.dart';

class ProductListPage extends StatefulWidget {
  const ProductListPage({super.key});

  @override
  State<ProductListPage> createState() => _ProductListPageState();
}

class _ProductListPageState extends State<ProductListPage> {
  Future<List<ProductEntry>> fetchProducts(CookieRequest request) async {
    final response = await request.get('http://127.0.0.1:8000/user_products_json/');

    // Decode the response into JSON format
    var data = response;

    // Convert the JSON data into ProductEntry objects using your model
    List<ProductEntry> productList = [];
    for (var d in data) {
      if (d != null) {
        productList.add(ProductEntry.fromJson(d));
      }
    }
    return productList;
  }

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product List'),
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Colors.white,
      ),
      drawer: const LeftDrawer(),
      body: FutureBuilder<List<ProductEntry>>(
        future: fetchProducts(request),
        builder: (context, AsyncSnapshot<List<ProductEntry>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(
              child: Text(
                'No products available.',
                style: TextStyle(fontSize: 20, color: Colors.black),
              ),
            );
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (_, index) => InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProductDetailPage(
                        product: snapshot.data![index],
                      ),
                    ),
                  );
                },
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  padding: const EdgeInsets.all(20.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        snapshot.data![index].fields.name,
                        style: const TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text('Description: ${snapshot.data![index].fields.description}'),
                      const SizedBox(height: 10),
                      Text('Price: \$${snapshot.data![index].fields.price}'),
                      const SizedBox(height: 10),
                      Text('Category: ${snapshot.data![index].fields.category}'),
                      const SizedBox(height: 10),
                      Text('Bitterness: ${snapshot.data![index].fields.bitterness}/10'),
                    ],
                  ),
                ),
              )
            );
          }
        },
      ),
    );
  }
}
