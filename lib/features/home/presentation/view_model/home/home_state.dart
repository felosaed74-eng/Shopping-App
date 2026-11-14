part of 'home_cubit.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

class HCLoading extends HomeState {}

class HCError extends HomeState {
  final String message;
  HCError({required this.message});
}

class HCSuccess extends HomeState {
  final List<CategoryModel> categoriesList;
  HCSuccess({required this.categoriesList});
}
