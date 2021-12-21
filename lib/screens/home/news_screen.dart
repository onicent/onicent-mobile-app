// class HomeScreen extends StatelessWidget {
//   const HomeScreen({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//         child: Container(
//           decoration: const BoxDecoration(
//             color: Colors.white,
//           ),
//           child: CustomScrollView(
//             primary: false,
//             slivers: <Widget>[
//
//               SliverPadding(
//                 padding: const EdgeInsets.all(20),
//                 sliver: SliverGrid.count(
//                   crossAxisSpacing: 10,
//                   mainAxisSpacing: 10,
//                   crossAxisCount: 3,
//                   children: <Widget>[
//                     Container(
//                       width: MediaQuery.of(context).size.width,
//                       padding: const EdgeInsets.all(8),
//                       color: Colors.black,
//                       child: Center(
//                         child: Column(
//                           children: [
//                             Text("He'd have", style: TextStyle(fontSize: 16),)
//                           ],
//                         ),
//                       ),
//
//                     ),
//                     Container(
//                       padding: const EdgeInsets.all(8),
//                       child: const Text('Heed not the rabble'),
//                       color: Colors.green[200],
//                     ),
//
//                   ],
//                 ),
//               ),
//
//
//             ],
//           ),
//         ),
//     );
//   }
// }