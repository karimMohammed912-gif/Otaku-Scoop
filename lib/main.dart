import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:otaku_scope/core/router/app_router.dart';

void main() {
  runApp(ProviderScope(child: const OtakuScope()));
}

class OtakuScope extends StatelessWidget {
  const OtakuScope({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      routerConfig: routerConfig,
    );
  }
}
