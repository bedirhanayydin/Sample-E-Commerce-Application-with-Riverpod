import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_example/riverpod/product_riverpod.dart';

import 'bottom_nav_bar_riverpod.dart';

final bottomNavBarRiverpod = ChangeNotifierProvider((_) => BottomNavBarRiverpod());
final productRiverPod = ChangeNotifierProvider((_) => ProductRiverpod());
