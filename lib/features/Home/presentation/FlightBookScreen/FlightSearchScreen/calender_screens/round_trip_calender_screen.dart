import 'package:flutter/material.dart';
import 'package:flymefy/core/app_export.dart';
import 'package:flymefy/features/Home/logic/flight_book/flight_book_cubit.dart';
import 'package:flymefy/Constants/colors.dart';
import 'package:flymefy/Constants/font_family.dart';
import 'package:flymefy/Screens/Utills/common_button_widget.dart';
import 'package:flymefy/Screens/Utills/common_text_widget.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RoundTripCalender extends StatelessWidget {
  const RoundTripCalender({Key? key, required this.cubit, required this.type})
      : super(key: key);
  final FlightBookCubit cubit;
  final String type;
  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: cubit,
      child: RoundTripCalenderScreen(
        cubit: cubit,
        type: type,
      ),
    );
  }
}

class RoundTripCalenderScreen extends StatefulWidget {
  const RoundTripCalenderScreen({
    Key? key,
    required this.cubit,
    required this.type,
  }) : super(key: key);
  final FlightBookCubit cubit;
  final String type;

  @override
  State<RoundTripCalenderScreen> createState() => _CalenderScreenState();
}

class _CalenderScreenState extends State<RoundTripCalenderScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: BlocBuilder<FlightBookCubit, FlightBookState>(
          bloc: widget.cubit,
          builder: (context, state) {
            return AppBar(
              backgroundColor: redCA0,
              automaticallyImplyLeading: false,
              elevation: 0,
              centerTitle: true,
              leading: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(Icons.arrow_back, color: white, size: 20),
              ),
              title: CommonTextWidget.PoppinsSemiBold(
                text:
                    "${widget.cubit.state.oneWayData.flightDetailsFrom.countryName} To ${widget.cubit.state.oneWayData.flightDetailsTo.countryName}",
                color: white,
                fontSize: 15,
              ),
            );
          },
        ),
      ),
      body: BlocBuilder<FlightBookCubit, FlightBookState>(
        bloc: widget.cubit,
        builder: (context, state) {
          return Column(
            children: [
              TableCalendar(
                // availableCalendarFormats: {
                //   CalendarFormat.month: 'Month',
                // },
                availableGestures: AvailableGestures.none,
                firstDay: DateTime.now(),
                lastDay: DateTime.utc(2030, 12, 31),
                focusedDay: state.focusedDay ?? DateTime.now(),
                calendarFormat: CalendarFormat.month,
                onFormatChanged: (format) {
                  widget.cubit.updateCalendarFormat(format);
                },
                selectedDayPredicate: (day) {
                  return isSameDay(
                      widget.type == "DEPARTURE"
                          ? state.roundTrip.departureDate.isNotEmpty
                              ? DateTime.parse(state.roundTrip.departureDate)
                              : DateTime.now()
                          : state.roundTrip.arrivalDate.isNotEmpty
                              ? DateTime.parse(state.roundTrip.arrivalDate)
                              : DateTime.now(),
                      day);
                },
                onDaySelected: (selectedDay, focusedDay) {
                  widget.type == "DEPARTURE"
                      ? widget.cubit.updateRoundTripdepartureDate(selectedDay)
                      : widget.cubit.updateRoundTripArrivalDate(selectedDay);
                },
                onPageChanged: (focusedDay) {
                  widget.cubit.updateFocusedDay(focusedDay);
                },
                daysOfWeekStyle: DaysOfWeekStyle(
                  weekdayStyle: TextStyle(
                      fontSize: 12,
                      fontFamily: FontFamily.PoppinsRegular,
                      color: grey717),
                ),
                calendarStyle: CalendarStyle(
                  selectedDecoration: BoxDecoration(
                    color: redCA0,

                    shape: BoxShape.circle,
                    //    borderRadius: BorderRadius.circular(4),
                  ),
                  selectedTextStyle: TextStyle(
                    color: white,
                    fontFamily: FontFamily.PoppinsMedium,
                    fontSize: 16,
                  ),
                  disabledTextStyle: TextStyle(
                    color: grey717,
                    fontFamily: FontFamily.PoppinsRegular,
                    fontSize: 16,
                  ),
                  todayDecoration: BoxDecoration(
                    color: const Color.fromARGB(255, 132, 21, 21),
                    shape: BoxShape.circle,
                    // borderRadius: BorderRadius.circular(4),
                  ),
                ),
                headerStyle: HeaderStyle(
                  formatButtonVisible: false,
                  titleTextStyle: TextStyle(
                    fontSize: 12,
                    fontFamily: FontFamily.PoppinsRegular,
                    color: black2E2,
                  ),
                  titleCentered: true,
                ),
              ),
              Spacer(),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24),
                child: CommonButtonWidget(
                  buttonColor: redCA0,
                  onTap: () {
                    Navigator.pop(context);
                  },
                  text: "Done",
                ),
              ),
              SizedBox(height: 50),
            ],
          );
        },
      ),
    );
  }
}
