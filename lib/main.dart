import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(app());
}

class app  extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: home()
    );
  }
}

class home extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    final menyesuakaian = MediaQuery.of(context).size.height;
    final kirikekanan = MediaQuery.of(context).size.width;
    final AppBar atas= AppBar(
      centerTitle: true,
      backgroundColor: Colors.blue,
      title: Text(
        "Media Query",
        style: TextStyle(
          color: Colors.white
        ),
      ),
    );
    final lastbody = menyesuakaian - atas.preferredSize.height - MediaQuery.of(context).padding.top;
    final bool manjang = MediaQuery.of(context).orientation == Orientation.landscape;
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: atas,
      body: Center(
            child: (manjang ?
            Column(
              children: [
                Container(
                    height: lastbody *0.5 ,
                    width: kirikekanan,
                    color: Colors.red,
                    child: Center(
                      child: Container(
                        // padding: EdgeInsets.all(20),
                        height: 150,
                        width: 200,
                        color: Colors.purple,
                      ),
                    )
                ),
                // SizedBox(height: 20,),
                Container(
                    height: lastbody * 0.5,
                    color: Colors.blue,
                    child: ListView.builder(
                        itemCount: 100,
                        itemBuilder: (context, index) {
                          return ListTile(
                            leading: Container(
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                    image: AssetImage("images/Screenshot_20210418-055621_Growtopia.jpg"),
                                    fit: BoxFit.cover,
                                    alignment: Alignment.center,
                                  )
                              ),
                            ),
                          );
                        }
                    )
                )
              ],
            )
                :
            Column(
              children: [
                Container(
                    height: lastbody *0.3 ,
                    width: kirikekanan,
                    color: Colors.red,
                    child: Center(
                      child: Container(
                        // padding: EdgeInsets.all(20),
                        height: 150,
                        width: 200,
                        color: Colors.purple,
                      ),
                    )
                ),
                // SizedBox(height: 20,),
                Container(
                    height: lastbody * 0.7,
                    color: Colors.blue,
                    child: ListView.builder(
                        itemCount: 100,
                        itemBuilder: (context, index) {
                          return ListTile(
                            leading: Container(
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                    image: AssetImage("images/Screenshot_20210418-055621_Growtopia.jpg"),
                                    fit: BoxFit.cover,
                                    alignment: Alignment.center,
                                  )
                              ),
                            ),
                          );
                        }
                    )
                )
              ],
            )
            )
          )
    );
  }
}