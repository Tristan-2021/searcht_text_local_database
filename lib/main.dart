import 'package:examples/custon_functions.dart';
import 'package:examples/database_local.dart';
import 'package:examples/entitu.dart';
import 'package:examples/search_gerico.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Búsqueda '),
        ),
        body: const SearchScreen(),
      ),
    );
  }
}

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List<SearchResult> resultados = [];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          TextField(
            onChanged: (texto) {
              setState(() {
                // Filtrar la lista de nombres basándose en la entrada del usuario
                resultados = filtrarObjetos(
                  lista: listaVehiculosAdicionales,
                  palabraClave: texto,
                  obtenerNombre: (user) => user.modelo,
                  // obtenerPlaca: (user) => user.placa,
                  // obtenerUui: (user) => user.uui,
                  // obtenerIdentificacion: (user) => user.identificacion,
                );
              });
            },
            decoration: const InputDecoration(
              labelText: 'Buscar nombres',
            ),
          ),
          const SizedBox(height: 16),
          Expanded(
            child: ListView.builder(
              itemCount: resultados.length,
              itemBuilder: (context, index) {
                final user = resultados[index].objeto as Vehiculo;
                final objeto = resultados[index].toMap();

                // final datas = separetWords(resultados[index]);
                // final separate = seprateSearch(resultados[index]);

                return ListTile(
                  title: SelectableText(
                    user.modelo,
                  ),
                  subtitle: SelectableText(objeto.toString()),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

// class HighlightedSelectableText extends StatelessWidget {
//   final String text;
//   final String searchTerm;

//   const HighlightedSelectableText({
//     super.key,
//     required this.text,
//     required this.searchTerm,
//   });

//   String _removeDiacritics(String str) {
//     return removeDiacritics(str);
//   }

//   @override
//   Widget build(BuildContext context) {
//     if (searchTerm.isEmpty) {
//       return SelectableText(
//         text,
//         style: const TextStyle(fontSize: 17),
//       );
//     }

//     final normalizedText = _removeDiacritics(text).toLowerCase();
//     final normalizedSearchTerm = _removeDiacritics(searchTerm).toLowerCase();
//     List<TextSpan> spans = [];
//     int start = 0;

//     while (start < text.length) {
//       final indexOfHighlight =
//           normalizedText.indexOf(normalizedSearchTerm, start);

//       if (indexOfHighlight != -1) {
//         final endOfHighlight = indexOfHighlight + normalizedSearchTerm.length;
//         if (indexOfHighlight > start) {
//           spans.add(
//             TextSpan(
//               text: text.substring(start, indexOfHighlight),
//             ),
//           );
//         }

//         final highlightedText =
//             text.substring(indexOfHighlight, endOfHighlight);

//         // Verificar si la coincidencia es exacta antes de pintar en amarillo
//         if (highlightedText.toLowerCase() == normalizedSearchTerm) {
//           spans.add(
//             TextSpan(
//               text: highlightedText,
//               style: const TextStyle(
//                 backgroundColor: Colors.yellow, // Color amarillo
//                 color: Colors.black,
//               ),
//             ),
//           );
//         } else {
//           spans.add(
//             TextSpan(
//               text: highlightedText,
//             ),
//           );
//         }

//         start = endOfHighlight;
//       } else {
//         spans.add(
//           TextSpan(
//             text: text.substring(start),
//           ),
//         );
//         break;
//       }
//     }

//     return Text.rich(
//       TextSpan(
//         children: spans,
//         style: const TextStyle(
//           color: Colors.black,
//         ),
//       ),
//       textAlign: TextAlign.justify,
//       style: const TextStyle(
//         fontSize: 17,
//       ),
//     );
//   }
// }

// List<dynamic> separetWords(String separate) {
//   final wordsS = separate.split(" ");
//   final worsSeparas = [];
//   for (var element in wordsS) {
//     if (element.length > 9) {
//       worsSeparas.add(element.substring(0, 8));
//     }
//     if (element.length > 6) {
//       worsSeparas.add(element.substring(0, 5));
//     }
//     bool esEntero = int.tryParse(element) != null;
//     if (esEntero) {
//       if (element.length >= 2) {
//         worsSeparas.add(element.substring(0, 2));
//       }
//       if (element.isNotEmpty) {
//         worsSeparas.add(element);
//       }
//     }
//   }
//   return worsSeparas;
// }

// extension IterableIndexed<E> on Iterable<E> {
//   Iterable<T> mapIndexed<T>(T Function(int index, E element) f) {
//     var index = 0;
//     return map((element) => f(index++, element));
//   }
// }

// String seprateSearch(String search) {
//   List<String> palabras = search.split(' ');

//   String resultado = palabras.mapIndexed((index, palabra) {
//     if (index == palabras.length - 1) {
//       return palabra;
//     } else {
//       return '$palabra |';
//     }
//   }).join(' ');

//   return resultado;
// }
// List<String> filtrarNombres(String palabraClave) {
  // Utilizar FuzzyWuzzy para realizar la búsqueda
  // ratio que define cómo se calcula la similitud entre la palabraClave y cada elemento de nombress
  //  ratio es el numero que afecta a la sensibildiadde busquedad si es menro
  // retorna  coincidencias con similitud menor pero si Ratio es mayor retorna  coincidencias
  // con similitud mayor
  // return nombress
  //     .where((nombre) =>
  //         ratio(nombre.toLowerCase(), palabraClave.toLowerCase()) > 44)
  //     .toList();
// }
