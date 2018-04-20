import 'package:flutter/material.dart';

import 'package:flashcards_flutter/src/courses_list.dart';
import 'package:flashcards_flutter/src/custom_drawer.dart';
import 'package:flashcards_flutter/src/new_course_screen.dart';

import 'package:flashcards_common/common.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        drawer: CustomDrawer(),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            Navigator.of(context).push(
              new MaterialPageRoute(
                builder: (BuildContext context) => NewCourseScreen(),
              ),
            );
          },
        ),
        appBar: AppBar(
          actions: <Widget>[
            GestureDetector(
              child: Icon(Icons.add),
              onTap: () {
//                AppData.of(context).courseBloc.create(CourseData(name: 'from app', authorUid: AppData.of(context).authBloc.user.uid));
                Navigator.of(context).push(
                      new MaterialPageRoute(
                        builder: (BuildContext context) => NewCourseScreen(),
                      ),
                    );
              },
            ),
          ],
          title: Text('flashcards'),
          bottom: TabBar(
            tabs: [
              Tab(text: 'all'),
              Tab(text: 'created'),
              Tab(text: 'popular'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            CoursesList(CoursesQueryType.all),
            CoursesList(CoursesQueryType.created),
            CoursesList(CoursesQueryType.popular),
          ],
        ),
      ),
    );
  }
}
