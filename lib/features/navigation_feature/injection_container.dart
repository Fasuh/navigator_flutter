import '../../injection_container.dart';

mixin NewFeatureInjector on Injector {
  @override
  Future<void> init() async {
    await super.init();

  }
}