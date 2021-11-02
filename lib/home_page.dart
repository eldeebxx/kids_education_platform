import 'package:flutter/material.dart';
import 'package:kids_education_platform/constants.dart';
import 'package:kids_education_platform/teacher_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  static String routeName = '/homePage';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kLightBlue,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.menu,
            color: Colors.black,
            size: 30,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.notifications_none,
              color: Colors.black,
              size: 30,
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.3,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/searchBg.png'),
                ),
              ),
              child: Container(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Hello,',
                      style: TextStyle(
                        fontSize: 16,
                        fontFamily: 'circe',
                      ),
                    ),
                    const Text(
                      'Muhammed',
                      style: TextStyle(
                        fontSize: 30,
                        fontFamily: 'circe',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Expanded(
                      child: Container(),
                    ),
                    Container(
                      height: 70,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        color: Colors.white,
                      ),
                      child: Row(
                        children: [
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.search,
                                color: Colors.black, size: 30),
                          ),
                          const Expanded(
                            child: TextField(
                              style: TextStyle(
                                fontSize: 18,
                                fontFamily: 'circe',
                              ),
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Search for Courses or Tutors',
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 30),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(30),
                width: MediaQuery.of(context).size.width,
                color: Colors.white,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(
                          'Top Rated Tutors',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          'See all',
                          style: TextStyle(
                            fontSize: 13,
                            color: Colors.blueAccent,
                          ),
                        ),
                      ],
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            tutorWidget('boy1Big', 'Mr. Peter Parker',
                                'English', '0-6', '150', () {
                              Navigator.pushNamed(
                                  context, TeacherPage.routeName);
                            }),
                            tutorWidget('girl', 'Ms. Leena Dey',
                                'Arts & Crafts', '0-4', '100', () {}),
                            tutorWidget('boy2', 'Mr. Jason Shrute', 'Math',
                                '0-2', '90', () {}),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  InkWell tutorWidget(String img, String name, String subj, String grade,
      String price, VoidCallback onPressed) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        margin: const EdgeInsets.only(top: 20.0),
        height: 130,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(
            Radius.circular(30.0),
          ),
          color: kLightBlue.withOpacity(0.5),
        ),
        child: Row(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(30),
                  ),
                  child: Container(
                    height: 125,
                    width: 150,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/iconBgNew.png'),
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 130,
                  padding: const EdgeInsets.only(left: 5.0, top: 5.0),
                  child: Stack(
                    children: [
                      SizedBox(
                        width: 60,
                        height: 60,
                        child: RotatedBox(
                          quarterTurns: 2,
                          child: Icon(
                            Icons.star,
                            color: kDarkBlue,
                            size: 60,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 60,
                        height: 60,
                        child: Center(
                          child: Text(
                            '4.5',
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w700,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  left: 50,
                  child: Hero(
                    tag: img,
                    child: Container(
                      width: 100,
                      height: 130,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/images/$img.png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          'GRADE $grade',
                          style: const TextStyle(
                            fontSize: 10,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 5.0),
                    Text(
                      name,
                      style: const TextStyle(
                        fontSize: 19,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text(
                      '$subj Teacher',
                      style: TextStyle(
                        fontSize: 13,
                        color: kDarkBlue,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '\$$price/session',
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
