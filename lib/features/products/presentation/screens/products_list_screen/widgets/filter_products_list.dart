import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shopy/config/styles/styles.dart';

import '../../../../../../core/core.dart';
import '../../../providers/providers.dart';

class FilterProductsList extends ConsumerStatefulWidget {
  final Function(bool isDisplayedCategoryChip) onCategorySelected;
  const FilterProductsList({super.key, required this.onCategorySelected});

  @override
  ConsumerState<FilterProductsList> createState() => _FilterProductsListState();
}

class _FilterProductsListState extends ConsumerState<FilterProductsList> {
  bool isThereCategorySelected = false;

  late TextEditingController controller;
  late TextFieldDebouncer debouncer;

  initState() {
    super.initState();
    controller = TextEditingController();

    debouncer = TextFieldDebouncer(onChanged: onSearchChanged);

    debouncer.registerController(controller);
  }

  void onSearchChanged() {
    controller.addListener(() {
      ref
          .read(productListNotifierProvider.notifier)
          .filterProductsByName(controller.text);
      if (controller.text.isEmpty) {
        ref.read(productListNotifierProvider.notifier).clearFilters();
      }
    });
  }

  @override
  void dispose() {
    controller.dispose();
    debouncer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final filters = ref.watch(filterProvider);
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
                crossAxisAlignment: CrossAxisAlignment.start,
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
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: filters.map((filter) {
                                  return FilterChipWidget(
                                    typeFilter: filter,
                                    onTap: (selectedFilter) {
                                      setState(() {
                                        ref
                                            .read(filterProvider.notifier)
                                            .update((state) =>
                                                state..remove(selectedFilter));
                                        isThereCategorySelected =
                                            filters.isNotEmpty;
                                        widget.onCategorySelected(
                                            isThereCategorySelected);
                                      });
                                    },
                                  );
                                }).toList(),
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
                onPressed: () async {
                  final resp =
                      await showFilterModal(context, initialFilters: filters);
                  if (resp != null) {
                    print('Filtros seleccionados');
                    print(resp);
                    ref.read(filterProvider.notifier).update((state) {
                      return resp;
                    });
                    print('Provider: ');
                    print(ref.read(filterProvider));
                    setState(() {
                      isThereCategorySelected = true;
                      widget.onCategorySelected(isThereCategorySelected);
                    });
                  }
                }),
          ),
        ],
      ),
    );
  }
// ...existing code...
}
