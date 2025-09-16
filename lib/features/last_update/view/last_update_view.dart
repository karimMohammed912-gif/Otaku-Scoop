import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:otaku_scope/core/providers/providers.dart';
import 'package:otaku_scope/core/widgets/custom_grid_view.dart';

class LastUpdateView extends ConsumerWidget {
  const LastUpdateView({super.key});



  @override
  Widget build(BuildContext context, WidgetRef ref) {

    return CustomGridView(provider: lastUpdateNotifierProvider);
  }
}
