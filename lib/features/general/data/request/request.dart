import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flymefy/core/enum/enums.dart';

final class AppAuthenticationLevelRequest {
  AppAuthenticationLevel appAuthenticationLevel;
  AppAuthenticationLevelRequest(
    this.appAuthenticationLevel,
  );
}

class LocationSearchRequest {
  String word;

  LocationSearchRequest(this.word);
}

class LocationNearByRequest {
  String word;
  LatLng latlng;

  LocationNearByRequest(this.word, this.latlng);
}

class LocationLatLngRequest {
  String placeId;

  LocationLatLngRequest(this.placeId);

  Map<String, dynamic> toMap() {
    return {
      'placeId': placeId,
    };
  }
}

class HelpCenterRequest {
  String message;

  HelpCenterRequest({
    required this.message,
  });

  Map<String, dynamic> toMap() {
    return {
      'message': message,
    };
  }
}
