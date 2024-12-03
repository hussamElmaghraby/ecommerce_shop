import 'package:ecommerce_shop/app/core/routing/route_names.dart';
import 'package:ecommerce_shop/orders/presentation/screens/numeric_metrics_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

import 'core/routing/pages.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return  GetMaterialApp(
      initialRoute: AppRoutes.METRICS ,
      getPages: AppPages.routes,
    );
  }
}
