import 'package:flutter/material.dart';

class AppBottomNav extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onDestinationSelected;

  const AppBottomNav({Key? key, required this.selectedIndex, required this.onDestinationSelected}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      selectedIndex: selectedIndex,
      onDestinationSelected: onDestinationSelected,
      destinations: const [
        NavigationDestination(icon: Icon(Icons.person), label: 'By Author'),
        NavigationDestination(icon: Icon(Icons.text_fields), label: 'By Title'),
        NavigationDestination(icon: Icon(Icons.settings), label: 'Profile'),
      ],
    );
  }
}
