import 'package:presentation/helpers/sealed/sealed.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'settings.g.dart';

@riverpod
class AppMode extends _$AppMode {
  @override
  Mode build() => BasicMode();

  void toBasic() => state = BasicMode();
  void toPreview() => state = PreviewMode();
  void toEditing() => state = EditingMode();
}
