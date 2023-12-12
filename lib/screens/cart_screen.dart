import 'package:flutter/material.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cart",
        style: TextStyle(
        color: Colors.black,
        ),
        ),
      ),
      body: ListView.builder(
        itemCount: 4,
          padding: const EdgeInsets.all(12),
          itemBuilder: (ctx, index) {
          return Container(
            margin: const EdgeInsets.only(bottom: 12.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12,
              ),
              border: Border.all(color: Colors.blueAccent, width: 3)
            ),
            child: Row(
              children: [
                Container(
                  height: 140,
                  color: Colors.blueAccent.withOpacity(0.5),
                )

              ],
            ),
          );
          },

      ),
    );
  }
}
