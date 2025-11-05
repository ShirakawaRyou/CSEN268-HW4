import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/authentication_bloc.dart';
import '../bloc/authentication_event.dart';
import 'package:go_router/go_router.dart';
import '../widgets/app_top_bar.dart';
import '../widgets/app_bottom_nav.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppTopBar(
        title: 'Profile',
        leading: IconButton(icon: const Icon(Icons.menu, color: Colors.black), onPressed: () {}),
        actions: [IconButton(icon: const Icon(Icons.account_circle, color: Colors.black), onPressed: () {} )],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () {
              context.read<AuthenticationBloc>().add(AuthenticationLoggedOut());
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Theme.of(context).colorScheme.primary,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
              minimumSize: const Size(double.infinity, 50),
            ),
            child: const Text('Logout', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
      ),
      bottomNavigationBar: AppBottomNav(
        selectedIndex: 2,
        onDestinationSelected: (idx) {
          if (idx == 0) context.go('/byAuthor');
          if (idx == 1) context.go('/byTitle');
          if (idx == 2) context.go('/profile');
        },
      ),
    );
  }
}
