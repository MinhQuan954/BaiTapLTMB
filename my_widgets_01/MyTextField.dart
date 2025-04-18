import "package:flutter/material.dart";

class MyTextField extends StatelessWidget {
  const MyTextField({super.key});

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

      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 50,),
              /*
              TextField là wigdet cho phép người dùng nhập văn bản từ bàn phím.
              Đây là thành phần thiết yếu trong hầu hết các ứng dụng, từ biểu
              mẫu đăng nhập, tìm kiếm, ến nhập liệu trong các ứng dụng phức tạp
               */
              TextField(
                decoration: InputDecoration(
                  labelText: "Họ và tên",
                  hintText: "Nhập vào họ và tên của bạn",
                  border: OutlineInputBorder(),
                ),
              ),
              
              SizedBox(height: 30,),
              
              TextField(
                decoration: InputDecoration(
                  labelText: "Email",
                  hintText: "example@gmail.com",
                  helperText: "Nhập vào email cá nhân",
                  prefixIcon: Icon(Icons.email),
                  suffixIcon: Icon(Icons.clear),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20)
                  ),
                  filled: true,
                  fillColor: Colors.cyanAccent,
                ),
                keyboardType: TextInputType.emailAddress,
              ),
              
              SizedBox(height: 30,),
              TextField(
                decoration: InputDecoration(
                  labelText: "Số điện thoại",
                  hintText: "Nhập vào số điện thoại của bạn",
                  prefixIcon: Icon(Icons.phone),
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.phone,
              ),

              SizedBox(height: 30,),
              TextField(
                decoration: InputDecoration(
                  labelText: "Ngày sinh",
                  hintText: "Nhập vào ngày sinh của bạn",
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.datetime,
              ),

              SizedBox(height: 30,),
              TextField(
                decoration: InputDecoration(
                  labelText: "Mật khẩu",
                  border: OutlineInputBorder(),
                ),
                //keyboardType: TextInputType.visiblePassword,
                obscureText: true,
                obscuringCharacter: '*',
              ),

              SizedBox(height: 30,),
              TextField(
                onChanged: (value){
                  print("Đang nhập $value");
                },
                onSubmitted: (value){
                  print("Đã hoàn thành nội dung: $value");
                },
                decoration: InputDecoration(
                  labelText: "Câu hỏi bí mật",
                  border: OutlineInputBorder(),
                ),
                //keyboardType: TextInputType.visiblePassword,
              )
            ],
          ),
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
