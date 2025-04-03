import 'package:flowerlly_app/constants/all_colors.dart';
import 'package:flowerlly_app/constants/app_size.dart';
import 'package:flowerlly_app/constants/assets.dart';
import 'package:flowerlly_app/core/utils/styles.dart';
import 'package:flowerlly_app/features/favourit/presentation/widgets/custom_app_bar.dart';
import 'package:flowerlly_app/features/status/presentation/views/widgets/list_of_check_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:table_calendar/table_calendar.dart';

class CalenderBodyScreen extends StatefulWidget {
  const CalenderBodyScreen({super.key});

  @override
  State<CalenderBodyScreen> createState() => _CalenderBodyScreenState();
}

class _CalenderBodyScreenState extends State<CalenderBodyScreen> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;


  final Map<DateTime, bool> _taskStatus = {
    DateTime.utc(2025, 2, 5): true, 
    DateTime.utc(2025, 2, 10): false, // ❌ Not Completed
  };

  void _toggleTaskStatus(DateTime day) {
    setState(() {
      if (_taskStatus.containsKey(day)) {
        _taskStatus.remove(day);
      } else {
        _taskStatus[day] = false;
      }
    });
  }

  void _showTaskDetails(BuildContext context, DateTime day) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          height: AppSize.height(context) * .5,
          padding: const EdgeInsets.symmetric(
            horizontal: 19,
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: AppSize.height(context) * .05,
                ),
                Row(
                  children: [
                    Text('Tasks for ${day.day}/${day.month}/${day.year}',
                        style: Styles.textStyle18
                            .copyWith(color: AllColors.kGreenColor)),
                    const Spacer(),
                    IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: SvgPicture.asset(Assets.assetsImagesClose))
                  ],
                ),
                SizedBox(
                  height: AppSize.height(context) * .04,
                ),
                const ListOfCheckBox()
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: const Text('Task Calendar')),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: SizedBox(
              height: AppSize.height(context) * .06,
            ),
          ),
          const SliverToBoxAdapter(
            child: CustomAppBar(
              text: "Calender",
              isBack: true,
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: AppSize.height(context) * .06,
            ),
          ),
          SliverToBoxAdapter(
            child: TableCalendar(
              calendarStyle: CalendarStyle(
                todayTextStyle: Styles.textStyle10,
                tablePadding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              ),
              headerStyle: HeaderStyle(
                formatButtonVisible: false,
                titleTextStyle: Styles.textStyle18,
              ),
              firstDay: DateTime.utc(2010, 10, 16),
              lastDay: DateTime.utc(2030, 3, 14),
              focusedDay: _focusedDay,
              calendarFormat: _calendarFormat,
              selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
              onDaySelected: (selectedDay, focusedDay) {
                setState(() {
                  _selectedDay = selectedDay;
                  _focusedDay = focusedDay;
                });
                _showTaskDetails(context, selectedDay);
              },
              onFormatChanged: (format) {
                if (_calendarFormat != format) {
                  setState(() {
                    _calendarFormat = format;
                  });
                }
              },
              onPageChanged: (focusedDay) {
                _focusedDay = focusedDay;
              },
              calendarBuilders: CalendarBuilders(
                defaultBuilder: (context, day, focusedDay) {
                  bool? taskCompleted =
                      _taskStatus[DateTime.utc(day.year, day.month, day.day)];
                  if (taskCompleted != null) {
                    return GestureDetector(
                      onTap: () => _showTaskDetails(context, day),
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Container(
                            margin: const EdgeInsets.all(4.0),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: taskCompleted
                                  ? Colors.green.withOpacity(0.3)
                                  : Colors.red.withOpacity(0.3),
                            ),
                            child: Center(
                              child: Text(
                                '${day.day}',
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 2,
                            child: Icon(
                              taskCompleted ? Icons.check_circle : Icons.cancel,
                              color: taskCompleted ? Colors.green : Colors.red,
                              size: 16,
                            ),
                          ),
                        ],
                      ),
                    );
                  }
                  return null;
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
