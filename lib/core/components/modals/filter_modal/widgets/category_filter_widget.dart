import 'package:flutter/material.dart';
import 'package:shopy/core/core.dart';

class CategoryFilterWidget extends StatefulWidget {
  final Function(List<CategoryFilter> categoriesSelected) onCategoriesSelected;
  final List<CategoryFilter>? initialSelectedCategories;
  const CategoryFilterWidget(
      {super.key,
      required this.onCategoriesSelected,
      this.initialSelectedCategories});

  @override
  State<CategoryFilterWidget> createState() => _CategoryFilterWidgetState();
}

class _CategoryFilterWidgetState extends State<CategoryFilterWidget> {
  List<Category> selectedCategories = [];

  @override
  void initState() {
    super.initState();
    selectedCategories = widget.initialSelectedCategories?.map((e) => e.category).toList()?? [];
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      spacing: 10,
      children: [
        Text(
          'Categories',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        Wrap(
          spacing: 8.0,
          runSpacing: 5.0,
          alignment: WrapAlignment.center,
          children: Category.values.map((category) {
            return CategoryChip(
              fontSize: 12,
              category: category,
              isSelected: selectedCategories.contains(category),
              onTap: _onCategoryTap,
            );
          }).toList(),
        ),
      ],
    );
  }

  void _onCategoryTap(Category selectedCategory) {
    setState(() {
      if (selectedCategories.contains(selectedCategory)) {
        selectedCategories.remove(selectedCategory);
      } else {
        selectedCategories.add(selectedCategory);
      }
    });

    _notifyChanges();
  }

  void _notifyChanges() {
    final categoryFilters = selectedCategories
        .map((category) => CategoryFilter(
              name: 'Ctgy: ${category.displayName}',
              category: category,
            ))
        .toList();

    widget.onCategoriesSelected(categoryFilters);
  }
}
