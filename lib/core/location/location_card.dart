import 'package:flutter/material.dart';
import 'package:flymefy/core/extension/data_type.dart';
import 'package:flymefy/features/general/domain/entity/location.dart';

class LocationCard extends StatelessWidget {
  final LocationSearch locationSearch;
  const LocationCard({super.key, required this.locationSearch});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(3),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.16),
            spreadRadius: 0,
            blurRadius: 6,
            offset: const Offset(0, 2), // changes position of shadow
          ),
        ],
      ),
      child: ListTile(
        leading: CircleAvatar(
          radius: 22,
          backgroundColor: const Color(0xFFD9D9D9),
          child: Icon(
            Icons.location_on_sharp,
            size: 20,
            color: Colors.black.withOpacity(.45),
          ),
        ),
        title: locationSearch.location.toText(context,
            color: Colors.black.withOpacity(.45),
            fontSize: 14,
            fontWeight: FontWeight.w500,
            overflow: TextOverflow.ellipsis),
        subtitle: locationSearch.description.toText(context,
            color: Colors.black.withOpacity(.45),
            fontSize: 10,
            fontWeight: FontWeight.w400,
            overflow: TextOverflow.ellipsis),
      ),
    );
  }
}
