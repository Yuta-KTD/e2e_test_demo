import 'package:geolocator/geolocator.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final locationProvider = FutureProvider<Position?>((ref) async {
  bool serviceEnabled;
  LocationPermission permission;

  // 位置情報サービスが有効かどうか
  serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    return null;
  }

  //位置情報サービスの権限確認
  permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    //位置情報にアクセスするための許可を促す
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      return null;
    }
  }

  //拒否されている場合ここでエラーになる
  if (permission == LocationPermission.deniedForever) {
    return null;
  }

  //許可された場合、位置情報を返す
  return await Geolocator.getCurrentPosition();
});
