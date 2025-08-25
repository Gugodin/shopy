import 'package:flutter/material.dart';

import '../../../../core.dart';

class RatingFilterWidget extends StatefulWidget {
  final Function(RatingFilter ratingSelected) onFilterChanged;
  final RatingFilter? initialRatingFilter;
  const RatingFilterWidget(
      {super.key, required this.onFilterChanged, this.initialRatingFilter});

  @override
  State<RatingFilterWidget> createState() => _RatingFilterWidgetState();
}

class _RatingFilterWidgetState extends State<RatingFilterWidget> {
  late TextEditingController _minRatingController;
  late TextEditingController _maxRatingController;
  late TextFieldDebouncer _debouncer;

  @override
  void initState() {
    super.initState();
    _minRatingController = TextEditingController(
        text: widget.initialRatingFilter?.minRating?.toString());
    _maxRatingController = TextEditingController(
        text: widget.initialRatingFilter?.maxRating?.toString());

    _debouncer = TextFieldDebouncer(onChanged: _onRatingChanged);

    _debouncer
        .registerControllers([_minRatingController, _maxRatingController]);
  }

  void _onRatingChanged() {
    final minRating = _minRatingController.text.isNotEmpty
        ? double.tryParse(_minRatingController.text)
        : null;
    final maxRating = _maxRatingController.text.isNotEmpty
        ? double.tryParse(_maxRatingController.text)
        : null;

    if (_isValidRatingRange(minRating, maxRating)) {
      widget.onFilterChanged(RatingFilter(
        minRating: minRating,
        maxRating: maxRating,
        name: getNameBaseOnValues(minRating, maxRating),
      ));
    }
  }

  bool _isValidRatingRange(double? minRating, double? maxRating) {
    // cuando los dos son nulls
    if (minRating == null && maxRating == null) return false;
    // cuando uno no es null y el otro si
    if (minRating == null || maxRating == null) return true;
    // cuando los 2 no son null, procedemos a verificar los valores
    return minRating < maxRating &&
        minRating >= 0 &&
        minRating <= 5 &&
        maxRating >= 0 &&
        maxRating <= 5;
  }

  String getNameBaseOnValues(double? minRating, double? maxRating) {
    if (minRating != null && maxRating != null) {
      return '${minRating.toStringAsFixed(1)} - ${maxRating.toStringAsFixed(1)}⭐';
    } else if (minRating != null) {
      return 'Min: ${minRating.toStringAsFixed(1)}⭐';
    } else if (maxRating != null) {
      return 'Max: ${maxRating.toStringAsFixed(1)}⭐';
    }
    return 'No Rating Filter';
  }

  @override
  void dispose() {
    _minRatingController.dispose();
    _maxRatingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      spacing: 10,
      children: [
        Text(
          'Minimum Rating',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        Row(
          children: [
            Expanded(
              child: TextField(
                controller: _minRatingController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Min',
                  border: OutlineInputBorder(),
                  hintText: '0.0',
                  suffixText: '⭐',
                ),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: TextField(
                controller: _maxRatingController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Max',
                  border: OutlineInputBorder(),
                  hintText: '5.0',
                  suffixText: '⭐',
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
