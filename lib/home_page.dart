import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    // return const Placeholder();
    //Ganti dengan Scaffold agar tidak hitam silang
    return Scaffold(
      //Didalam scaffold tambahkan appbar
      appBar: AppBar(
        centerTitle: true, //judul berada di tengah
        title: const Text(
          "Flutter Basic Image",
          style: TextStyle(
              color: Colors.white,
              fontWeight:
                  FontWeight.bold), //tambahkan style warna huruf dan tebal
        ),
        elevation: 3, //ada bayang-bayang warna
        backgroundColor: Colors.blue[800], //tambah warna background biru
        //tambahkan icon action di appbar
        actions: const [
          Icon(Icons.person, color: Colors.white),
          SizedBox(width: 8), //beri jarak antar ikon
          Icon(Icons.settings, color: Colors.white),
          SizedBox(width: 16), //beri jarak antar ikon
        ],
        //tambahkan icon menu di appbar
        leading: const Icon(Icons.menu, color: Colors.white),
      ),

      //tambahkan body container
      body: Column(
        children: [
          Container(
            // margin: const EdgeInsets.all(30), //bisa juga tambah margin untuk batas tepi/pagar
            padding:
                const EdgeInsets.all(16), //jarak antara tepi dengan isi konten
            width: 300,
            height: 300,
            //jika ada decoration maka colors harus berada didalamnya jika tidak maka error
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(20),
            ),
            // child: const Text("Hello World"),
            child: Image.network(
              //atau bisa menampilkan foto
              "https://images.unsplash.com/photo-1484517586036-ed3db9e3749e?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80",
              // width: 200.0,
              // height: 200.0,
              // fit: BoxFit.cover,
            ),
          ),
          Image.asset('assets/images/img1.jpg'), //tampilkan foto dari assets
          const CircleAvatar(
            radius: 50,
            backgroundImage: NetworkImage("https://picsum.photos/200/300"),
          )
        ],
      ),
    );
  }
}
