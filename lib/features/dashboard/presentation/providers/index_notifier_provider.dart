import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'index_notifier_provider.g.dart';

@riverpod
class IndexNotifier extends _$IndexNotifier {
  @override
  int build() {
    return 0;
  }

  void onChange(int index){
    state = index;
  }
}
