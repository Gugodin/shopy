import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../core.dart';
import 'widgets/widgets.dart';

Future<List<TypeFilter>?> showFilterModal(BuildContext context,
    {List<TypeFilter>? initialFilters}) async {
  return await showModalBottomSheet<List<TypeFilter>>(
    context: context,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(25.0)),
    ),
    backgroundColor: Theme.of(context).scaffoldBackgroundColor,
    isScrollControlled: true,
    builder: (context) {
      return Padding(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: FilterModal(selectedFilters: initialFilters),
      );
    },
  );
}

class FilterModal extends StatefulWidget {
  final List<TypeFilter>? selectedFilters;
  const FilterModal({super.key, required this.selectedFilters});

  @override
  State<FilterModal> createState() => _FilterModalState();
}

class _FilterModalState extends State<FilterModal> {
  late List<TypeFilter> _selectedFilters;

  @override
  void initState() {
    super.initState();
    _selectedFilters = widget.selectedFilters ?? [];
  }

  @override
  Widget build(BuildContext context) {
    final keyboardHeight = MediaQuery.of(context).viewInsets.bottom;

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 40,
            height: 4,
            margin: const EdgeInsets.symmetric(vertical: 8),
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          Flexible(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                spacing: 20,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Filter Options',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  CategoryFilterWidget(
                    onCategoriesSelected: (categoriesSelected) => setState(() {
                      _selectedFilters
                          .removeWhere((filter) => filter is CategoryFilter);
                      _selectedFilters.addAll(categoriesSelected);
                    }),
                  ),
                  PriceFilterWidget(
                    onFilterChanged: (priceSelected) => setState(() {
                      // Aseguremos que solo hay un filtro de tipo precio
                      _selectedFilters
                          .removeWhere((filter) => filter is PriceFilter);
                      _selectedFilters.add(priceSelected);
                    }),
                  ),
                  RatingFilterWidget(
                    onFilterChanged: (ratingSelected) => setState(() {
                      // Aseguremos que solo hay un filtro de tipo rating
                      _selectedFilters
                          .removeWhere((filter) => filter is RatingFilter);
                      _selectedFilters.add(ratingSelected);
                    }),
                  ),
                  if (keyboardHeight > 0) const SizedBox(height: 0),
                ],
              ),
            ),
          ),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: Theme.of(context).scaffoldBackgroundColor,
              border: Border(
                top: BorderSide(
                  color: Colors.grey[300]!,
                  width: 1,
                ),
              ),
            ),
            child: ElevatedButton(
              onPressed: () {
                context.pop(_selectedFilters);
              },
              child: const Text('Apply Filters'),
            ),
          ),
        ],
      ),
    );
  }
}
