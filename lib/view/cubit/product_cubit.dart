// view/cubit/product_cubit.dart
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/data/repository/product_repo_abstract.dart';
import 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  final ProductRepositoryAbstract repository;

  ProductCubit(this.repository) : super(ProductInitial());

  void getProducts() async {
    try {
      emit(ProductLoading());
      final products = await repository.getProducts();
      emit(ProductLoaded(products));
    } catch (e) {
      emit(ProductError(e.toString()));
    }
  }
}
