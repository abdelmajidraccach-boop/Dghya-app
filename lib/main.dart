import 'package:flutter/material.dart';

void main() => runApp(DghyaApp());

class DghyaApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'J ARRIVE DGHYA',
      theme: ThemeData(primarySwatch: Colors.orange, fontFamily: 'Roboto'),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String from = "Casa Port";
  String to = "Ain Diab";
  double price = 45.0;
  bool searching = false;

  void searchDriver() {
    setState(() => searching = true);
    Future.delayed(Duration(seconds: 2), () {
      setState(() => searching = false);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("🚕 شيفور قريب منك - 3 دقائق - $price DH"), backgroundColor: Colors.green),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF7F7F7),
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Row(children: [
          Icon(Icons.bolt, color: Colors.orange),
          SizedBox(width: 8),
          Text("J ARRIVE DGHYA", style: TextStyle(fontWeight: FontWeight.bold)),
        ]),
        actions: [CircleAvatar(backgroundColor: Colors.orange, child: Icon(Icons.person, color: Colors.white))],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Container(
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(color: Colors.black, borderRadius: BorderRadius.circular(20)),
            child: Column(children: [
              TextField(
                decoration: InputDecoration(
                  filled: true, fillColor: Colors.white,
                  prefixIcon: Icon(Icons.my_location, color: Colors.green),
                  hintText: "منين؟", border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                ),
                onChanged: (v) => from = v,
                controller: TextEditingController(text: from),
              ),
              SizedBox(height: 12),
              TextField(
                decoration: InputDecoration(
                  filled: true, fillColor: Colors.white,
                  prefixIcon: Icon(Icons.location_on, color: Colors.red),
                  hintText: "فين غادي؟", border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                ),
                onChanged: (v) => to = v,
                controller: TextEditingController(text: to),
              ),
              SizedBox(height: 16),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.orange, padding: EdgeInsets.all(16), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),
                  onPressed: searching ? null : searchDriver,
                  child: searching 
                    ? CircularProgressIndicator(color: Colors.white)
                    : Text("دغيا - قلب على طاكسي 🚕", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white)),
                ),
              )
            ]),
          ),
          SizedBox(height: 20),
          Text("الخدمات", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          SizedBox(height: 12),
          Row(children: [
            _serviceCard(Icons.local_taxi, "طاكسي صغير", "ابتداء من 8 DH", Colors.orange),
            SizedBox(width: 12),
            _serviceCard(Icons.directions_car, "طاكسي كبير", "ابتداء من 30 DH", Colors.black),
          ]),
          SizedBox(height: 20),
          Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16), border: Border.all(color: Colors.grey.shade200)),
            child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text("الثمن المتوقع", style: TextStyle(color: Colors.grey)),
                Text("$price DH", style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
                Text("$from → $to", style: TextStyle(color: Colors.grey)),
              ]),
              Icon(Icons.bolt, size: 40, color: Colors.orange)
            ]),
          )
        ]),
      ),
    );
  }

  Widget _serviceCard(IconData icon, String title, String price, Color color) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16)),
        child: Column(children: [
          Icon(icon, color: color, size: 30),
          SizedBox(height: 8),
          Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
          Text(price, style: TextStyle(fontSize: 12, color: Colors.grey)),
        ]),
      ),
    );
  }
}
