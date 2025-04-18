import "package:flutter/material.dart";

class MyButton_2 extends StatelessWidget {
  const MyButton_2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("App_02"),
        backgroundColor: Colors.yellow,
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

      body: Center(
        child: Column(
          children: [
            SizedBox(height: 50),
            //Elevate Button làm một button nổi với hiệu ứng đổ bóng
            //thường được sử dụng cho hành động chính trong ứng dụng
            ElevatedButton(
              onPressed: () {
                print("ElevateButton");
              },
              child: Text("ElevatedButton", style: TextStyle(fontSize: 24)),
              style: ElevatedButton.styleFrom(
                //màu nền
                backgroundColor: Colors.green,
                //màu của nội dung bên trong
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                //padding
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                elevation: 15,
              ),
            ),

            //Chọn thêm ít nhất 1 dạng nút nhấn khác để thiết kế
            SizedBox(height: 20),

            // OutlinedButton
            OutlinedButton(
              onPressed: () {
                print("OutlinedButton");
              },
              child: Text("OutlinedButton", style: TextStyle(fontSize: 24)),
              style: TextButton.styleFrom(
                // màu nền
                backgroundColor: Colors.grey,
                // màu nội dung bên trong
                foregroundColor: Colors.purpleAccent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: EdgeInsets.symmetric(horizontal: 25, vertical: 17),
                elevation: 10,
              ),
            ),

            SizedBox(height: 20),

            // InkWell
            // InkWell không phải là button
            // nhưng nó cho phép tạo hiệu ứng gợn sóng (ripple effect)
            // khi nhấn vào bất kỳ widget nào
            InkWell(
              onTap: (){
                print("InkWell được nhấn!");
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.blue),
                ),
                child: Text("Button tùy chỉnh với InkWell"),
              ),
            )

          ],
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print("Pressed");
        },
        child: const Icon(Icons.add_ic_call),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Trang Chủ"),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: "Tìm Kiếm"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Cá Nhân"),
        ],
      ),
    );
  }
}
