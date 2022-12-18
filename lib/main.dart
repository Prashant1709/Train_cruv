import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Seat Selector',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Seat Selector'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<dynamic> temp = [[1,2,3,7],[4,5,6,8],[9,10,11,15],[12,13,14,16],[17,18,19,23],[20,21,22,24],
    [25,26,27,31],[28,29,30,32],[33,34,35,39],[36,37,38,40],[41,42,43,47],
    [44,45,46,48],[49,50,51,55],[52,53,54,56],[57,58,59,63],[60,61,62,64]
  ];
  bool seat=false;
  int seatcol=0,seatrow=0;
  void berth_type(int s)
  {
    if (s > 0 && s < 73)
      // ignore: curly_braces_in_flow_control_structures
      if (s % 8 == 1 ||s % 8 == 4) {
        Fluttertoast.showToast(msg: "$s is lower berth",textColor: Colors.white,fontSize: 20,gravity: ToastGravity.CENTER,backgroundColor: Color.fromRGBO(145, 201, 255, 1));
      } else {
        if (s % 8 == 2 || s % 8 == 5) {
          Fluttertoast.showToast(msg: "$s is middle berth",textColor: Colors.white,fontSize: 20,gravity: ToastGravity.CENTER,backgroundColor: Color.fromRGBO(145, 201, 255, 1));
        } else if(s % 8 == 3 ||s % 8 == 6) {
        Fluttertoast.showToast(msg: "$s is upper berth",textColor: Colors.white,fontSize: 20,gravity: ToastGravity.CENTER,backgroundColor: Color.fromRGBO(145, 201, 255, 1));
      } else if(s % 8 == 7) {
        Fluttertoast.showToast(msg: "$s is side lower berth",textColor: Colors.white,fontSize: 20,gravity: ToastGravity.CENTER,backgroundColor: Color.fromRGBO(145, 201, 255, 1));
      } else {
        Fluttertoast.showToast(msg: "$s is side upper berth",textColor: Colors.white,fontSize: 20,gravity: ToastGravity.CENTER,backgroundColor: Color.fromRGBO(145, 201, 255, 1));
      }
      }
    else {
      Fluttertoast.showToast(msg: "Invalid seat number");
    }
    for(int i=0;i<16;i++){
      for(int j=0;j<4;j++){
        if(s==temp[i][j]){
          print(i);
          setState(() {
            seatcol=i;
            seat=true;
            seatrow=j;
          });
        }
      }
    }
  }
  final _textDeviceController = TextEditingController();
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text("Seat Finder",style: GoogleFonts.sora(color: Color.fromRGBO(145, 201, 255, 1),fontSize: 24),),
      ),
      body:Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: MediaQuery.of(context).size.height*0.03,),
            SizedBox(width: MediaQuery.of(context).size.width*0.9,
              child: Row(mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                      height: MediaQuery.of(context).size.height*0.053,
                      decoration: BoxDecoration(
                          borderRadius:const BorderRadius.only(
                              bottomLeft: Radius.circular(10.0),
                              topLeft: Radius.circular(10.0)),
                          color: Colors.transparent,
                          border: Border.all(color: Color.fromRGBO(145, 201, 255, 1),width: 2)
                      ),

                      // height: 60,
                      width: MediaQuery.of(context).size.width*0.7,
                      padding:const EdgeInsets.only(left: 10),
                      child: TextFormField(
                        controller: _textDeviceController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          hintText: "Enter Seat Number...",
                          hintStyle:
                          TextStyle(fontSize: 14, color: Color.fromRGBO(145, 201, 255, 1)),
                        ),
                        style:const TextStyle(fontSize: 14, color: Colors.grey),
                      )),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(10.0),
                              bottomRight: Radius.circular(10.0)),
                        ), backgroundColor: Colors.grey.shade300,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 11),
                        // minimumSize: Size(50,20 ),
                      ),
                      child: Text("Find",style: GoogleFonts.sora(color: Colors.white),),
                      onPressed: () async {
                        String seatId = _textDeviceController.text;
                        int seat=int.parse(seatId);
                        berth_type(seat);
                        setState(() {
                          
                        });
                      })
                ],
              ),
            ),
            Center(child: Text("<--Washrooms-->",style: GoogleFonts.sora(color: Color.fromRGBO(145, 201, 255, 1),fontSize: 20),),),
            SingleChildScrollView(
              child: SizedBox(height: MediaQuery.of(context).size.height*0.69,
                child: ListView.builder(itemCount: temp.length,
                    itemBuilder:(context,index){
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Card(
                              color: Color.fromRGBO(145, 201, 255, 1),
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(2.0),
                                    child: Container(color: (seat==true&&seatcol==index&&seatrow==0)?Colors.white:Color.fromRGBO(211, 233, 255, 1),
                                    height: 40,width: 40,
                                    child: Center(child: Column(
                                      children: [
                                        Text(temp[index][0].toString(),style: GoogleFonts.sora(color: Color.fromRGBO(36, 147, 254, 1),fontSize: 24),),
                                      (temp[index][0]%8==1||temp[index][0]%8==4)?Text("Lower",style: GoogleFonts.sora(color: Color.fromRGBO(36, 147, 254, 1),fontSize: 7),):((temp[index][0]%8==2||temp[index][0]%8==5)?Text("Middle",style: GoogleFonts.sora(color: Color.fromRGBO(36, 147, 254, 1),fontSize: 7),):((temp[index][0]%8==3||temp[index][0]%8==6)?Text("Upper",style: GoogleFonts.sora(color: Color.fromRGBO(36, 147, 254, 1),fontSize: 7),):Text("Wrong")))
                                      ],
                                    )),),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(2.0),
                                    child: Container(color: (seat==true&&seatcol==index&&seatrow==1)?Colors.white:Color.fromRGBO(211, 233, 255, 1),
                                      height: 40,width: 40,
                                      child: Center(child: Column(
                                        children: [
                                          Text(temp[index][1].toString(),style: GoogleFonts.sora(color: Color.fromRGBO(36, 147, 254, 1),fontSize: 24),),
                                        (temp[index][1]%8==1||temp[index][1]%8==4)?Text("Lower",style: GoogleFonts.sora(color: Color.fromRGBO(36, 147, 254, 1),fontSize: 7),):((temp[index][1]%8==2||temp[index][1]%8==5)?Text("Middle",style: GoogleFonts.sora(color: Color.fromRGBO(36, 147, 254, 1),fontSize: 7),):((temp[index][1]%8==3||temp[index][1]%8==6)?Text("Upper",style: GoogleFonts.sora(color: Color.fromRGBO(36, 147, 254, 1),fontSize: 7),):Text("Wrong")))
                                        ],
                                      )),),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(2.0),
                                    child: Container(color:(seat==true&&seatcol==index&&seatrow==2)?Colors.white:Color.fromRGBO(211, 233, 255, 1),
                                      height: 40,width: 40,
                                      child: Center(child: Column(
                                        children: [
                                          Text(temp[index][2].toString(),style: GoogleFonts.sora(color: Color.fromRGBO(36, 147, 254, 1),fontSize: 24),),
                                        (temp[index][2]%8==1||temp[index][2]%8==4)?Text("Lower",style: GoogleFonts.sora(color: Color.fromRGBO(36, 147, 254, 1),fontSize: 7),):((temp[index][2]%8==2||temp[index][2]%8==5)?Text("Middle",style: GoogleFonts.sora(color: Color.fromRGBO(36, 147, 254, 1),fontSize: 7),):((temp[index][2]%8==3||temp[index][2]%8==6)?Text("Upper",style: GoogleFonts.sora(color: Color.fromRGBO(36, 147, 254, 1),fontSize: 7),):Text("Wrong")))
                                        ],
                                      )),),
                                  ),
                                ],
                              ),
                            ),

                            SizedBox(width: MediaQuery.of(context).size.width*0.4,),
                            Card(
                              color: Color.fromRGBO(145, 201, 255, 1),
                              child: Padding(
                                padding: const EdgeInsets.all(2.0),
                                child: Container(color: (seat==true&&seatcol==index&&seatrow==3)?Colors.white:Color.fromRGBO(211, 233, 255, 1),
                                  height: 45,width: 45,
                                  child: Center(child: Column(
                                    children: [
                                      Text(temp[index][3].toString(),style: GoogleFonts.sora(color: Color.fromRGBO(36, 147, 254, 1),fontSize: 24),),
                                      temp[index][3]%8==7?Text("Side Lower",style: GoogleFonts.sora(color: Color.fromRGBO(36, 147, 254, 1),fontSize: 7),):Text("Side Upper",style: GoogleFonts.sora(color: Color.fromRGBO(36, 147, 254, 1),fontSize: 7),)
                                    ],
                                  )),),
                              ),
                            ),
                          ],
                        ),
                        temp[index][3]%8!=7?Divider(color: Colors.grey,):Divider(color: Colors.transparent,)
                      ],
                    ),
                  );
                }),
              ),
            ),
            Center(child: Text("<--Washrooms-->",style: GoogleFonts.sora(color: Color.fromRGBO(145, 201, 255, 1),fontSize: 20),),),
          ],
        ),
      ),
    );
  }
}
