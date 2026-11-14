import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_app/core/network/api_result.dart';
import 'package:shopping_app/features/home/data/models/catrgories_list_model.dart';
import 'package:shopping_app/features/home/data/models/product_list_model.dart';
import 'package:shopping_app/features/home/data/repo/repo/home_repo_interface.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this.repo) : super(HomeInitial());
  final HomeRepoInterface repo;

  Future<void> getAllCategories() async {
    emit(HCLoading());
    final result = await repo.getAllCatregories();
    switch (result) {
      case Success<CatrgoriesList>():
        emit(HCSuccess(categoriesList: result.data.list ?? []));
      case Error<CatrgoriesList>():
        emit(HCError(message: result.error));
    }
  }

  Future<void> getAllProduct() async {
    emit(HPLoading());
    final result = await repo.getAllProduct();
    switch (result) {
      case Success<ProductList>():
        emit(HPSuccess(categoriesList: result.data.list ?? []));
      case Error<ProductList>():
        emit(HPError(message: result.error));
    }
  }
}
