part of 'checkout_bloc.dart';

@freezed
class CheckoutState with _$CheckoutState {
  // const factory CheckoutState.initial() = _Initial;

  const factory CheckoutState.loaded(List<ProductQuantity> products) = _Loaded;
  const factory CheckoutState.loading() = _Loading;
}

class ProductQuantity {
  Product product;
  int quantity;
  ProductQuantity({
    required this.product,
    required this.quantity,
  });
}
