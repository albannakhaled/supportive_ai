import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String ?selectedDoctor;
  List<String> doctors = ['Doctor A', 'Doctor B', 'Doctor C']; // Replace with your own list of doctors

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Patient Profile'),
        backgroundColor: Colors.purple,
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Choose a Doctor:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.purple),
            ),
            SizedBox(height: 8),
            DropdownButton(
              value: selectedDoctor,
              items: doctors.map((doctor) {
                return DropdownMenuItem(
                  value: doctor,
                  child: Text(doctor),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  selectedDoctor = value!;
                });
              },
              style: TextStyle(color: Colors.purple),
              dropdownColor: Colors.purple.withOpacity(0.8),
            ),
            SizedBox(height: 16),
            Text(
              'Patient Information:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.purple),
            ),
            SizedBox(height: 8),
            Text(
              'Name: John',
              style: TextStyle(fontSize: 14, color: Colors.purple),
            ),
            Text(
              'Last Name: Doe',
              style: TextStyle(fontSize: 14, color: Colors.purple),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: ProfileScreen(),
    theme: ThemeData(primaryColor: Colors.purple),
  ));
}
