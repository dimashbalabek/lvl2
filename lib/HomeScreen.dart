import 'package:flutter/material.dart';
import 'package:flutter_lvl2_preperation/InfoPage.dart';
import 'package:flutter_lvl2_preperation/data.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber[900],
        actions: [Icon(Icons.notifications_on)],
        leading: Icon(Icons.search),
        centerTitle: true,
        title: Text("Korea - GoYang", style: TextStyle(color: Colors.black),),
      ),
      body: Center(
        child: Column(
          children: [
            Image.asset("assets/s.jpg", height: 160,),
            Container(
              color: Colors.black26,
              height: 120,
              child: Expanded(
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: datas1.length,
                  itemBuilder: (context, index) {
                    return product_info_box(index, datas1, context);
                  },
                )),
            ),
            SizedBox(height: 20,),
            Container(
              color: Colors.black26,
              height: 120,
              child: Expanded(
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: datas2.length,
                  itemBuilder: (context, index) {
                    return product_info_box(index, datas2, context);
                  },
                ),
                ),
            ),
            Container(
              height: 120,
              child: Expanded(
                child: ListView.builder(

                  scrollDirection: Axis.horizontal,
                  itemCount: datas3.length,
                  itemBuilder: (context, index) {
                    return product_info_box(index, datas3, context);
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}



Widget  product_info_box(int index, List data_type, context){
  return GestureDetector(
    onTap: () {
      Navigator.push(context, MaterialPageRoute(builder: (BuildContext context){return InfoPage(data: data_type[index],);}));
    },
    child: Container(
      decoration: BoxDecoration(
        boxShadow: [BoxShadow(
          color: Color.fromARGB(255, 29, 29, 29),
          blurRadius: 3,)],
          color: Colors.white
      ),
      margin: EdgeInsets.only(right: 30, left: 30),
      width: 200,
      child: Column(
        children: [
          Text(data_type[index].name),
          Image.asset(data_type[index].img, width: 30,),
          Text(data_type[index].text),
          Text(data_type[index].price)
        ],
      ),
    ),
  );
}