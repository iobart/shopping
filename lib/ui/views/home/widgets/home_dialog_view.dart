import 'package:flutter/material.dart';
import 'package:shopping/core/di/locator.dart';
import 'package:shopping/ui/views/home/home_view_model.dart';

class HomeProductForm extends StatefulWidget {
  final HomeViewModel _homeViewModel;

  HomeProductForm({super.key, HomeViewModel? homeViewModel})
      : _homeViewModel = homeViewModel ?? locator<HomeViewModel>();

  @override
  ProductFormState createState() => ProductFormState();
}

class ProductFormState extends State<HomeProductForm> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController stockController = TextEditingController();
  final TextEditingController priceController = TextEditingController();

  void submitForm() {
    String name = nameController.text;
    String description = descriptionController.text;
    int stock = int.tryParse(stockController.text) ?? 0;
    double price = double.tryParse(priceController.text) ?? 0.0;
 widget._homeViewModel.createMenuProduct(
      name: name,
      description: description,
      stock: stock,
      price: price,
    );

  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          TextFormField(
            controller: nameController,
            decoration: const InputDecoration(labelText: 'Nombre del Menú'),
          ),
          TextFormField(
            controller: descriptionController,
            decoration:
                const InputDecoration(labelText: 'Descripción del Menú'),
          ),
          TextFormField(
            controller: stockController,
            decoration: const InputDecoration(labelText: 'Stock'),
            keyboardType: TextInputType.number,
          ),
          TextFormField(
            controller: priceController,
            decoration: const InputDecoration(labelText: 'Precio'),
            keyboardType: TextInputType.number,
          ),
          const SizedBox(height: 16.0),
          ElevatedButton(
            onPressed: submitForm,
            child: const Text('Guardar'),
          ),
        ],
      ),
    );
  }
}
