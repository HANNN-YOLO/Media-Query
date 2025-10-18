// import 'package:flutter/material.dart';

// void main() {
//   runApp(app());
// }

// class app extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(debugShowCheckedModeBanner: false, home: home());
//   }
// }

// class home extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     final menyesuakaian = MediaQuery.of(context).size.height;
//     final kirikekanan = MediaQuery.of(context).size.width;
//     final AppBar atas = AppBar(
//       centerTitle: true,
//       backgroundColor: Colors.blue,
//       title: Text(
//         "Media Query",
//         style: TextStyle(color: Colors.white),
//       ),
//     );
//     final lastbody = menyesuakaian -
//         atas.preferredSize.height -
//         MediaQuery.of(context).padding.top;

//     final bool manjang =
//         MediaQuery.of(context).orientation == Orientation.landscape;
//     return Scaffold(
//         backgroundColor: Colors.grey,
//         appBar: atas,
//         body: Center(
//             child: (manjang
//                 ? Column(
//                     children: [
//                       Container(
//                           height: lastbody * 0.5,
//                           width: kirikekanan,
//                           color: Colors.red,
//                           child: Center(
//                             child: Container(
//                               // padding: EdgeInsets.all(20),
//                               height: 150,
//                               width: 200,
//                               color: Colors.purple,
//                             ),
//                           )),
//                       // SizedBox(height: 20,),
//                       Container(
//                           height: lastbody * 0.5,
//                           color: Colors.blue,
//                           child: ListView.builder(
//                               itemCount: 100,
//                               itemBuilder: (context, index) {
//                                 return ListTile(
//                                   leading: Container(
//                                     width: 50,
//                                     height: 50,
//                                     decoration: BoxDecoration(
//                                         shape: BoxShape.circle,
//                                         image: DecorationImage(
//                                           image: AssetImage(
//                                               "images/Screenshot_20210418-055621_Growtopia.jpg"),
//                                           fit: BoxFit.cover,
//                                           alignment: Alignment.center,
//                                         )),
//                                   ),
//                                 );
//                               }))
//                     ],
//                   )
//                 : Column(
//                     children: [
//                       Container(
//                           height: lastbody * 0.3,
//                           width: kirikekanan,
//                           color: Colors.red,
//                           child: Center(
//                             child: Container(
//                               // padding: EdgeInsets.all(20),
//                               height: 150,
//                               width: 200,
//                               color: Colors.purple,
//                             ),
//                           )),
//                       // SizedBox(height: 20,),
//                       Container(
//                           height: lastbody * 0.7,
//                           color: Colors.blue,
//                           child: ListView.builder(
//                               itemCount: 100,
//                               itemBuilder: (context, index) {
//                                 return ListTile(
//                                   leading: Container(
//                                     width: 50,
//                                     height: 50,
//                                     decoration: BoxDecoration(
//                                         shape: BoxShape.circle,
//                                         image: DecorationImage(
//                                           image: AssetImage(
//                                               "images/Screenshot_20210418-055621_Growtopia.jpg"),
//                                           fit: BoxFit.cover,
//                                           alignment: Alignment.center,
//                                         )),
//                                   ),
//                                 );
//                               }))
//                     ],
//                   ))));
//   }
// }

import 'package:flutter/material.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final tinggiLayar = MediaQuery.of(context).size.height;
    final lebarLayar = MediaQuery.of(context).size.width;

    final AppBar appBar = AppBar(
      centerTitle: true,
      backgroundColor: Colors.blue,
      title: const Text(
        "Media Query Adaptif",
        style: TextStyle(color: Colors.white),
      ),
    );

    final tinggiBody = tinggiLayar -
        appBar.preferredSize.height -
        MediaQuery.of(context).padding.top;

    // Tentukan breakpoint
    String kategori;
    if (lebarLayar < 600) {
      kategori = "mobile";
    } else if (lebarLayar < 1200) {
      kategori = "tablet";
    } else {
      kategori = "desktop";
    }

    // Warna tiap kategori biar kelihatan perbedaannya
    Color warnaAtas, warnaBawah;
    double proporsiAtas;
    switch (kategori) {
      case "mobile":
        warnaAtas = Colors.red;
        warnaBawah = Colors.blue;
        proporsiAtas = 0.3;
        break;
      case "tablet":
        warnaAtas = Colors.green;
        warnaBawah = Colors.orange;
        proporsiAtas = 0.4;
        break;
      case "desktop":
        warnaAtas = Colors.purple;
        warnaBawah = Colors.teal;
        proporsiAtas = 0.5;
        break;
      default:
        warnaAtas = Colors.red;
        warnaBawah = Colors.blue;
        proporsiAtas = 0.3;
    }

    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: appBar,
      body: Column(
        children: [
          // Bagian atas menyesuaikan ukuran layar
          Container(
            height: tinggiBody * proporsiAtas,
            width: lebarLayar,
            color: warnaAtas,
            child: Center(
              child: Text(
                kategori.toUpperCase(),
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),

          // Bagian bawah dengan ListView
          Container(
            height: tinggiBody * (1 - proporsiAtas),
            color: warnaBawah,
            child: ListView.builder(
              itemCount: 20,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(
                    "$kategori item ke-$index",
                    style: const TextStyle(color: Colors.white),
                  ),
                  leading: Container(
                    width: 50,
                    height: 50,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                    ),
                    child: const Icon(Icons.person, color: Colors.black),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
