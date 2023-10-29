import 'package:bloc/bloc.dart';
import 'package:digital_dreams_shop/features/on_boarding/domain/usecases/cache_first_timer.dart';
import 'package:digital_dreams_shop/features/on_boarding/domain/usecases/is_first_timer.dart';
import 'package:equatable/equatable.dart';

part 'on_boarding_state.dart';

class OnBoardingCubit extends Cubit<OnBoardingState> {
  OnBoardingCubit({
    required CacheFirstTimer cacheFirstTimer,
    required IsFirstTimer isFirstTimer,
  })  : _cacheFirstTimer = cacheFirstTimer,
        _isFirstTimer = isFirstTimer,
        super(const OnBoardingInitial());

  final CacheFirstTimer _cacheFirstTimer;
  final IsFirstTimer _isFirstTimer;

  Future<void> cacheFirstTimer() async {
    emit(const CachingFirstTimer());
    final result = await _cacheFirstTimer();

    result.fold(
      (failure) => emit(OnBoardingError(failure.errorMessage)),
      (_) => emit(const UserCached()),
    );
  }

  Future<void> isFirstTimer() async {
    emit(const CheckingIsFirstTimer());
    final result = await _isFirstTimer();

    result.fold(
      (failure) => emit(const OnBoardingStatus(isFirstTimer: true)),
      (status) => emit(OnBoardingStatus(isFirstTimer: status)),
    );
  }
}
