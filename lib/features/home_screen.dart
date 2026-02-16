import 'package:ebook_app/features/app_colors.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.background,
      child: SafeArea(
        child: Scaffold(
          body: Column(
            children: [
              Container(
                margin: EdgeInsets.only(left: 20, right: 20, top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ImageIcon(
                      AssetImage('assets/img/menu.png'),
                      size: 24,
                      color: Colors.black,
                    ),

                    Row(
                      children: [
                        Icon(Icons.search),
                        SizedBox(width: 10),
                        Icon(Icons.notifications),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Container(
                    margin: const EdgeInsets.only(
                      left: 20,
                      top: 20,
                      bottom: 20,
                    ),
                    child: Text(
                      'Popular Books',
                      style: TextStyle(fontSize: 30),
                    ),
                  ),
                ],
              ),

              SizedBox(height: 10),
              Container(
                margin: EdgeInsets.only(left: 20),
                height: 180,
                child: PageView.builder(
                  itemCount: 4,
                  padEnds: false,
                  controller: PageController(
                    initialPage: 0,
                    viewportFraction: 0.8,
                  ),
                  itemBuilder: (context, index) {
                    return Container(
                      height: 180,
                      margin: const EdgeInsets.only(right: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        image: DecorationImage(
                          fit: BoxFit.fill,
                          image: AssetImage('assets/img/amar-bangla-boi.jpg'),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
