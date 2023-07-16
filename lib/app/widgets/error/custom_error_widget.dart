import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:manga_clean_arch/app/errors/failures/failures.dart';
import 'package:manga_clean_arch/app/l10n/app_l10n.g.dart';
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
            NetworkFailure() => LocaleKeys.failure_network.tr(),
            UnknownFailure() => LocaleKeys.failure_unknown.tr(),
            NullResponseFailure() => LocaleKeys.failure_nullResponse.tr(),
          },
          style: context.textTheme.bodyLarge,
        ),
        TextButton.icon(
          label: Text(LocaleKeys.retry.tr()),
          onPressed: onPressed,
          icon: const Icon(Icons.refresh),
        )
      ],
    );
  }
}
