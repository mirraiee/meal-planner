import 'package:flutter/material.dart';

class ShoppingListScreen extends StatelessWidget {
  const ShoppingListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          SwitchListTile(
            value: true,
            onChanged: (bool value) {},
            title: const Text('Show the store'),
            activeColor: Color(0xFF65A967),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Shopping List',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF65A967),
                ),
              ),
              IconButton(
                icon: const Icon(Icons.add),
                onPressed: () {},
              ),
            ],
          ),
          Expanded(
            child: ListView(
              children: _buildShoppingList(),
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> _buildShoppingList() {
    return [
      ListTile(
        title: const Text('Old groceries'),
        trailing: const Icon(Icons.arrow_forward_ios),
        onTap: () {},
      ),
    ];
  }
}
