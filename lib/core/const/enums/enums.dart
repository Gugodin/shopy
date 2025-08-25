enum Category {
  electronics('Electronics', 'electronics'),
  jewelery('Jewelry', 'jewelery'),
  mensClothing("Men's Clothing", "men's clothing"),
  womensClothing("Women's Clothing", "women's clothing");

  const Category(this.displayName, this.apiValue);

  final String displayName;
  final String apiValue;

  static Category fromApiValue(String apiValue) {
    return Category.values.firstWhere(
      (category) => category.apiValue == apiValue,
      orElse: () => throw ArgumentError('Unknown category: $apiValue'),
    );
  }
}