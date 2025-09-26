import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:otaku_scope/core/router/app_router.dart';
import 'package:otaku_scope/core/providers/providers.dart';
import 'package:otaku_scope/core/services/shared_preferences_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPreferencesService.init();
  runApp(ProviderScope(child: const OtakuScope()));
}

class OtakuScope extends ConsumerWidget {
  const OtakuScope({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeModeProvider);
    return MaterialApp.router(
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: themeMode,
      debugShowCheckedModeBanner: false,
      title: 'Otaku Scope',
      routerConfig: routerConfig,
    );
  }
}
