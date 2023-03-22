
import 'package:flutter/material.dart';
import 'package:initial_project/components/detail_screen.dart';
import 'package:initial_project/model/foods.dart';

class MainScreen extends StatelessWidget{
  const MainScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext ctx) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('KULINER INDONESIA'),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          final Food food = foods[index];
          return InkWell(
             onTap: () {
                  Navigator.push(ctx, MaterialPageRoute(builder: (context) {
                  return DetailScreen(food: food);
              }));
            },
            child: listItem(food),
        );
      },
        itemCount: foods.length,
      ),
    );
  }

  Widget listItem(Food food) {
    return Card(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
                flex: 1,
                child: SizedBox(
                  child: Image.asset(
                          food.imagePath[0],
                          height: 50.0,
                          width: 50.0,
                        ),
                ) 
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Text(
                      food.name,
                      style: TextStyle(
                        fontSize: 12.0,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      food.location,
                      style: TextStyle(
                         fontSize: 10.0,
                         fontFamily: 'poppins',
                      ),
                    ),
                    Text(
                      'Rp ${food.price}',
                      style: TextStyle(
                         fontSize: 10.0,
                         fontFamily: 'poppins',
                         fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              )
            ),
          ],
        ),
    );
  }
}