part of 'resources.dart';

List<ProductDetailModel> laptopList = [
  ProductDetailModel(
      name: 'MacBook Air M1',
      bgColor: const Color.fromARGB(255, 228, 242, 251),
      price: 299,
      description:
          'M1 brings incredible performance, custom technologies and amazing power efficiency to MacBook Air. Packed with 16 billion transistors, it integrates the CPU, GPU every other significant component and controller onto a single tiny chip.The powerful 8-core CPU combines four performance cores and four efficiency cores that work together to tackle demanding multi-threaded tasks, while the 7-core GPU delivers blazing-fast integrated graphics.',
      imageLink: 'assets/mba.png',
      productColors: [Colors.black, Colors.grey, Colors.pink]),
  ProductDetailModel(
      name: 'MacBook Pro',
      bgColor: const Color.fromARGB(255, 251, 223, 227),
      price: 599,
      description:
          'M1 brings incredible performance, custom technologies and amazing power efficiency to MacBook Air. Packed with 16 billion transistors, it integrates the CPU, GPU every other significant component and controller onto a single tiny chip.The powerful 8-core CPU combines four performance cores and four efficiency cores that work together to tackle demanding multi-threaded tasks, while the 7-core GPU delivers blazing-fast integrated graphics.',
      imageLink: 'assets/mbp.png',
      productColors: [Colors.black, Colors.grey]),
  ProductDetailModel(
      name: 'MacBook Pro 14',
      bgColor: const Color.fromARGB(255, 235, 235, 235),
      price: 1599,
      description:
          'M1 brings incredible performance, custom technologies and amazing power efficiency to MacBook Air. Packed with 16 billion transistors, it integrates the CPU, GPU every other significant component and controller onto a single tiny chip.The powerful 8-core CPU combines four performance cores and four efficiency cores that work together to tackle demanding multi-threaded tasks, while the 7-core GPU delivers blazing-fast integrated graphics.',
      imageLink: 'assets/mbp.png',
      productColors: [Colors.black, Colors.grey]),
];

List<ProductDetailModel> phoneList = [
  ProductDetailModel(
      name: 'Iphone 13',
      bgColor: const Color.fromARGB(255, 228, 242, 251),
      price: 599,
      description:
          'M1 brings incredible performance, custom technologies and amazing power efficiency to MacBook Air. Packed with 16 billion transistors, it integrates the CPU, GPU every other significant component and controller onto a single tiny chip.The powerful 8-core CPU combines four performance cores and four efficiency cores that work together to tackle demanding multi-threaded tasks, while the 7-core GPU delivers blazing-fast integrated graphics.',
      imageLink: 'assets/iphone13.png',
      productColors: [Colors.black, Colors.grey]),
  ProductDetailModel(
      name: 'Iphone 14',
      bgColor: const Color.fromARGB(255, 251, 223, 227),
      price: 699,
      description:
          'M1 brings incredible performance, custom technologies and amazing power efficiency to MacBook Air. Packed with 16 billion transistors, it integrates the CPU, GPU every other significant component and controller onto a single tiny chip.The powerful 8-core CPU combines four performance cores and four efficiency cores that work together to tackle demanding multi-threaded tasks, while the 7-core GPU delivers blazing-fast integrated graphics.',
      imageLink: 'assets/iphone14.png',
      productColors: [Colors.black, Colors.grey]),
  ProductDetailModel(
      name: 'Iphone 14 Pro',
      bgColor: Colors.white,
      price: 999,
      description:
          'M1 brings incredible performance, custom technologies and amazing power efficiency to MacBook Air. Packed with 16 billion transistors, it integrates the CPU, GPU every other significant component and controller onto a single tiny chip.The powerful 8-core CPU combines four performance cores and four efficiency cores that work together to tackle demanding multi-threaded tasks, while the 7-core GPU delivers blazing-fast integrated graphics.',
      imageLink: 'assets/iphone14pro.png',
      productColors: [Colors.black, Colors.grey]),
];

List<ProductDetailModel> otherProductList = [
  ProductDetailModel(
      name: 'Watch Ultra',
      imageLink: 'assets/watch-ultra.png',
      price: 999,
      bgColor: const Color.fromARGB(255, 228, 242, 251),
      description:
          'M1 brings incredible performance, custom technologies and amazing power efficiency to MacBook Air. Packed with 16 billion transistors, it integrates the CPU, GPU every other significant component and controller onto a single tiny chip.The powerful 8-core CPU combines four performance cores and four efficiency cores that work together to tackle demanding multi-threaded tasks, while the 7-core GPU delivers blazing-fast integrated graphics.',
      productColors: [Colors.black, Colors.grey]),
  ProductDetailModel(
      name: 'Airpods Max',
      price: 399,
      imageLink: 'assets/airpods-max.png',
      bgColor: const Color.fromARGB(255, 251, 223, 227),
      description:
          'M1 brings incredible performance, custom technologies and amazing power efficiency to MacBook Air. Packed with 16 billion transistors, it integrates the CPU, GPU every other significant component and controller onto a single tiny chip.The powerful 8-core CPU combines four performance cores and four efficiency cores that work together to tackle demanding multi-threaded tasks, while the 7-core GPU delivers blazing-fast integrated graphics.',
      productColors: [Colors.black, Colors.grey]),
  ProductDetailModel(
      name: 'Iphone 14 Pro',
      bgColor: Colors.white,
      price: 999,
      description:
          'M1 brings incredible performance, custom technologies and amazing power efficiency to MacBook Air. Packed with 16 billion transistors, it integrates the CPU, GPU every other significant component and controller onto a single tiny chip.The powerful 8-core CPU combines four performance cores and four efficiency cores that work together to tackle demanding multi-threaded tasks, while the 7-core GPU delivers blazing-fast integrated graphics.',
      imageLink: 'assets/iphone14pro.png',
      productColors: [Colors.black, Colors.grey]),
];

List<CategoryModel> categoryData = [
  CategoryModel(categoryType: 'MacBook', image: 'assets/mba.png'),
  CategoryModel(categoryType: 'Phone', image: 'assets/iphone14pro.png'),
  CategoryModel(categoryType: 'EarPhone', image: 'assets/airpods-max.png'),
  CategoryModel(categoryType: 'Watch', image: 'assets/watch-ultra.png'),
];

List<BottomSheetModel> bottomSheetData = [
  BottomSheetModel(iconData: Icons.home_outlined, title: 'Home'),
  BottomSheetModel(iconData: Icons.shopping_cart_outlined, title: 'Cart'),
  BottomSheetModel(iconData: Icons.wallet_outlined, title: 'Wallet'),
  BottomSheetModel(iconData: Icons.settings_outlined, title: 'Profile')
];

List<SaveItemModel> saveData = [];
