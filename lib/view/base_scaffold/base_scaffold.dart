import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../components/bottom_nav_bar.dart';
import '../../riverpod/riverpod_management.dart';

class BaseScaffold extends ConsumerStatefulWidget {
  const BaseScaffold({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _BaseScaffoldState();
}

class _BaseScaffoldState extends ConsumerState<BaseScaffold> {
  @override
  void initState() {
    ref.read(productRiverPod).init();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var watch = ref.watch(bottomNavBarRiverpod);
    var read = ref.read(bottomNavBarRiverpod);
    return Scaffold(
      appBar: CupertinoNavigationBar(
        middle: Text(
          watch.appBarTitle(),
        ),
      ),
      bottomNavigationBar: const BottomNavBar(),
      body: watch.body(),
    );
  }
}
