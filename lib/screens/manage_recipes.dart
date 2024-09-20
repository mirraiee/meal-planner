import 'package:flutter/material.dart';

class ManageRecipesScreen extends StatefulWidget {
  const ManageRecipesScreen({super.key});

  @override
  State<ManageRecipesScreen> createState() => _ManageRecipesScreenState();
}

class _ManageRecipesScreenState extends State<ManageRecipesScreen> {
  bool isMyRecipesSelected = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextField(
            decoration: InputDecoration(
              hintText: 'Search for a meal...',
              prefixIcon: const Icon(Icons.search),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          const SizedBox(height: 16),
          TextField(
            decoration: InputDecoration(
              hintText: 'Fill in the category...',
              prefixIcon: const Icon(Icons.category),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          const SizedBox(height: 16),
          ToggleButtons(
            isSelected: [isMyRecipesSelected, !isMyRecipesSelected],
            onPressed: (int index) {
              setState(() {
                isMyRecipesSelected = index == 0;
              });
            },
            borderRadius: BorderRadius.circular(10),
            fillColor: Color(0xFF65A967),
            selectedColor: Colors.white,
            color: Color(0xFF65A967),
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Text('My Recipes'),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Text('Suggested Recipes'),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Expanded(
            child: ListView(
              children: isMyRecipesSelected
                  ? _buildMyRecipes()
                  : _buildSuggestedRecipes(),
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> _buildMyRecipes() {
    return [
      _buildRecipeItem('Egg'),
    ];
  }

  List<Widget> _buildSuggestedRecipes() {
    return [
      _buildRecipeItem('10-minute Chicken Fajita Tray Bake'),
      _buildRecipeItem('15-minute Honey Garlic Chicken'),
      _buildRecipeItem('15-minute Sheet Pan Beef And Broccoli'),
      _buildRecipeItem('3 Cheese Keto Zucchini Boats With Bacon'),
      _buildRecipeItem('3 Ingredient Fudgy Chocolate Avocado Pudding'),
      _buildRecipeItem('3 Minute Fudge'),
    ];
  }

  Widget _buildRecipeItem(String title) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        title: Text(title),
        trailing: const Icon(Icons.arrow_forward_ios),
        onTap: () {},
      ),
    );
  }
}
