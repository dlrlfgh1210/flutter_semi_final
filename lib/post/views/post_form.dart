// import 'package:flutter/material.dart';

// class PostForm extends StatefulWidget {
//   const PostForm({super.key});

//   @override
//   State<PostForm> createState() => _PostFormState();
// }

// class _PostFormState extends State<PostForm> {
//   String _post = "";
//   final TextEditingController _postEditingController = TextEditingController();

//   @override
//   void initState() {
//     super.initState();
//     _postEditingController.addListener(() {
//       setState(() {
//         _post = _postEditingController.text;
//       });
//     });
//   }

//   @override
//   void dispose() {
//     _postEditingController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.symmetric(
//         horizontal: 10,
//       ),
//       height: 200,
//       width: MediaQuery.of(context).size.width,
//       decoration: BoxDecoration(
//         shape: BoxShape.rectangle,
//         boxShadow: const [
//           BoxShadow(
//               color: Colors.black,
//               blurRadius: 5,
//               blurStyle: BlurStyle.outer,
//               spreadRadius: 5,
//               offset: Offset(0, 5))
//         ],
//         borderRadius: BorderRadius.circular(20),
//       ),
//       child: TextField(
//         autofocus: false,
//         maxLines: null,
//         minLines: null,
//         controller: _postEditingController,
//         decoration: const InputDecoration(
//             hintText: "Write it down here!", border: InputBorder.none),
//       ),
//     );
//   }
// }
