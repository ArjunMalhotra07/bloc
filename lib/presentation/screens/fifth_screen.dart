import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:test/constants/enum.dart';
import 'package:test/logic/cubit/status_cubit.dart';

class FifthScreen extends StatefulWidget {
  const FifthScreen({super.key, required this.color});
  final Color color;

  @override
  State<FifthScreen> createState() => _FifthScreenState();
}

class _FifthScreenState extends State<FifthScreen> {
  List<String> timeList = [
    '09:00',
    '09:30',
    '10:00',
    '10:30',
    '11:00',
    '11:30',
    '12:00',
    '12:30',
    '13:00',
    '13:30',
    '14:00',
    '14:30',
    '15:00',
    '15:30',
    '16:00',
    '16:30',
    '17:00',
    '17:30',
    '18:00',
    '18:30',
    '19:00',
    '19:30',
    '20:00',
    '20:30',
    '21:00',
    '21:30'
  ];
  String? value;
  DropdownMenuItem<String> buildMenuItem(String item) =>
      DropdownMenuItem(value: item, child: Text(item));
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: widget.color,
        title: const Text('Screen 5'),
        centerTitle: true,
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            height: MediaQuery.of(context).size.height / 2,
            child: SfCalendar(
              view: CalendarView.month,
              monthViewSettings: const MonthViewSettings(
                appointmentDisplayMode: MonthAppointmentDisplayMode.none,
                dayFormat: 'EEE',
              ),
              // dataSource: _events,
              minDate: DateTime.now(),
              maxDate: DateTime.now().add(Duration(days: 14)),
              // onTap: calendarTapped,
              selectionDecoration: BoxDecoration(
                border: Border.all(color: Theme.of(context).primaryColor),
                borderRadius: BorderRadius.circular(10),
              ),
              headerStyle: CalendarHeaderStyle(
                  textAlign: TextAlign.center,
                  textStyle: Theme.of(context).textTheme.headline4),
              // onSelectionChanged: (details) {
              //   selectedDate = details.date;
              // },
              showNavigationArrow: true,
              monthCellBuilder: (context, details) {
                bool isToday = DateTime.now().day == details.date.day &&
                    DateTime.now().month == details.date.month &&
                    DateTime.now().year == details.date.year;
                int middleDateMonth = details
                    .visibleDates[details.visibleDates.length ~/ 2].month;
                bool trailingDates = details.date.month != middleDateMonth;
                bool difference = details.date.difference(DateTime.now()) <
                    Duration(days: 14);
                bool isAvailable = details.appointments.isNotEmpty &&
                    DateTime.now()
                        .add(Duration(days: -1))
                        .isBefore(details.date) &&
                    difference;
                return Center(
                  child: isToday
                      ? Container(
                          margin: const EdgeInsets.all(5),
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: widget.color,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Text(
                            details.date.day.toString(),
                            style: TextStyle(color: Colors.white),
                          ))
                      : Container(
                          margin: const EdgeInsets.all(5),
                          padding: const EdgeInsets.all(5),
                          child: Text(
                            details.date.day.toString(),
                            style: TextStyle(
                                color: isAvailable
                                    ? Colors.green
                                    : trailingDates
                                        ? Colors.grey[400]
                                        : Colors.black),
                          )),
                );
              },
            ),
          ),
          Container(
            width: 200,
            decoration: BoxDecoration(border: Border.all(color: Colors.black)),
            child: DropdownButton<String>(
                value: value,
                items: timeList.map(buildMenuItem).toList(),
                onChanged: ((value) => setState(() {
                      this.value = value;
                    }))),
          )
        ],
      )),
    );
  }
}
