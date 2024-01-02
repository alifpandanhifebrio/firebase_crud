import 'package:crud_app/service/database.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:random_string/random_string.dart';

class Employee extends StatefulWidget {
  const Employee({super.key});

  @override
  State<Employee> createState() => _EmployeeState();
}

class _EmployeeState extends State<Employee> {
  TextEditingController namecontroller = TextEditingController();
  TextEditingController agecontroller = TextEditingController();
  TextEditingController locationcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Inventory App'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(right: 20, left: 20),
            child: Column(
              children: [
                Image.asset('assets/image/create.jpg'),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Nama Barang',
                      style: GoogleFonts.montserrat(
                          fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 8.0,
                ),
                TextField(
                  controller: namecontroller,
                  decoration: InputDecoration(
                      hintText: 'Masukkan Nama Barang',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8))),
                ),
                const SizedBox(
                  height: 16.0,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Harga Barang',
                      style: GoogleFonts.montserrat(
                          fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 8.0,
                ),
                TextField(
                  controller: agecontroller,
                  decoration: InputDecoration(
                      hintText: 'Masukkan Harga Barang',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8))),
                ),
                const SizedBox(
                  height: 16.0,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Deskripsi Barang',
                      style: GoogleFonts.montserrat(
                          fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 8.0,
                ),
                TextField(
                  controller: locationcontroller,
                  decoration: InputDecoration(
                      hintText: 'Masukkan Deskripsi Barang',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8))),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                SizedBox(
                  height: 50.0,
                  width: MediaQuery.of(context).size.width,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xff1a2e35),
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    onPressed: () async {
                      String Id = randomAlphaNumeric(10);
                      Map<String, dynamic> employeeInfoMap = {
                        "Name": namecontroller.text,
                        "Age": agecontroller.text,
                        "Id": Id,
                        "location":locationcontroller.text
                      };
                      await DatabaseMethods()
                          .addEmployeeDetails(employeeInfoMap, Id)
                          .then((value) {
                        Fluttertoast.showToast(
                            msg:
                                "Employee Details has been uploaded successfully",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.CENTER,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.red,
                            textColor: Colors.white,
                            fontSize: 16.0);
                      });
                    },
                    child: const Text('Create'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
