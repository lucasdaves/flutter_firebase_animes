import 'package:flutter/material.dart';

class HomeTextField extends StatefulWidget {
  const HomeTextField({
    Key? key,
    required this.textController,
  }) : super(key: key);

  final TextEditingController textController;

  @override
  _HomeTextFieldState createState() => _HomeTextFieldState();
}

class _HomeTextFieldState extends State<HomeTextField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 10, left: 10, top: 10, bottom: 10),
      padding: EdgeInsets.only(right: 8, left: 24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      child: TextFormField(
        autofocus: false,
        controller: widget.textController,
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
        decoration: InputDecoration(
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent),
          ),
          border: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent),
          ),
          hintText: "Digite o nome do anime desejado",
          hintStyle: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
          suffixIcon: GestureDetector(
            onTap: () {
              // widget.textController.clear();
            },
            child: Icon(
              Icons.search,
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
