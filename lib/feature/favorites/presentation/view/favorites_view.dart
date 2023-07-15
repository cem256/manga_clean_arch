import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class FavoritesView extends StatelessWidget {
  const FavoritesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorites'),
      ),
    );
  }
}
