import 'package:flutter/material.dart';
import 'package:shopy/core/core.dart';

class PriceFilterWidget extends StatefulWidget {
  final Function(PriceFilter priceSelected) onFilterChanged;
  final PriceFilter? initialPriceFilter;
  const PriceFilterWidget(
      {super.key, required this.onFilterChanged, this.initialPriceFilter});

  @override
  State<PriceFilterWidget> createState() => _PriceFilterWidgetState();
}

class _PriceFilterWidgetState extends State<PriceFilterWidget> {
  late TextEditingController _controllerMin;
  late TextEditingController _controllerMax;
  late TextFieldDebouncer _debouncer;

  @override
  void initState() {
    super.initState();
    _controllerMin = TextEditingController(
        text: widget.initialPriceFilter?.minPrice?.toString() ?? '');
    _controllerMax = TextEditingController(
        text: widget.initialPriceFilter?.maxPrice?.toString() ?? '');

    _debouncer = TextFieldDebouncer(
      onChanged: _onPriceChanged,
    );

    _debouncer.registerControllers([_controllerMin, _controllerMax]);
  }

  void _onPriceChanged() {
    final minPrice = _controllerMin.text.isNotEmpty
        ? double.tryParse(_controllerMin.text)
        : null;
    final maxPrice = _controllerMax.text.isNotEmpty
        ? double.tryParse(_controllerMax.text)
        : null;

    if (_isValidPriceRange(minPrice, maxPrice)) {
      widget.onFilterChanged(PriceFilter(
        minPrice: minPrice,
        maxPrice: maxPrice,
        name: getNameBaseOnValues(minPrice, maxPrice),
      ));
    }
  }

  bool _isValidPriceRange(double? minPrice, double? maxPrice) {
    if (minPrice == null && maxPrice == null) return false;
    if (minPrice == null || maxPrice == null) return true;
    return minPrice < maxPrice && minPrice >= 0;
  }

  String getNameBaseOnValues(double? minPrice, double? maxPrice) {
    if (minPrice != null && maxPrice != null) {
      return '\$${minPrice.toStringAsFixed(2)} - \$${maxPrice.toStringAsFixed(2)}';
    } else if (minPrice != null) {
      return 'Min: \$${minPrice.toStringAsFixed(2)}';
    } else if (maxPrice != null) {
      return 'Max: \$${maxPrice.toStringAsFixed(2)}';
    }
    return 'No Price Filter';
  }

  @override
  void dispose() {
    _debouncer.dispose();
    _controllerMin.dispose();
    _controllerMax.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      spacing: 10,
      children: [
        Text(
          'Price Range',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        Row(
          children: [
            Expanded(
              child: TextField(
                controller: _controllerMin,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Min Price',
                  border: OutlineInputBorder(),
                  hintText: '0.00',
                  prefixText: '\$ ',
                ),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: TextField(
                controller: _controllerMax,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Max Price',
                  border: OutlineInputBorder(),
                  hintText: '999.99',
                  prefixText: '\$ ',
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
