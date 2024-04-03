// import 'package:flutter/material.dart';

// class MovieDetails extends StatelessWidget {
//   final Cashiers movie;
//   final Widget? customImage;
//   const MovieDetails(this.movie, {Key? key, this.customImage})
//       : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: const EdgeInsets.fromLTRB(8.0, 250, 8.0, 0.0),
//       decoration: BoxDecoration(
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black.withOpacity(0.08),
//             blurRadius: 4.0,
//           ),
//         ],
//         borderRadius: const BorderRadius.vertical(
//           top: Radius.circular(32),
//         ),
//         color: Colors.white,
//       ),
//       child: Column(
//         children: [
//           Padding(
//             padding: const EdgeInsets.all(32.0),
//             child: ClipRRect(
//               borderRadius: const BorderRadius.all(
//                 Radius.circular(16),
//               ),
//               child: customImage ??
//                   Image.asset(
//                     movie.image,
//                     height: 290,
//                     width: double.infinity,
//                     fit: BoxFit.cover,
//                   ),
//             ),
//           ),
//           Text(
//             movie.title,
//             style: const TextStyle(
//               fontSize: 24.0,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//           const SizedBox(
//             height: 16.0,
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: List.generate(1, (index) => const Text('Appi-books')),
//           ),
//         ],
//       ),
//     );
//   }
// }
