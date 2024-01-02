import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crud_app/pages/emloyee.dart';
import 'package:crud_app/service/database.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Stream? EmployeeStream;

  getontheload() async {
    EmployeeStream = await DatabaseMethods().getEmployeeDetails();
    setState(() {});
  }

  @override
  void initState() {
    getontheload();
    super.initState();
  }

  Widget allEmployeeDetails() {
    return StreamBuilder(
        stream: EmployeeStream,
        builder: (context, AsyncSnapshot snapshot) {
          return snapshot.hasData
              ? ListView.builder(
                  itemCount: snapshot.data.docs.length,
                  itemBuilder: (context, index) {
                    DocumentSnapshot ds = snapshot.data.docs[index];
                    return Material(
                      elevation: 5,
                      borderRadius: BorderRadius.circular(10),
                      child: Container(
                        padding: const EdgeInsets.all(15),
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Name : " + ds["Name"],
                              style: GoogleFonts.montserrat(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blue),
                            ),
                            Text(
                              "Age : " + ds["Age"],
                              style: GoogleFonts.montserrat(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blue),
                            ),
                            Text(
                              "Location : " + ds["location"],
                              style: GoogleFonts.montserrat(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blue),
                            )
                          ],
                        ),
                      ),
                    );
                  })
              : Container();
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const Employee(),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
      appBar: AppBar(
        title: const Text('Inventory App'),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.only(right: 15, left: 15),
          child: Column(
            children: [Expanded(child: allEmployeeDetails())],
          ),
        ),
      ),
    );
  }
}
