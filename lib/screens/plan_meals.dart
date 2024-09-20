import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // Make sure 'intl' is imported

class PlanMealsScreen extends StatefulWidget {
  const PlanMealsScreen({super.key});

  @override
  State<PlanMealsScreen> createState() => _PlanMealsScreenState();
}

class _PlanMealsScreenState extends State<PlanMealsScreen> {
  DateTime selectedDate = DateTime.now(); // Store selected date
  Map<String, List<String>> mealsPerDay = {}; // Store meals per day

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          buildDateSelector(),
          const SizedBox(height: 16),
          buildDaySection(selectedDate),
        ],
      ),
    );
  }

  // Widget to show the selected date and allow users to pick a new one
  Widget buildDateSelector() {
    return GestureDetector(
      onTap: () async {
        DateTime? pickedDate = await showDatePicker(
          context: context,
          initialDate: selectedDate,
          firstDate: DateTime(2020),
          lastDate: DateTime(2030),
        );
        if (pickedDate != null && pickedDate != selectedDate) {
          setState(() {
            selectedDate = pickedDate; // Update the selected date
          });
        }
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            DateFormat.yMMMMd().format(selectedDate), // Format the selected date
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Color(0xFF65A967),
            ),
          ),
          const SizedBox(width: 8),
          const Icon(Icons.calendar_today, color: Color(0xFF65A967)),
        ],
      ),
    );
  }

  // Build the meal section dynamically based on the selected date
  Widget buildDaySection(DateTime date) {
    String formattedDate = DateFormat('yyyy-MM-dd').format(date);
    String dayTitle = DateFormat('EEEE, MMM d').format(date);

    // Check if there are meals for the selected date, otherwise initialize empty meals list
    List<String> meals = mealsPerDay[formattedDate] ?? ['Breakfast', 'Lunch', 'Dinner'];

    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          children: [
            buildDayCard(dayTitle, meals, formattedDate),
          ],
        ),
      ),
    );
  }

  // Build the card for each day with meal slots
  Widget buildDayCard(String day, List<String> meals, String formattedDate) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              day,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color(0xFF65A967),
              ),
            ),
            const SizedBox(height: 16),
            ...meals.map((meal) => buildMealSlot(meal, formattedDate)).toList(), // Show meals dynamically
            const SizedBox(height: 8),
            TextButton.icon(
              onPressed: () {
                setState(() {
                  mealsPerDay[formattedDate] ??= [];
                  mealsPerDay[formattedDate]!.add('Snack'); // Add new snack
                });
              },
              icon: const Icon(Icons.add, color: Color(0xFF65A967)),
              label: const Text('Add Snack', style: TextStyle(color: Color(0xFF65A967))),
            ),
          ],
        ),
      ),
    );
  }

  // Build the meal slot for Breakfast, Lunch, and Dinner
  Widget buildMealSlot(String meal, String formattedDate) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Icon(
        meal == 'Breakfast'
            ? Icons.breakfast_dining
            : meal == 'Lunch'
            ? Icons.lunch_dining
            : Icons.dinner_dining,
        color: Color(0xFF65A967),
      ),
      title: Text(meal),
      trailing: const Icon(Icons.add_circle_outline, color: Color(0xFF65A967)),
      onTap: () {
        // Logic to add meals can go here
        setState(() {
          // Example: Add some item or update meal information
        });
      },
    );
  }
}
