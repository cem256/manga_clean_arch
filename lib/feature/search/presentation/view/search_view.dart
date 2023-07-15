import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';

@RoutePage()
class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search'),
      ),
    );
  }
}
