import 'package:flutter/material.dart';

class YouTubeGridView extends StatelessWidget {
  final List<String> videoLinks = [
    'https://www.youtube.com/watch?v=PJc_iEkcnFo',
    'https://www.youtube.com/watch?v=VIDEO_ID_2',
    'https://www.youtube.com/watch?v=VIDEO_ID_3',
    // Add more video links here
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('YouTube Grid View'),
        ),
        body: GridView.count(
          crossAxisCount: 2, // Number of columns in the grid
          padding: EdgeInsets.all(16),
          childAspectRatio: 1.0, // Width to height ratio of each item
          mainAxisSpacing: 16,
          crossAxisSpacing: 16,
          children: List.generate(videoLinks.length, (index) {
            return Container(
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(30),
              ),
              child: InkWell(
                onTap: () {
                  videoLinks[index];
                  // Handle tap event, e.g., open the YouTube video link
                  print('Opening video link: ${videoLinks[index]}');
                },
                child: Center(
                  child: Text(
                    'Video ${index + 1}',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
