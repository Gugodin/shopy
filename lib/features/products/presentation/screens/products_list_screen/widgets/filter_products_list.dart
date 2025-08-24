import 'package:flutter/material.dart';
import 'package:shopy/config/styles/styles.dart';

import '../../../../../../core/core.dart';

class FilterProductsList extends StatefulWidget {
  final Function(bool isDisplayedCategoryChip) onCategorySelected;
  const FilterProductsList({super.key, required this.onCategorySelected});

  @override
  State<FilterProductsList> createState() => _FilterProductsListState();
}

class _FilterProductsListState extends State<FilterProductsList> {
  bool isThereCategorySelected = false;

  final TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      margin: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: AppShadowStyle.containerShadow,
      ),
      child: Row(
        children: [
          Expanded(
            flex: 5,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  AnimatedSwitcher(
                    duration: const Duration(milliseconds: 200),
                    child: isThereCategorySelected
                        ? Padding(
                            padding: const EdgeInsets.only(bottom: 10.0),
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                spacing: 8,
                                children: [
                                  CategoryChip(
                                    label: 'Category 1',
                                    onTap: () {
                                      setState(() {
                                        isThereCategorySelected = false;
                                        widget.onCategorySelected(
                                            isThereCategorySelected);
                                      });
                                    },
                                  ),
                                  CategoryChip(
                                    label: 'Category 2',
                                    onTap: () {
                                      setState(() {
                                        isThereCategorySelected = false;
                                        widget.onCategorySelected(
                                            isThereCategorySelected);
                                      });
                                    },
                                  ),
                                  CategoryChip(
                                    label: 'Category 2',
                                    onTap: () {
                                      setState(() {
                                        isThereCategorySelected = false;
                                        widget.onCategorySelected(
                                            isThereCategorySelected);
                                      });
                                    },
                                  ),
                                  CategoryChip(
                                    label: 'Category 2',
                                    onTap: () {
                                      setState(() {
                                        isThereCategorySelected = false;
                                        widget.onCategorySelected(
                                            isThereCategorySelected);
                                      });
                                    },
                                  ),
                                ],
                              ),
                            ),
                          )
                        : const SizedBox.shrink(),
                  ),
                  TextField(
                    controller: controller,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(12.0),
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                      hintText: 'Search products',
                      border: InputBorder.none,
                      prefixIcon: const Icon(Icons.search),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: CustomIconButton(
                icon: Icons.filter_list,
                onPressed: () {
                  setState(() {
                    isThereCategorySelected = !isThereCategorySelected;
                    widget.onCategorySelected(isThereCategorySelected);
                  });
                }),
          ),
        ],
      ),
    );
  }
// ...existing code...
}
