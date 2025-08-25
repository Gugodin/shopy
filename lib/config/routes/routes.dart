import 'package:auto_route/auto_route.dart';
import 'package:shopy/config/routes/routes.gr.dart';

/// Para auto generar las rutas que se han definido ejecute
/// `dart run build_runner build`

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  RouteType get defaultRouteType => RouteType.material();

  @override
  List<AutoRoute> get routes => [
        /// routes go here
        AutoRoute(page: ProductsListRoute.page, initial: true, path: '/products'),
        AutoRoute(page: ProductDetailRoute.page, path: '/products/:id'),
      ];
}
