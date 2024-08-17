import 'dart:io';

// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
// import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';

//tambahkan import image gallery saver
import 'dart:typed_data';
import 'dart:ui' as ui;
// import 'package:dio/dio.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
// import 'package:path_provider/path_provider.dart';

class HomePageImage extends StatefulWidget {
  const HomePageImage({super.key});

  @override
  State<HomePageImage> createState() => _HomePageImageState();
}

class _HomePageImageState extends State<HomePageImage> {
//konfigurasi image picker
  final ImagePicker picker = ImagePicker(); //library picker
//variabel photo dari image picker
  XFile? photo;

  //tambahkan variabel global key untuk image picker
  final GlobalKey _globalKey = GlobalKey();

  //Konfigurasi kodingan image gallery saver
  _saveLocalImage() async {
    RenderRepaintBoundary boundary =
        _globalKey.currentContext!.findRenderObject() as RenderRepaintBoundary;
    ui.Image image = await boundary.toImage();
    ByteData? byteData =
        await (image.toByteData(format: ui.ImageByteFormat.png));
    if (byteData != null) {
      final result =
          await ImageGallerySaver.saveImage(byteData.buffer.asUint8List());
      print(result);
      // Utils.toast(result.toString());
      //utils dialog diganti dengan SnackBar
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('save successfully')));
    }
  }

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
        //diatas container tambahkan widget column dan crossAxisAlignment (posisi)
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            //agar posisi gambar dan tombol ditengah maka diatas container tambahan widget row dan mainAxisAlignment (posisi)
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //tambahkan key global key untuk image picker
              RepaintBoundary(
                key: _globalKey,
                child: Container(
                  alignment: Alignment.center,
                  // width: 300,
                  height: 300,
                  color: Colors.blue,
                  // tambahkan child image picker
                  child: photo == null
                    ? const SizedBox()
                    : Image.file(File(photo!.path)),
                ),
              ),

              //Container image picker tanpa key global
              // Container(
              //   height: 300,
              //   color: Colors.green,
              //   //tambahkan child hasil image picker
              //   child: photo == null
              //       ? const SizedBox()
              //       : Image.file(File(photo!.path)),
              // ),
            ],
          ),
          const SizedBox(
            height: 16,
          ),
          ElevatedButton(
            onPressed: () {
              //Menghubungkan proses save_image ke tombol save_image
              _saveLocalImage();
            },
            child: const Text(
              'Save to Gallery',
              style: TextStyle(color: Colors.blue),
            ),
          )
        ],
      ),
      //tambahkan action button kamera
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue[800], //tambah background biru
        onPressed: () async {
          //tambahkan async jika ada await
          //tambahkan image picker packages
          photo = await picker.pickImage(source: ImageSource.camera);
          //tambahkan setState jika ingin menampilkan gambar
          setState(() {});
        },
        //tambahkan child icon kamera
        child: const Icon(
          Icons.camera,
          color: Colors.white,
        ),
      ),
    );
  }
}
