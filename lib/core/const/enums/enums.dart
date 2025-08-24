enum TypeFilter {
  category,
  price,
  rating,
}

enum TypeErrors{
  serverError("Error del servidor"),
  generalError("Error general");

  final String message;

  const TypeErrors(this.message);
}