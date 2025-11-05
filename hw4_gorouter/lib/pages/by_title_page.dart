import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../widgets/app_top_bar.dart';
import '../widgets/app_bottom_nav.dart';

class ByTitlePage extends StatelessWidget {
  const ByTitlePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final books = List.generate(4, (_) => {'title': 'Da Vinci Code', 'author': 'Dan Brown'});
    return Scaffold(
      appBar: AppTopBar(
        title: 'Books',
        leading: IconButton(icon: const Icon(Icons.menu, color: Colors.black), onPressed: () {}),
        actions: [IconButton(icon: const Icon(Icons.account_circle, color: Colors.black), onPressed: () {})],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Sorted by Title',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          const SizedBox(height: 16),
          Expanded(
            child: ListView.separated(
              itemCount: books.length,
              separatorBuilder: (_, __) => const SizedBox(height: 8),
              itemBuilder: (context, index) {
                final book = books[index];
                return GestureDetector(
                  onTap: () => context.push('/byTitle/detail'),
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade100,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          book['title']!,
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        const SizedBox(height: 4),
                        Text(
                          book['author']!,
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      ),
      bottomNavigationBar: AppBottomNav(
        selectedIndex: 1,
        onDestinationSelected: (idx) {
          if (idx == 0) context.go('/byAuthor');
          if (idx == 1) context.go('/byTitle');
          if (idx == 2) context.go('/profile');
        },
      ),
    );
  }
}
