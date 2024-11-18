import 'package:flutter/material.dart';

class ChatDetailScreen extends StatelessWidget {
  const ChatDetailScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/11.png',
                height: 30), // Thay đổi tên ảnh và đường dẫn
            SizedBox(width: 8), // Khoảng cách giữa các hình ảnh
            Image.asset('assets/images/22.png',
                height: 30), // Thay đổi tên ảnh và đường dẫn
          ],
        ),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: EdgeInsets.all(10),
              children: [
                _buildMessage("Yoo Jin", "hi, this is Emmy", "10:30 AM", true,
                    "assets/images/11.png"),
                _buildMessage("Yoo Jin", "It is a long established fact...",
                    "10:30 AM", true, "assets/images/11.png"),
                _buildMessage("You", "as opposed to using 'Content here'",
                    "10:31 AM", false, "assets/images/22.png"),
                _buildMessage("You", "There are many variations of passages",
                    "10:31 AM", false, "assets/images/22.png"),
              ],
            ),
          ),
          _buildInputField(),
        ],
      ),
    );
  }

  Widget _buildMessage(String sender, String message, String time,
      bool isSender, String imageUrl) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5),
      child: Row(
        mainAxisAlignment:
            isSender ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: [
          if (!isSender) CircleAvatar(backgroundImage: AssetImage(imageUrl)),
          SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment:
                  isSender ? CrossAxisAlignment.end : CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.only(bottom: 5),
                  decoration: BoxDecoration(
                    color: isSender ? Colors.green[200] : Colors.grey[200],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    message,
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                Text(
                  time,
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                ),
              ],
            ),
          ),
          if (isSender) CircleAvatar(backgroundImage: AssetImage(imageUrl)),
        ],
      ),
    );
  }

  Widget _buildInputField() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: "Type message",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide(color: Colors.grey),
                ),
              ),
            ),
          ),
          IconButton(
            icon: Icon(Icons.send),
            onPressed: () {
              // Handle send action
            },
          ),
        ],
      ),
    );
  }
}
