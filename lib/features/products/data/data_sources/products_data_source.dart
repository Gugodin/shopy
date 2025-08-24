

import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../models/model.dart';

part 'products_data_source.g.dart';

// Si en algun momento al generar el codigo se genera un error, en relación a ParseErrorLogger
// asegurate que el paquete que estas importanto es package:retrofit/retrofit.dart

@RestApi()
abstract class ProductsDataSource {

  factory ProductsDataSource(Dio dio) = _ProductsDataSource;

  @GET('/products')
  //Utilizamos como return el HttpResponse, para poder obtener el status code
  Future<HttpResponse<List<ProductModel>>> getAllProducts();

  @GET('/products/{id}')
  Future<HttpResponse<ProductDetailModel>> getProductById(
    @Path('id') String id,
  );
}

// GET
// https://fakestoreapi.com/products
// 
// https://fakestoreapi.com/products/{id}