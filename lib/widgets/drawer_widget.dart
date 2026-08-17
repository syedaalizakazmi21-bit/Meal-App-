import 'package:flutter/material.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key, required this.onSelectPage});

  final void Function(String identifier) onSelectPage;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Drawer(
      width: screenSize.width * 0.6,
      child: Column(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.secondaryContainer,
            ),
            child: Center(
              child: ListTile(
                contentPadding: EdgeInsets.zero,
                leading: Icon(
                  Icons.fastfood,
                  color: Theme.of(context).colorScheme.primary,
                  size: 40,
                ),
                title: Text(
                  "Cooking up!",
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
              ),
            ),
          ),
          ListTile(
            onTap: () {
              onSelectPage('meal');
            },
            leading: Icon(Icons.restaurant),
            title: Text("Meal"),
          ),
          ListTile(
            onTap: () {
              onSelectPage('filter');
            },
            leading: Icon(Icons.settings),
            title: Text("Filters"),
          ),
        ],
      ),
    );
  }
}
