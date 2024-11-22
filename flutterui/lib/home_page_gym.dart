import 'package:flutter/material.dart';

class home_page_gym extends StatefulWidget {
  const home_page_gym({super.key});

  @override
  State<home_page_gym> createState() => _home_page_gymState();
}

class _home_page_gymState extends State<home_page_gym> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CircleAvatar(radius: 20,backgroundImage: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT40s4G_wMJo3HvOfqhul9vml6lNIcguBaNlw&s'),),
                  Text('Amanda Warren',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.black,)),
                  Icon(Icons.notifications_none_outlined,color: Colors.black,size: 30,),
                ]
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.location_pin, color: Colors.purpleAccent,),
                  Text('Fitness Gym, New York, USA', ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Card(
                        color: Colors.white,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              children: [
                                Icon(Icons.heart_broken, color: Colors.red,),
                                Text('8')
                              ],
                            ),
                            Text('Favorite', style: TextStyle(color: Colors.black),)
                          ]
                        ),
                      ),
                      Card(
                        color: Colors.white,
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                children: [
                                  Icon(Icons.heart_broken, color: Colors.red,),
                                  Text('8')
                                ],
                              ),
                              Text('Favorite', style: TextStyle(color: Colors.black),)
                            ]
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}