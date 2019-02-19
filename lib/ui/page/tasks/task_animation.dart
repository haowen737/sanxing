// import 'package:flutter/material.dart';

// class TaskAnimation extends StatefulWidget {
//   _TaskAnimationState createState() => _TaskAnimationState();
// }

// class _TaskAnimationState extends State<TaskAnimation> with TickerProviderStateMixin{
//   Animation<double> animation;
//   AnimationController controller;

//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     controller = AnimationController(
//       duration: const Duration(milliseconds: 2000), vsync: this
//     );
//     animation = Tween(begin: 0.0, end: 300.0).animate(controller)
//       ..addListener(() {
//         setState(() => {});
//       });
//     controller.forward();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: child,
//     );
//   }

//   dispose() {
//     //路由销毁时需要释放动画资源
//     controller.dispose();
//     super.dispose();
//   }
// }