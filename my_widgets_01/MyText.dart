import 'package:flutter/material.dart';

class MyText extends StatelessWidget {
  const MyText({super.key});

  @override
  Widget build(BuildContext context) {
    // Trả về Scaffold - widget cung cấp bố cục Material Design cơ bản
    // Màn hình
    return Scaffold(
      // Tiêu đề của ứng dụng
      appBar: AppBar(
        //Tiêu đề
        title: Text("App 02"),
        //màu nền
        backgroundColor: Colors.deepOrangeAccent,
        // Độ nắng/ đổ bóng của Appbar
        elevation: 4,
        actions: [
          IconButton(
            onPressed: () {
              print("b1");
            },
            icon: Icon(Icons.search),
          ),
          IconButton(
            onPressed: () {
              print("b2");
            },
            icon: Icon(Icons.abc),
          ),
          IconButton(
            onPressed: () {
              print("b3");
            },
            icon: Icon(Icons.more_vert),
          ),
        ],
      ),

      //backgroundColor: Colors.cyanAccent,
      body: Center(child: Column(
        children: [
          // Tạo khoảng cch
          const SizedBox(height: 50,),
          // text cơ bản
          const Text("Hoang Minh Quan"),
          const SizedBox(height: 20,),

          const Text(
            "Xin chao cac ban dang hoc lap trinh Flutter!",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Colors.cyan,
              letterSpacing: 1.5,
            ),
          ),

          const SizedBox(height: 20,),
          const Text(
            "Từ nay anh mất em rồi, lặng nhìn chiếc bóng đơn côi",
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: 20,
              color: Colors.brown,
              letterSpacing: 1.5,
            ),
          ),
        ]


      ),),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print("pressed");
        },
        child: const Icon(Icons.add_ic_call),
      ),

      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Trang chủ"),
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Tìm kiếm"),
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Cá nhân"),
        ],
      ),
    );
  }
}
