// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:ecommerce_shop/orders/data/datasource/orders_datasource.dart'
    as _i497;
import 'package:ecommerce_shop/orders/data/repo_impl/orders_repo_impl.dart'
    as _i219;
import 'package:ecommerce_shop/orders/domain/repositories/orders_repository.dart'
    as _i805;
import 'package:ecommerce_shop/orders/domain/usecase/get_orders_usecase.dart'
    as _i985;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.factory<_i497.OrdersDataSource>(() => _i497.OrdersDataSource());
    gh.factory<_i805.OrderRespository>(
        () => _i219.OrdersRepoImpl(gh<_i497.OrdersDataSource>()));
    gh.factory<_i985.GetOrdersUsecase>(() =>
        _i985.GetOrdersUsecase(orderRespository: gh<_i805.OrderRespository>()));
    return this;
  }
}
