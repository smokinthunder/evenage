// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:evenage/application/auth/auth_bloc.dart' as _i903;
import 'package:evenage/domain/user/i_user_repo.dart' as _i1050;
import 'package:evenage/infrastructure/auth/user_repo.dart' as _i597;
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
    gh.lazySingleton<_i1050.IUserRepo>(() => _i597.UserRepo());
    gh.factory<_i903.AuthBloc>(() => _i903.AuthBloc(gh<_i1050.IUserRepo>()));
    return this;
  }
}
