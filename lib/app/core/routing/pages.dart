import 'package:ecommerce_shop/app/core/routing/route_names.dart';
import 'package:ecommerce_shop/orders/presentation/screens/numeric_metrics_screen.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';


class AppPages {
  AppPages._();

  static final routes = [
    GetPage(
      name: AppRoutes.METRICS,
      page: () => NumericMetricsScreen(),
    ),
  ];
}