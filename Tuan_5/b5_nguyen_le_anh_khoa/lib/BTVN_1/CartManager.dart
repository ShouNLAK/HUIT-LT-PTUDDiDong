import 'package:b5_nguyen_le_anh_khoa/BTVN_1/Phone.dart';

class CartManager {
  static final List<Phone> cartItems = [];

  static void addToCart(Phone phone) {
    cartItems.add(phone);
  }

  static void removeFromCart(Phone phone) {
    cartItems.remove(phone);
  }

  static void clearCart() {
    cartItems.clear();
  }
}
