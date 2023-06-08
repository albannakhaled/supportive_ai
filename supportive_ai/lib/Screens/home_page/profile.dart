import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final listNames = const ['ahmad', 'khaled', 'ali', 'sami', 'chadi'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.calendar_month),
          )
        ],
        elevation: 1,
      ),
      body: Container(
        color: Colors.purple[50],
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Welcome',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w400),
            ),
            const Text(
              'Doctor name',
              style: TextStyle(fontSize: 29, fontWeight: FontWeight.w600),
            ),
            Card(
              elevation: 7,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(19)),
              clipBehavior: Clip.hardEdge,
              child: Column(
                children: [
                  Container(
                    color: Colors.purple,
                    padding: const EdgeInsets.all(16),
                    child: const Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Appointement request'),
                            Icon(Icons.more_vert)
                          ],
                        ),
                        SizedBox(height: 3),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Icon(Icons.watch_later),
                            Text('9 Jan 2023  ,  8 am - 11 am'),
                          ],
                        ),
                      ],
                    ),
                  ),
                  ListTile(
                    leading: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Icon(Icons.person, size: 30),
                    ),
                    title: const Text(
                      "First Name",
                      style: TextStyle(fontSize: 12),
                    ),
                    subtitle: const Text(
                      "Last Name",
                      style: TextStyle(fontSize: 16, color: Colors.black),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      TextButton(
                        onPressed: () {},
                        style: TextButton.styleFrom(
                            fixedSize: Size(80, 40),
                            backgroundColor: Colors.purple[500]),
                        child: const Text(
                          "Accept",
                          style: TextStyle(fontSize: 15, color: Colors.white),
                        ),
                      ),
                      TextButton(
                        onPressed: () {},
                        style: TextButton.styleFrom(
                            fixedSize: Size(80, 40),
                            backgroundColor: Colors.grey[500]),
                        child: const Text(
                          "Decline",
                          style: TextStyle(fontSize: 15, color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                ],
              ),
            ),
            const SizedBox(height: 12),
            const Text(
              'Next Appointments',
              style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                  fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 8),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Colors.white70,
              ),
              height: 300,
              child: ListView.builder(
                itemCount: listNames.length,
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(19)),
                    clipBehavior: Clip.hardEdge,
                    child: ListTile(
                      leading: const CircleAvatar(
                        backgroundColor: Colors.grey,
                        radius: 25,
                        child: Text(
                          "AA",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      title: Text(
                        listNames[index],
                        style: const TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w500),
                      ),
                      subtitle: const Text('9 Jan 2023  ,  8 am - 11 am'),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
