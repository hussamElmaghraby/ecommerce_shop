// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:ecommerce_shop/app/features/orders/data/datasource/orders_datasource.dart'
    as _i806;
import 'package:ecommerce_shop/app/features/orders/data/repo_impl/orders_repo_impl.dart'
    as _i406;
import 'package:ecommerce_shop/app/features/orders/domain/repositories/orders_repository.dart'
    as _i651;
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
    gh.factory<_i806.OrdersDataSource>(() => _i806.OrdersDataSource());
    gh.factory<_i651.OrderRespository>(
        () => _i406.OrdersRepoImpl(gh<_i806.OrdersDataSource>()));
    return this;
  }
}
