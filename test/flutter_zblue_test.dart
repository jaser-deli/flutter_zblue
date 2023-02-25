import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_zblue/flutter_zblue.dart';
import 'package:flutter_zblue/flutter_zblue_platform_interface.dart';
import 'package:flutter_zblue/flutter_zblue_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockFlutterZbluePlatform
    with MockPlatformInterfaceMixin
    implements FlutterZbluePlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final FlutterZbluePlatform initialPlatform = FlutterZbluePlatform.instance;

  test('$MethodChannelFlutterZblue is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelFlutterZblue>());
  });

  test('getPlatformVersion', () async {
    FlutterZblue flutterZbluePlugin = FlutterZblue();
    MockFlutterZbluePlatform fakePlatform = MockFlutterZbluePlatform();
    FlutterZbluePlatform.instance = fakePlatform;

    expect(await flutterZbluePlugin.getPlatformVersion(), '42');
  });
}
