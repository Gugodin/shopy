// ignore_for_file: public_member_api_docs, sort_constructors_first
import '../../const/enums/enums.dart';

abstract class TypeFilter {
  final String name;

  const TypeFilter({required this.name});
}

class NameFilter extends TypeFilter {
  final String searchTerm;

  const NameFilter({required super.name, required this.searchTerm});

  @override
  String toString() => 'NameFilter(searchTerm: $searchTerm)';
}

class CategoryFilter extends TypeFilter {
  Category category;
  CategoryFilter({required super.name, required this.category});

  @override
  String toString() => 'CategoryFilter(category: ${category.displayName})';
}

class PriceFilter extends TypeFilter {
  double? minPrice;
  double? maxPrice;

  PriceFilter(
      {required super.name, required this.minPrice, required this.maxPrice});

  @override
  String toString() => 'PriceFilter(minPrice: $minPrice, maxPrice: $maxPrice)';
}

class RatingFilter extends TypeFilter {
  final double? minRating;
  final double? maxRating;

  const RatingFilter(
      {required super.name, required this.minRating, required this.maxRating});

  @override
  String toString() =>
      'RatingFilter(minRating: $minRating, maxRating: $maxRating)';
}
