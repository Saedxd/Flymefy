import 'package:equatable/equatable.dart';

class CityAirportsList extends Equatable {
  final List<CityAirport> cityAirports;

  const CityAirportsList({
    this.cityAirports = const [],
  });

  @override
  CityAirportsList copyWith({
    List<CityAirport>? cityAirports,
  }) {
    return CityAirportsList(
      cityAirports: cityAirports ?? this.cityAirports,
    );
  }

  List<Object> get props => [cityAirports];

  factory CityAirportsList.fromJson(Map<String, dynamic> json) {
    return CityAirportsList(
      cityAirports: List<CityAirport>.from(
          json['airports'].map((x) => CityAirport.fromJson(x))),
    );
  }
}

class CityAirport extends Equatable {
  final int id;
  final String name;
  final String iata;
  final String stateName;
  final String stateCode;
  final String countryName;
  final String countryCode;
  final String createdAt;
  final String updatedAt;

  const CityAirport({
     this.id = 0,
      this.name = '',
      this.iata = '',
      this.stateName = '',
      this.stateCode = '',
      this.countryName = '',
      this.countryCode = '',
      this.createdAt = '',
      this.updatedAt = ''

 
  });

  @override
  CityAirport copyWith({
    int? id,
    String? name,
    String? iata,
    String? stateName,
    String? stateCode,
    String? countryName,
    String? countryCode,
    String? createdAt,
    String? updatedAt,
  }) {
    return CityAirport(
      id: id ?? this.id,
      name: name ?? this.name,
      iata: iata ?? this.iata,
      stateName: stateName ?? this.stateName,
      stateCode: stateCode ?? this.stateCode,
      countryName: countryName ?? this.countryName,
      countryCode: countryCode ?? this.countryCode,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  List<Object> get props => [
        id,
        name,
        iata,
        stateName,
        stateCode,
        countryName,
        countryCode,
        createdAt,
        updatedAt,
      ];

  factory CityAirport.fromJson(Map<String, dynamic> json) {
    return CityAirport(
      id: json['id']?? 0,
      name: json['name']?? '',
      iata: json['iata']?? '',
      stateName: json['state_name']?? '',
      stateCode: json['state_code']?? '',
      countryName: json['country_name']?? '',
      countryCode: json['country_code']?? '',
      createdAt: json['created_at']?? '',
      updatedAt: json['updated_at']?? '',
      
      
    );
  }
}
