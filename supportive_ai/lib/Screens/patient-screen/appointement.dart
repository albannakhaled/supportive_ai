import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../services/sharespref.dart';
import '../../widget/button.dart';

class AppointmentScreen extends StatefulWidget {
  const AppointmentScreen({super.key});

  @override
  _AppointmentScreenState createState() => _AppointmentScreenState();
}

class _AppointmentScreenState extends State<AppointmentScreen> {
  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay.now();
  bool isAppointmentSubmitted = false;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 30)),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: selectedTime,
    );
    if (picked != null && picked != selectedTime) {
      setState(() {
        selectedTime = picked;
      });
    }
  }

  void _submitAppointment() {
    setState(() {
      isAppointmentSubmitted = true;
    });
  }

  String _formatSelectedDate() {
    final DateFormat formatter = DateFormat('yyyy-MM-dd');
    return formatter.format(selectedDate);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.purple,
        title: const Text(
          'Make an Appointment',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: isAppointmentSubmitted
            ? Center(
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12)),
                    ),
                    const Text(
                      "You Choose this Date",
                      style: TextStyle(fontSize: 18),
                    ),
                    _buildAppointmentCard(),
                    const SizedBox(height: 20),
                    MyButton(
                        onPressed: () {
                          Navigator.popAndPushNamed(context, 'home');
                        },
                        child: const Text('Done')),
                  ],
                ),
              )
            : _buildAppointmentForm(),
      ),
    );
  }

  Widget _buildAppointmentCard() {
    return Card(
      elevation: 10,
      margin: const EdgeInsets.all(10),
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              '${DateFormat('dd MMM yyyy').format(selectedDate)}  ,  ${selectedTime.format(context)}',
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAppointmentForm() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        ElevatedButton(
          onPressed: () => _selectDate(context),
          child: const Text('Select Date'),
        ),
        const SizedBox(height: 16.0),
        Text(
          'Selected Date: ${_formatSelectedDate()}',
          style: const TextStyle(fontSize: 16.0),
        ),
        const SizedBox(height: 32.0),
        ElevatedButton(
          onPressed: () => _selectTime(context),
          child: const Text('Select Time'),
        ),
        const SizedBox(height: 16.0),
        Text(
          'Selected Time: ${selectedTime.format(context)}',
          style: const TextStyle(fontSize: 16.0),
        ),
        const SizedBox(height: 32.0),
        ElevatedButton(
          onPressed: _submitAppointment,
          child: const Text('Submit Appointment'),
        ),
        SizedBox(
          height: 340,
        ),
        ElevatedButton(
          onPressed: () {
            MySharedPreferences.saveToken('');
            Navigator.pushReplacementNamed(context, 'sign-in/');
          },
          style: const ButtonStyle(),
          child: const Text(
            'Logout',
            style: TextStyle(
                fontSize: 16, fontWeight: FontWeight.w600, letterSpacing: 1.5),
          ),
        ),
      ],
    );
  }
}
