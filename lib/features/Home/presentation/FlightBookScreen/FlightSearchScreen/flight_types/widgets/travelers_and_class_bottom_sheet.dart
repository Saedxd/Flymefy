import 'package:flutter/material.dart';
import 'package:flymefy/core/app_export.dart';
import 'package:flymefy/features/Home/logic/flight_book/flight_book_cubit.dart';

class TravelersAndClassBottomSheet extends StatelessWidget {
  const TravelersAndClassBottomSheet({
    Key? key,
    required this.cubit,
  }) : super(key: key);

  final FlightBookCubit cubit;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FlightBookCubit, FlightBookState>(
        bloc: cubit,
        builder: (context, state) {
          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Travelers',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    const Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Adults',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            'Ages 12 or older',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                    TravelersCounter(
                      value:
                          (cubit.state.currentSelectedType == FlightType.oneWay
                              ? cubit.state.oneWayData.adults
                              : cubit.state.currentSelectedType ==
                                      FlightType.roundTrip
                                  ? cubit.state.roundTrip.adults
                                  : cubit.state.currentSelectedType ==
                                          FlightType.multiCity
                                      ? cubit.state.multiCity.adults
                                      : 0),
                      onValueChanged: (value) {
                        cubit.onTravelersAdultsChanged(value);
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    const Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Children',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            'Ages 2-11',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                    TravelersCounter(
                      value:
                          (cubit.state.currentSelectedType == FlightType.oneWay
                              ? cubit.state.oneWayData.children
                              : cubit.state.currentSelectedType ==
                                      FlightType.roundTrip
                                  ? cubit.state.roundTrip.children
                                  : cubit.state.currentSelectedType ==
                                          FlightType.multiCity
                                      ? cubit.state.multiCity.children
                                      : 0),
                      onValueChanged: (value) {
                        cubit.onTravelersChildrenChanged(value);
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    const Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Infants',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            'Under 2',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                    TravelersCounter(
                      value:
                          (cubit.state.currentSelectedType == FlightType.oneWay
                              ? cubit.state.oneWayData.infants
                              : cubit.state.currentSelectedType ==
                                      FlightType.roundTrip
                                  ? cubit.state.roundTrip.infants
                                  : cubit.state.currentSelectedType ==
                                          FlightType.multiCity
                                      ? cubit.state.multiCity.infants
                                      : 0),
                      onValueChanged: (value) {
                        cubit.onTravelersInfantsChanged(value);
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                const Divider(),
                const SizedBox(height: 20),
                const Text(
                  'Class',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    const Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Cabin Class',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            'Economy',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                    DropdownButton<String>(
                      value:
                          (cubit.state.currentSelectedType == FlightType.oneWay
                              ? cubit.state.oneWayData.classType
                              : cubit.state.currentSelectedType ==
                                      FlightType.roundTrip
                                  ? cubit.state.roundTrip.classType
                                  : cubit.state.currentSelectedType ==
                                          FlightType.multiCity
                                      ? cubit.state.multiCity.classType
                                      : 'Economy'),
                      items: [
                        const DropdownMenuItem(
                          value: 'Economy',
                          child: Text('Economy'),
                        ),
                        const DropdownMenuItem(
                          value: 'Business',
                          child: Text('Business'),
                        ),
                        const DropdownMenuItem(
                          value: 'First',
                          child: Text('First'),
                        ),
                      ],
                      onChanged: (value) {
                        cubit.onCabinClassChanged(value ?? "");
                      },
                    ),
                  ],
                ),
              ],
            ),
          );
        });
  }
}

class TravelersCounter extends StatelessWidget {
  const TravelersCounter({
    Key? key,
    required this.value,
    required this.onValueChanged,
  }) : super(key: key);

  final int value;
  final ValueChanged<int> onValueChanged;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          icon: const Icon(Icons.remove),
          onPressed: () {
            onValueChanged(value - 1);
          },
        ),
        Text(
          value.toString(),
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        IconButton(
          icon: const Icon(Icons.add),
          onPressed: () {
            onValueChanged(value + 1);
          },
        ),
      ],
    );
  }
}
