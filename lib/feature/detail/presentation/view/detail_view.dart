import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class DetailView extends StatelessWidget {
  const DetailView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail'),
      ),
    );
  }
}
