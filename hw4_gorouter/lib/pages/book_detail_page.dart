import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../widgets/app_top_bar.dart';

class BookDetailPage extends StatelessWidget {
  const BookDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppTopBar(
        title: 'Book',
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => context.pop(),
        ),
        actions: const [],
      ),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Text('Detail of the Book', style: TextStyle(color: Colors.grey)),
      ),
    );
  }
}
