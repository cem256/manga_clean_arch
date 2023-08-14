part of '../view/search_view.dart';

class _SearchTextField extends StatefulWidget {
  const _SearchTextField();

  @override
  State<_SearchTextField> createState() => _SearchTextFieldState();
}

class _SearchTextFieldState extends State<_SearchTextField> {
  late final TextEditingController _searchController;

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoSearchTextField(
      autofocus: true,
      controller: _searchController,
      prefixIcon: const Icon(Icons.search_rounded),
      suffixIcon: const Icon(Icons.clear_rounded),
      onSuffixTap: () {
        _searchController.clear();
        context.read<SearchBloc>().add(SearchFieldCleared());
      },
      style: TextStyle(color: context.textTheme.bodyLarge?.color),
      borderRadius: BorderRadius.all(ThemeConstants.radiusCircular),
      placeholder: LocaleKeys.searchView_searchHint.tr(),
      onChanged: (query) => context.read<SearchBloc>().add(SearchQueryChanged(query: query)),
    );
  }
}
