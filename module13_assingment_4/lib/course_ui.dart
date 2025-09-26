import 'package:flutter/material.dart';
import 'card_edit.dart';

class CourseUI extends StatelessWidget {
  const CourseUI({super.key});

  @override
  Widget build(BuildContext context) {
    // Dummy data list
    final courses = [
      {
        "image": "https://cdn.ostad.app/course/cover/2024-12-17T11-35-19.890Z-Course%20Thumbnail%2012.jpg", // Replace with real image link
        "title": "Full Stack Web Development with JavaScript (MERN)",
        "tags": ["ব্যাচ ১১", "৬ সিট বাকি", "৬ দিন বাকি"],
      },
      {
        "image": "https://cdn.ostad.app/course/cover/2024-12-19T15-48-52.487Z-Full-Stack-Web-Development-with-Python,-Django-&-React.jpg",
        "title": "Full Stack Web Development with Python, Django & React",
        "tags": ["ব্যাচ ৬", "৮৬ সিট বাকি", "৪০ দিন বাকি"],
      },
      {
        "image": "https://cdn.ostad.app/course/cover/2024-12-18T15-29-34.261Z-Untitled-1%20(23).jpg",
        "title": "Full Stack Web Development with ASP.Net Core",
        "tags": ["ব্যাচ ৭", "৭৫ সিট বাকি", "৩৯ দিন বাকি"],
      },
      {
        "image": "https://cdn.ostad.app/course/cover/2024-12-18T15-24-44.114Z-Untitled-1%20(21).jpg",
        "title": "SQA: Manual & Automated Testing",
        "tags": ["ব্যাচ ১৩", "৬৫ সিট বাকি", "৪১ দিন বাকি"],
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text(
            "Courses",
          style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.blue,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // 2 cards in a row
            crossAxisSpacing: 6,
            mainAxisSpacing: 6,
            childAspectRatio: 0.7, // Adjust height ratio
          ),
          itemCount: courses.length,
            itemBuilder: (context, index) {
              final course = courses[index] as Map<String, dynamic>;

              return CourseCard(
                image: course["image"] as String,
                title: course["title"] as String,
                tags: List<String>.from(course["tags"] as List),
              );
            }

        ),
      ),
    );
  }
}