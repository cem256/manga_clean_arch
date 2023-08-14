part of '../view/popular_view.dart';

class _PopularViewAppBar extends StatelessWidget implements PreferredSizeWidget {
  const _PopularViewAppBar();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: Text(LocaleKeys.popular.tr()),
      leading: IconButton(
        icon: Icon(context.brightness == Brightness.dark ? Icons.light_mode : Icons.dark_mode),
        onPressed: () => context.read<ThemeCubit>().changeTheme(brightness: context.brightness),
      ),
      actions: [
        IconButton(
          onPressed: () => context.router.push(const SearchRoute()),
          icon: const Icon(Icons.search),
        ),
      ],
    );
  }
}
