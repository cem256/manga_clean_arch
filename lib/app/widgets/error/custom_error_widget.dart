import 'package:flutter/material.dart';
import 'package:manga_clean_arch/app/errors/failures/failures.dart';
import 'package:manga_clean_arch/core/extensions/context_extensions.dart';

class CustomErrorWidget extends StatelessWidget {
  const CustomErrorWidget({required this.failure, super.key, this.onPressed});

  final Failure failure;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          switch (failure) {
            NetworkFailure() => 'Network Failure',
            UnknownFailure() => 'Unknown Failure',
            NullResponseFailure() => 'Cannot Fetch Data',
          },
          style: context.textTheme.bodyLarge,
        ),
        TextButton.icon(
          label: const Text('Retry'),
          onPressed: onPressed,
          icon: const Icon(Icons.refresh),
        )
      ],
    );
  }
}
