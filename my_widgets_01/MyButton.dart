import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  const MyButton({super.key});

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
            SizedBox(height: 50,),
            // ElevatedButton là một button nổi với hiệu ứng đổ bóng
            // thường được sử dụng cho cá hành động chính trong ứng dụng
            ElevatedButton(
                onPressed: (){print("Elevated Button");},
                child: Text("Elevated Button", style: TextStyle(fontSize: 24),)),

            SizedBox(height: 20,),

            // TextButton là một button phẳng,
            // không có đổ bóng
            // thường dùng cho các hành động thứ yếu
            // hoặc trong các thành phần như Dialog, card
            TextButton(
                onPressed: (){print("Text Button");},
                child: Text("Text Button", style: TextStyle(fontSize: 24),)),

            SizedBox(height: 20,),

            // OutlinedButton là button có viền bao quanh
            // không có màu nền
            // phù hợp cho các thay thế
            OutlinedButton(
                onPressed: (){print("OutlinedButton");},
                child: Text("OutlinedButton", style: TextStyle(fontSize: 24),)),

            SizedBox(height: 20,),

            // IconButton là button chỉ gồm icon
            // không có văn bản
            // thường dùng trong AppBar, Toolbar
            IconButton(
                onPressed: (){print("Icon Button");},
                icon: Icon(Icons.favorite)),

            SizedBox(height: 20,),

            // FloatingActionButton là button hình tronf
            // nổi trên giao diện
            // thường dùng cho hành động chính của màn hình
            FloatingActionButton(
              onPressed: (){print("FloatingActionButton");},
              child: Icon(Icons.add),
            )
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
