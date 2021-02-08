import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class Disponibilite extends StatefulWidget {
  double parentHeight;

  Disponibilite(double parentHeight){
    this.parentHeight = parentHeight;
  }

  @override
  _DisponibiliteState createState() => _DisponibiliteState(parentHeight);
}

class _DisponibiliteState extends State<Disponibilite> {
  double parentHeight;

  _DisponibiliteState(double parentHeight){
    this.parentHeight = parentHeight - 200.0;
  }

  @override
  Widget build(BuildContext context) {

    return Container(
      margin: EdgeInsets.only(top: 10.0),
      height: 550.0,
      child: SfCalendar(
        view: CalendarView.week,
        scheduleViewSettings: ScheduleViewSettings(
          appointmentItemHeight: 70,
        ),
        // timeSlotViewSettings: TimeSlotViewSettings(
        //   timeInterval: Duration(hours: 2),
        //   timeIntervalHeight: -1,
        //   dateFormat: 'd',
        //   dayFormat: "EEE"
        // ),
        cellEndPadding: 5,
        dataSource: MeetingDataSource(_getDataSource()),
        monthViewSettings: MonthViewSettings(
          appointmentDisplayMode: MonthAppointmentDisplayMode.appointment
        ),
        specialRegions: _getTimeRegions(),
        firstDayOfWeek: 1,
        onTap: (CalendarTapDetails details) {
          List<dynamic> appointment = details.appointments;
          DateTime date = details.date;
          CalendarElement element = details.targetElement;
          print("SujetRendez-vous : ${appointment[0].eventName}, Année : ${date.year}, Mois : ${date.month}, element : ${element.toString()}");
        },
      ),
    );
  }

  List<TimeRegion> _getTimeRegions() {
    final List<TimeRegion> regions = <TimeRegion>[];
    regions.add(TimeRegion(
      startTime: DateTime.now(),
      endTime: DateTime.now().add(Duration(hours: 1)),
      enablePointerInteraction: false,
      color: Colors.grey.withOpacity(0.2),
      text: 'Break'));

    return regions;
  }

  List<Meeting> _getDataSource() {
    List<Meeting> meetings = <Meeting>[];
    final DateTime today = DateTime.now();
    final DateTime startTime = DateTime(today.year, today.month, today.day, 8, 0, 0);
    final DateTime endTime = startTime.add(const Duration(hours: 10));
    meetings.add(Meeting(
      'Conference', startTime, endTime, const Color(0xFF0F8644), false));
    return meetings;
  }
}

class MeetingDataSource extends CalendarDataSource {
  MeetingDataSource(List<Meeting> source){
    appointments = source;
  }

  @override
  DateTime getStartTime(int index) {
    return appointments[index].from;
  }

  @override
  DateTime getEndTime(int index) {
    return appointments[index].to;
  }

  @override
  String getSubject(int index) {
    return appointments[index].eventName;
  }

  @override
  Color getColor(int index) {
    return appointments[index].background;
  }

  @override
  bool isAllDay(int index) {
    return appointments[index].isAllDay;
  }
}

class Meeting {
  String eventName;
  DateTime from;
  DateTime to;
  Color background;
  bool isAllDay;

  Meeting(this.eventName, this.from, this.to, this.background, this.isAllDay);
}
