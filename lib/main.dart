import 'dart:developer';

import 'package:diacritic/diacritic.dart';
import 'package:flutter/material.dart';
import 'package:fuzzywuzzy/fuzzywuzzy.dart';

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
  List<String> nombres = [
    'Alejandro',
    'Valentina',
    'Martín',
    'Camila',
    'Sebastián',
    'Sofía',
    'Mateo',
    'Isabella',
    'Nicolás',
    'Mia',
    'Diego',
    'Valeria',
    'Santiago',
    'Gabriela',
    'Daniel',
    'Renata',
    'Lucas',
    'Victoria',
    'Adrián',
    'Paula',
    'Emiliano',
    'Ana',
    'Samuel',
    'Amanda',
    'Leonardo',
    'Alejandra',
    'Isaac',
    'Aurora',
    'Andrés',
    'Clara',
    'Eduardo',
    'Natalia',
    'Fernando',
    'Sara',
    'Sebastián',
    'Zoe',
    'Javier',
    'Elena',
    'Alonso',
    'Laura',
    'Hugo',
    'Regina',
    'Matías',
    'Julieta',
    'Facundo',
    'Antonia',
    'Gabriel',
    'Alma',
    'Ricardo',
    'Celeste',
    'Omar',
    'Fernanda',
    'Carlos',
    'Daniela',
    'Raúl',
    'Danna',
    'Bruno',
    'Viviana',
    'Iván',
    'Ximena',
    'Juan',
    'Lucía',
    'Luis',
    'Aitana',
    'Manuel',
    'Isidora',
    'Guillermo',
    'Mariana',
    'Edgar',
    'Violeta',
    'Marco',
    'Ema',
    'Raquel',
    'Jazmín',
    'Arturo',
    'Jimena',
    'Orlando',
    'Constanza',
    'Ivonne',
    'Elisa',
    'Rubén',
    'Renata',
    'Felipe',
    'Abril',
    'Raúl',
    'Olivia',
    'Alan',
    'Lourdes',
    'Armando',
    'Lorena',
    'Benjamín',
    'Rosario',
    'Ángel',
    'Daniella',
    'Isaac',
    'Martina',
    'Gerardo',
    'Paloma',
    'Hugo',
    'Beatriz',
    'Sergio',
    'Penélope',
    'Alex',
    'Leila',
    'Javier',
    'Giselle',
    'Salvador',
    'Luciana',
    'Enrique',
    'Nataly',
    'Alberto',
    'Antonella',
    'Edgar',
    'Ainhoa',
    'Óscar',
    'Marisol',
    'Alan',
    'Adriana',
    'Esteban',
    'Paola',
    'José',
    'Gabrielle',
    'Nicolás',
    'Ángela',
    'Emiliano',
    'Valery',
    'Víctor',
    'Elena',
    'Francisco',
    'Amaya',
    'Raul',
    'Aria',
    'Javier',
    'Nayeli',
    'Pedro',
    'Clarissa',
    'Alejandro',
    'Dulce',
    'Héctor',
    'Daisy',
    'Rubén',
    'Valentina',
    'Jorge',
    'Selena',
    'Guillermo',
    'Regina',
    'Octavio',
    'Jocelyn',
    'Martín',
    'Alma',
    'Armando',
    'Isabella',
    'Francisco',
    'Camila',
    'Eduardo',
    'Adriana',
    'Manuel',
    'Renata',
    'Ricardo',
    'Daniela',
    'Juan',
    'Ana',
    'Andrés',
    'Lucía',
    'Leonardo',
    'Isidora',
    'Diego',
    'Antonia',
    'Samuel',
    'Celeste',
    'Bruno',
    'Victoria',
    'Alonso',
    'Aurora',
    'Gabriel',
    'Laura',
    'Omar',
    'Amanda',
    'Carlos',
    'Paula',
    'Facundo',
    'Clara',
    'Matías',
    'Elena',
    'Hugo',
    'Regina',
    'Adrián',
    'Julieta',
    'Isaac',
    'Alma',
    'Javier',
    'Fernanda',
    'Eduardo',
    'Ximena',
    'Fernando',
    'Mariana',
    'Sebastián',
    'Zoe',
    'Emiliano',
    'Natalia',
    'Oliver',
    'Sophie',
    'Ethan',
    'Emma',
    'Liam',
    'Ava',
    'Noah',
    'Olivia',
    'Lucas',
    'Amelia',
    'Mason',
    'Isabella',
    'Logan',
    'Sophia',
    'Elijah',
    'Mia',
    'Aiden',
    'Charlotte',
    'James',
    'Luna',
    'Benjamin',
    'Harper',
    'William',
    'Aria',
    'Henry',
    'Ella',
    'Alexander',
    'Chloe',
    'Sebastian',
    'Abigail',
    'Jackson',
    'Avery',
    'Carter',
    'Scarlett',
    'Michael',
    'Grace',
    'Ezra',
    'Aubrey',
    'Avery',
    'Emily',
    'Jayden',
    'Lily',
    'Gabriel',
    'Madison',
    'Matthew',
    'Aria',
    'Leo',
    'Zoe',
    'David',
    'Penelope',
    'Joseph',
    'Layla',
    'Wyatt',
    'Ellie',
    'Andrew',
    'Nora',
    'Lucy',
    'Hannah',
    'Anthony',
    'Kinsley',
    'Isaac',
    'Sofia',
    'Christopher',
    'Mila',
    'John',
    'Addison',
    'Olivia',
    'Natalie',
    'Liam',
    'Lily',
    'Sophia',
    'Layla',
    'Ethan',
    'Chloe',
    'Mia',
    'Emma',
    'Ava',
    'Madison',
    'Aiden',
    'Oliver',
    'Lucas',
    'Sophie',
    'Amelia',
    'Jackson',
    'Zoe',
    'Ella',
    'Mason',
    'Harper',
    'Aria',
    'Logan',
    'Charlotte',
    'Luna',
    'Noah',
    'Grace',
    'Carter',
    'Scarlett',
    'James',
    'Avery',
    'Benjamin',
    'Emily',
    'William',
    'Abigail',
    'Elijah',
    'Aubrey',
    'Alexander',
    'Evelyn',
    'Michael',
    'Penelope',
    'Henry',
    'Madelyn',
    'Sebastian',
    'Zoey',
    'Ezra',
    'Layla',
    'Aiden',
    'Nora',
    'Gabriel',
    'Ellie',
    'Matthew',
    'Hannah',
    'David',
    'Kinsley',
    'Joseph',
    'Sofia',
    'Wyatt',
    'Mila',
    'Andrew',
    'Addison',
    'Leo',
    'Natalie',
    'Christopher',
    'Lily',
    'Isaac',
    'Aria',
    'John',
    'Olivia',
    'Oliver',
    'Lucy',
    'Jayden',
    'Avery',
    'Anthony',
    'Scarlett',
    'Isabella',
    'Ella',
    'Mia',
    'Sophia',
    'Ava',
    'Chloe',
    'Liam',
    'Zoe',
    'Ethan',
    'Luna',
    'Amelia',
    'Emily',
    'Aiden',
    'Harper',
    'Mila',
    'Aria',
    'Logan',
    'Charlotte',
    'Lucas',
    'Aubrey',
    'Madison',
    'Olivia',
    'Jackson',
    'Lily',
    'Sophie',
    'Grace',
    'Ella',
    'Carter',
    'Scarlett',
    'Avery',
    'Aria',
    'Benjamin',
    'Layla',
    'James',
    'Natalie',
    'William',
    'Zoey',
    'Oliver',
    'Evelyn',
    'Michael',
    'Hannah',
    'Elijah',
    'Penelope',
    'Alexander',
    'Madelyn',
    'Henry',
    'Ellie',
    'Sebastian',
    'Kinsley',
    'Ezra',
    'Sofia',
    'Andrew',
    'Layla',
    'Isaac',
    'Aubrey',
    'Christopher',
    'Nora',
    'John',
    'Madison',
    'Wyatt',
    'Sofia',
    'Joseph',
    'Emily',
    'David',
    'Avery',
    'Leo',
    'Kinsley',
    'Matthew',
    'Zoe',
    'Lucy',
    'Anthony',
    'Luna',
    'Gabriel',
    'Ava',
    'Olivia',
    'Ella',
    'Natalie',
    'Mia',
    'Lily',
    'Scarlett',
    'Chloe',
    'Sophie',
    'Amelia',
    'Grace',
    'Aria',
    'Logan',
    'Ethan',
    'Harper',
    'Mila',
    'Aiden',
    'Charlotte',
    'Zoey',
    'Layla',
    'Lucas',
    'Aubrey',
    'Oliver',
    'Nora',
    'Avery',
    'Lily',
    'James',
    'Zoe',
    'Jackson',
    'Emily',
    'Sophia',
    'Aria',
    'Benjamin',
    'Carter',
    'Madison',
    'William',
    'Ella',
    'Alexander',
    'Aubrey',
    'Elijah',
    'Scarlett',
    'Mason',
    'Penelope',
    'Henry',
    'Zoey',
    'Sebastian',
    'Sofia',
    'Ezra',
    'Kinsley',
    'Andrew',
    'Luna',
    'Isaac',
    'Hannah',
    'Gabriel',
    'Mia',
    'Wyatt',
    'Avery',
    'Matthew',
    'Charlotte',
    'David',
    'Sophie',
    'Joseph',
    'Evelyn',
    'Leo',
    'Aria',
    'Lucy',
    'Natalie',
    'Olivia',
    'Ella',
    'Oliver',
    'Layla',
    'Aiden',
    'Emily',
    'Logan',
    'Ethan',
    'Mia',
    'Zoe',
    'Sophia',
    'Chloe',
    'Ava',
    'Lily',
    'Harper',
    'Amelia',
    'Aria',
    'Madison',
    'Charlotte',
    'Aiden',
    'Ella',
    'Carter',
    'Scarlett',
    'Oliver',
    'Aubrey',
    'James',
    'Mia',
    'Evelyn',
    'Alexander',
    'Grace',
    'Sophie',
    'Avery',
    'Nora',
    'Benjamin',
    'Hannah',
    'Lucas',
    'Penelope',
    'Mason',
    'Zoey',
    'Ezra',
    'Luna',
    'William',
    'Aria',
    'Henry',
    'Olivia',
    'Michael',
    'Madelyn',
    'Jackson',
    'Emily',
    'Gabriel',
    'Aubrey',
    'Joseph',
    'Zoe',
    'Ella',
    'Andrew',
    'Mia',
    'Isaac',
    'Lily',
    'Oliver',
    'Sophia',
    'Charlotte',
    'Layla',
    'Ethan',
    'Aria',
    'Amelia',
    'Harper',
    'Logan',
    'Avery',
    'Carter',
    'Mia',
    'Emily',
    'Zoey',
    'Ava',
    'Olivia',
    'Lily',
    'Ella',
    'Sophie',
    'Aiden',
    'Amelia',
    'Carter',
    'Scarlett',
    'Ethan',
    'Aria',
    'Oliver',
    'Luna',
    'James',
    'Avery',
    'Mia',
    'Emily',
    'Chloe',
    'Ava',
    'Sophia',
    'Olivia',
    'Lily',
    'Ella',
    'Logan',
    'Aria',
    'Charlotte',
    'Mia',
    'Aiden',
    'Ethan',
    'Carter',
    'Sophie',
    'Scarlett',
    'Oliver',
    'Avery',
    'Harper',
    'Amelia',
    'Zoey',
    'Luna',
    'Emily',
    'Ella',
    'Olivia',
    'Lily',
    'Aria',
    'Mia',
    'Sophia',
    'Ava',
    'Chloe',
    'Carter',
    'Logan',
    'Ethan',
    'Oliver',
    'Scarlett',
    'Avery',
    'Amelia',
    'Harper',
    'Sophie',
    'Zoey',
    'Aria',
    'Luna',
    'Emily',
    'Mia',
    'Ella',
    'Olivia',
    'Ava',
    'Sophia',
    'Lily',
    'Carter',
    'Chloe',
    'Scarlett',
    'Oliver',
    'Amelia',
    'Avery',
    'Logan',
    'Aiden',
    'Ethan',
    'Mia',
    'Luna',
    'Zoey',
    'Emily',
    'Olivia',
    'Sophia',
    'Ella',
    'Ava',
    'Scarlett',
    'Carter',
    'Amelia',
    'Avery',
    'Oliver',
    'Chloe',
    'Lily',
    'Aria',
    'Ethan',
    'Mia',
    'Logan',
    'Olivia',
    'Sophia',
    'Ella',
    'Ava',
    'Aiden',
    'Scarlett',
    'Carter',
    'Amelia',
    'Luna',
    'Chloe',
    'Avery',
    'Oliver',
    'Lily',
    'Zoey',
    'Emily',
    'Sophie',
    'Mia',
    'Olivia',
    'Aria',
    'Luna',
    'Ella',
    'Ethan',
    'Ava',
    'Chloe',
    'Carter',
    'Oliver',
    'Scarlett',
    'Amelia',
    'Logan',
    'Sophia',
    'Zoey',
    'Aiden',
    'Emily',
    'Olivia',
    'Lily',
    'Ella',
    'Ava',
    'Mia',
    'Chloe',
    'Aria',
    'Scarlett',
    'Amelia',
    'Carter',
    'Oliver',
    'Logan',
    'Ethan',
    'Sophie',
    'Zoey',
    'Luna',
    'Avery',
    'Emily',
    'Olivia',
    'Lily',
    'Ava',
    'Ella',
    'Mia',
    'Scarlett',
    'Chloe',
    'Aria',
    'Oliver',
    'Amelia',
    'Carter',
    'Logan',
    'Sophia',
    'Aiden',
    'Ethan',
    'Zoey',
    'Olivia',
    'Lily',
    'Mia',
    'Ella',
    'Ava',
    'Emily',
    'Scarlett',
    'Chloe',
    'Aria',
    'Amelia',
    'Carter',
    'Oliver',
    'Luna',
    'Avery',
    'Sophia',
    'Logan',
    'Ethan',
    'Mia',
    'Olivia',
    'Zoey',
    'Lily',
    'Emily',
    'Ella',
    'Ava',
    'Aiden',
    'Scarlett',
    'Carter',
    'Chloe',
    'Aria',
    'Amelia',
    'Oliver',
    'Logan',
    'Sophia',
    'Luna',
    'Ethan',
    'Mia',
    'Zoey',
    'Avery',
    'Olivia',
    'Lily',
    'Ella',
    'Ava',
    'Scarlett',
    'Chloe',
    'Carter',
    'Aria',
    'Amelia',
    'Logan',
    'Oliver',
    'Sophia',
    'Mia',
    'Zoey',
    'Luna',
    'Emily',
    'Ella',
    'Ava',
    'Olivia',
    'Aiden',
    'Scarlett',
    'Chloe',
    'Carter',
    'Amelia',
    'Oliver',
    'Aria',
    'Logan',
    'Sophia',
    'Mia',
    'Ella',
    'Zoey',
    'Lily',
    'Ava',
    'Olivia',
    'Ethan',
    'Scarlett',
    'Chloe',
    'Carter',
    'Amelia',
    'Aiden',
    'Oliver',
    'Logan',
    'Sophia',
    'Aria',
    'Mia',
    'Lily',
    'Zoey',
    'Ella',
    'Ava',
    'Emily',
    'Scarlett',
    'Chloe',
    'Carter',
    'Olivia',
    'Amelia',
    'Luna',
    'Aiden',
    'Oliver',
    'Sophia',
    'Zoey',
    'Logan',
    'Lily',
    'Mia',
    'Emily',
    'Ava',
    'Ella',
    'Olivia',
    'Aria',
    'Chloe',
    'Scarlett',
    'Carter',
    'Amelia',
    'Oliver',
    'Sophia',
    'Logan',
    'Zoey',
    'Aiden',
    'Luna',
    'Mia',
    'Ella',
    'Emily',
    'Olivia',
    'Ava',
    'Scarlett',
    'Chloe',
    'Aria',
    'Lily',
    'Sophie',
    'Carter',
    'Amelia',
    'Logan',
    'Ethan',
    'Oliver',
    'Avery',
    'Mia',
    'Olivia',
    'Zoey',
    'Luna',
    'Ella',
    'Aria',
    'Scarlett',
    'Chloe',
    'Carter',
    'Amelia',
    'Logan',
    'Sophia',
    'Oliver',
    'Zoey',
    'Lily',
    'Mia',
    'Emily',
    'Ava',
    'Olivia',
    'Scarlett',
    'Chloe',
    'Ella',
    'Aria',
    'Amelia',
    'Carter',
    'Logan',
    'Sophia',
    'Luna',
    'Oliver',
    'Mia',
    'Zoey',
    'Ava',
    'Lily',
    'Ella',
    'Olivia',
    'Emily',
    'Scarlett',
    'Chloe',
    'Carter',
    'Amelia',
    'Aria',
    'Logan',
    'Sophia',
    'Oliver',
    'Luna',
    'Zoey',
    'Mia',
    'Ella',
    'Ava',
    'Chloe',
    'Scarlett',
    'Emily',
    'Lily',
    'Amelia',
    'Carter',
    'Olivia',
    'Aiden',
    'Sophia',
    'Mia',
    'Ava',
    'Ella',
    'Oliver',
    'Chloe',
    'Luna',
    'Emily',
    'Scarlett',
    'Amelia',
    'Aria',
    'Carter',
    'Zoey',
    'Logan',
    'Lily',
    'Sophie',
    'Olivia',
    'Mia',
    'Ella',
    'Ava',
    'Chloe',
    'Scarlett',
    'Aria',
    'Luna',
    'Amelia',
    'Emily',
    'Carter',
    'Oliver',
    'Sophia',
    'Mia',
    'Zoey',
    'Ella',
    'Ava',
    'Olivia',
    'Chloe',
    'Scarlett',
    'Carter',
    'Lily',
    'Aria',
    'Logan',
    'Amelia',
    'Aiden',
    'Sophia',
    'Oliver',
    'Ava',
    'Mia',
    'Chloe',
    'Emily',
    'Scarlett',
    'Ella',
    'Aria',
    'Luna',
    'Olivia',
    'Zoey',
    'Logan',
    'Sophie',
    'Amelia',
    'Carter',
    'Mia',
    'Oliver',
    'Chloe',
    'Ava',
    'Ella',
    'Scarlett',
    'Emily',
    'Luna',
    'Aria',
    'Zoey',
    'Logan',
    'Sophia',
    'Mia',
    'Ava',
    'Oliver',
    'Chloe',
    'Emily',
    'Lily',
    'Scarlett',
    'Ella',
    'Carter',
    'Aria',
    'Logan',
    'Amelia',
    'Olivia',
    'Zoey',
    'Mia',
    'Ava',
    'Sophia',
    'Chloe',
    'Oliver',
    'Ella',
    'Lily',
    'Scarlett',
    'Emily',
    'Carter',
    'Aria',
    'Amelia',
    'Zoey',
    'Logan',
    'Olivia',
    'Ava',
    'Mia',
    'Sophia',
    'Chloe',
    'Scarlett',
    'Oliver',
    'Ella',
    'Aria',
    'Emily',
    'Lily',
    'Carter',
    'Amelia',
    'Zoey',
    'Logan',
    'Mia',
    'Sophia',
    'Chloe',
    'Ava',
    'Scarlett',
    'Emily',
    'Oliver',
    'Ella',
    'Aria',
    'Lily',
    'Carter',
    'Amelia',
    'Zoey',
    'Logan',
    'Mia',
    'Sophia',
    'Chloe',
    'Ava',
    'Emily',
    'Scarlett',
    'Oliver',
    'Ella',
    'Aria',
    'Lily',
    'Carter',
    'Amelia',
    'Zoey',
    'Mia',
    'Sophia',
    'Chloe',
    'Ava',
    'Luna',
    'Scarlett',
    'Emily',
    'Oliver',
    'Aria',
    'Ella',
    'Lily',
    'Amelia',
    'Zoey',
    'Mia',
    'Sophia',
    'Chloe',
    'Ava',
    'Scarlett',
    'Oliver',
    'Emily',
    'Aria',
    'Luna',
    'Ella',
    'Amelia',
    'Carter',
    'Mia',
    'Zoey',
    'Olivia',
    'Logan',
    'Oliver',
    'Sophia',
    'Ella',
    'Ava',
    'Mia',
    'Chloe',
    'Lily',
    'Scarlett',
    'Emily',
    'Aria',
    'Carter',
    'Amelia',
    'Zoey',
    'Logan',
    'Olivia',
    'Sophia',
  ];
  List<String> nombress = [
    'Abel Adán',
    'Noé Moisés',
    'Eva Sara',
    'David Daniel',
    'Isaac Isabel',
    'Abraham Ruth',
    'Salomón Judith',
    'José Rebeca',
    'Jacob Lea',
    'Ester Samuel',
    'Ezequiel María',
    'Marta Juan',
    'Ana Miguel',
    'Gabriel Rafael',
    'Lucas Mateo',
    'Juan Pedro',
    'Pablo Andrés',
    'Felipe Tomás',
    'Santiago Mateo',
    'Marcos Lucas',
    'José Simón',
    'Judas Esther',
    'Daniel Jonás',
    'Abigail Raquel',
    'Abner Amós',
    'Anaías Asa',
    'Adrián Belén',
    'Bernardo Camila',
    'Cristian Carla',
    'Diego Diana',
    'Eduardo Elena',
    'Fernando Francisca',
    'Felipe Gabriela',
    'Gonzalo Guadalupe',
    'Héctor Isabel',
    'Ignacio Inés',
    'Javier Juana',
    'Jesús Julia',
    'José Katherine',
    'Luis Laura',
    'León Lorena',
    'Manuel Mariana',
    'Martín Mónica',
    'Nicolás Natalia',
    'Oscar Olivia',
    'Octavio Pilar',
    'Pedro Paula',
    'Quirino Quevedo',
    'Raúl Ramona',
    'Santiago Silvia',
    'Sergio Susana',
    'Teresa Tomás',
    'Ulises Uriel',
    'Ursula Víctor',
    'Vanesa Walter',
    'Wendy Xavier',
    'Ximena Yolanda',
    'Yago Zaira',
    'Zacarías Zulema',

    // Pares de nombres en inglés
    'Adam Eve',
    'Noah Moses',
    'Abraham Isaac',
    'David Daniel',
    'Sarah Rebecca',
    'Solomon Ruth',
    'Joseph Judith',
    'Elijah Esther',
    'Samuel Michael',
    'Gabriel Raphael',
    'Luke Matthew',
    'John Mary',
    'Peter Paul',
    'Andrew Philip',
    'Thomas James',
    'Matthew Mark',
    'Lucas Joseph',
    'Simon Judas',
    'Abigail Rachel',
    'Abner Amos',
    'Anna Adrian',
    'Bernard Camila',
    'Christian Carla',
    'David Diana',
    'Edward Elena',
    'Fernando Francis',
    'Felipe Gabriela',
    'Gonzalo Guadalupe',
    'Hector Isabel',
    'Ignacio Ines',
    'Javier Juana',
    'Jesus Julia',
    'Katherine Luis',
    'Laura Leon',
    'Lorena Manuel',
    'Mariana Martin',
    'Monica Nicholas',
    'Natalie Oscar',
    'Olivia Octavio',
    'Pilar Pedro',
    'Paula Raul',
    'Ramona Santiago',
    'Silvia Sergio',
    'Susana Teresa',
    'Thomas Ulises',
    'Uriel Ursula',
    'Victor Vanessa',
    'Walter Wendy',
    'Xavier Ximena',
    'Yolanda Yago',
    'Zaira Zacarias', 'Zulema',

    // Pares de nombres en español adicionales
    'Adriana Beatriz',
    'Carlos Daisy',
    'Eduarda Fabián',
    'Giselle Hugo',
    'Ivonne Jaime',
    'Karla Luisa',
    'Mario Nora',
    'Óscar Patricia',
    'Raquel Simón',
    'Tamara Víctor',
    'Yasmin Zamira',
    'Adelina Baltasar',
    'Carmen Dante',
    'Elvira Facundo',
    'Gilda Hernán',
    'Ingrid Joaquín',
    'Kimberly Lázaro',
    'Margarita Néstor',
    'Ofelia Paco',
    'Quintín Rosario',
    'Sebastián Teodoro',
    'Úrsula Violeta',
    'Wilfredo Xenia',
    'Yvette Zacarías'

        // Nombres bíblicos
        'Abel',
    'Adán',
    'Noé',
    'Moisés',
    'Eva',
    'Sara',
    'David',
    'Daniel',
    'Isaac',
    'Isabel',
    'Abraham', 'Ruth', 'Salomón', 'Judith', 'José', 'Rebeca', 'Jacob', 'Lea',
    'Ester', 'Samuel',
    'Ezequiel', 'María', 'Marta', 'Juan', 'Ana', 'Miguel', 'Gabriel', 'Rafael',
    'Lucas', 'Mateo',
    'Juan', 'Pedro', 'Pablo', 'Andrés', 'Felipe', 'Tomás', 'Santiago', 'Mateo',
    'Marcos', 'Lucas',
    'José', 'Simón', 'Judas', 'Esther', 'Daniel', 'Jonás', 'Abigail', 'Raquel',
    'Abner', 'Amós',
    'Anaías', 'Asa', 'Adrián', 'Belén', 'Bernardo', 'Camila', 'Cristian',
    'Carla', 'Diego', 'Diana',
    'Dolores', 'Eduardo', 'Elena', 'Fernando', 'Francisca', 'Felipe',
    'Gabriela', 'Gonzalo', 'Guadalupe',
    'Héctor', 'Isabel', 'Ignacio', 'Inés', 'Javier', 'Juana', 'Jesús', 'Julia',
    'José', 'Katherine',
    'Luis', 'Laura', 'León', 'Lorena', 'Manuel', 'Mariana', 'Martín', 'Mónica',
    'Nicolás', 'Natalia',
    'Oscar', 'Olivia', 'Octavio', 'Pilar', 'Pedro', 'Paula', 'Quirino',
    'Quevedo', 'Raúl', 'Ramona',
    'Santiago', 'Silvia', 'Sergio', 'Susana', 'Teresa', 'Tomás', 'Ulises',
    'Uriel', 'Ursula', 'Víctor',
    'Vanesa', 'Walter', 'Wendy', 'Xavier', 'Ximena', 'Yolanda', 'Yago', 'Zaira',
    'Zacarías', 'Zulema',

    // Nombres en inglés
    'Adam', 'Eve', 'Noah', 'Moses', 'Abraham', 'Isaac', 'David', 'Daniel',
    'Sarah', 'Rebecca',
    'Solomon', 'Ruth', 'Joseph', 'Judith', 'Elijah', 'Esther', 'Samuel',
    'Michael', 'Gabriel', 'Raphael',
    'Luke', 'Matthew', 'John', 'Mary', 'Martha', 'Peter', 'Paul', 'Andrew',
    'Philip', 'Thomas',
    'James', 'Matthew', 'Mark', 'Lucas', 'Joseph', 'Simon', 'Judas', 'Abigail',
    'Rachel', 'Abner',
    'Amos', 'Anna', 'Adrian', 'Bernard', 'Camila', 'Christian', 'Carla',
    'David', 'Diana', 'Edward',
    'Elena', 'Fernando', 'Francis', 'Felipe', 'Gabriela', 'Gonzalo',
    'Guadalupe', 'Hector', 'Isabel',
    'Ignacio', 'Ines', 'Javier', 'Juana', 'Jesus', 'Julia', 'Katherine', 'Luis',
    'Laura',
    'Leon', 'Lorena', 'Manuel', 'Mariana', 'Martin', 'Monica', 'Nicholas',
    'Natalie', 'Oscar', 'Olivia',
    'Octavio', 'Pilar', 'Pedro', 'Paula', 'Raul', 'Ramona', 'Santiago',
    'Silvia', 'Sergio', 'Susana',
    'Teresa', 'Thomas', 'Ulises', 'Uriel', 'Ursula', 'Victor', 'Vanessa',
    'Walter', 'Wendy', 'Xavier',
    'Ximena', 'Yolanda', 'Yago', 'Zaira', 'Zacarias', 'Zulema',

    // Nombres en español adicionales
    'Adriana', 'Beatriz', 'Carlos', 'Daisy', 'Eduarda', 'Fabián', 'Giselle',
    'Hugo', 'Ivonne', 'Jaime',
    'Karla', 'Luisa', 'Mario', 'Nora', 'Óscar', 'Patricia', 'Raquel', 'Simón',
    'Tamara', 'Víctor',
    'Yasmin', 'Zamira', 'Adelina', 'Baltasar', 'Carmen', 'Dante', 'Elvira',
    'Facundo', 'Gilda', 'Hernán',
    'Ingrid', 'Joaquín', 'Kimberly', 'Lázaro', 'Margarita', 'Néstor', 'Ofelia',
    'Paco', 'Quintín', 'Rosario',
    'Sebastián', 'Teodoro', 'Úrsula', 'Violeta', 'Wilfredo', 'Xenia', 'Yvette',
    'Zacarías',
    'Aurora Benjamin',
    'Celeste Donovan',
    'Esperanza Felix',
    'Grace Hector',
    'Harmony Ian',
    'Iris Jasper',
    'Jasmine Kael',
    'Kai Liana',
    'Luna Maximus',
    'Milo Nia',
    'Nina Orion',
    'Owen Peyton',
    'Penelope Quinn',
    'Quincy Roselyn',
    'River Sebastian',
    'Sienna Theo',
    'Thea Ulysses',
    'Uma Valentin',
    'Vivian Wilder',
    'Wyatt Xanthe',
    'Xander Yara',
    'Yasmine Zephyr',
    'Zara Amadeus',
    'Aria Beckham',
    'Bianca Caden',
    'Cleo Dashiell',
    'Daisy Evander',
    'Ezra Faye',
    'Finn Giselle',
    'Gemma Hayden',
    'Hazel Indigo', 'Ivy Jaxon', 'Jade Kenzo', 'Kaiya Leo', 'Liam Mia',
    'Maeve Nico', 'Nala Orion', 'Olivia Pax', 'Piper Quinn', 'Quentin Ruby',
    'Riley Silas',
    'Serena Tatum',
    'Tristan Ula',
    'Ulysses Valencia',
    'Violet Wilder',
    'Wren Xander',
    'Xena Yara',
    'Yara Zephyr',
    'Zane Amara',
    'Amelia Bodhi',
    'Beckett Calista', 'Calvin Della', 'Daisy Enzo', 'Eva Finley', 'Felix Gia',
    'Giselle Harper', 'Harmony Idris', 'Ida Jaxon', 'Jade Kellan', 'Kai Luna',
    'Lena Milo', 'Maddox Nova', 'Nadia Orion', 'Orion Primrose', 'Pippa Quinn',
    'Quinn Remy', 'Remy Stellan', 'Stella Theo', 'Theo Ursa', 'Ursa Violet',
    'Vera Wren',
    'Wilder Xara',
    'Xara Yves',
    'Yves Zara',
    'Zara Atticus',
    'Aria Bellamy',
    'Bellamy Caelum',
    'Caelum Dalia',
    'Dalia Elio',
    'Elio Fleur',
    'Fleur Gideon', 'Gideon Halia', 'Halia Icarus', 'Icarus Juno', 'Juno Kael',
    'Kael Luna', 'Luna Magnus', 'Magnus Nyx', 'Nyx Orion', 'Orion Phoebe',
    'Phoebe Quillon',
    'Quillon Rhea',
    'Rhea Sirius',
    'Sirius Thalia',
    'Thalia Ulysses',
    'Ulysses Venus',
    'Venus Willow',
    'Willow Xanthe',
    'Xanthe Yael',
    'Yael Zephyr',
    '1105037616',
    '0983427384',
    '11111111111',
    '23232323232323',

    '90635741c14a-4aa7-80ef-052c19206723'
  ];
  List<String> resultados = [];

  @override
  Widget build(BuildContext context) {
    log("cargar : ${nombress.length}");
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          TextField(
            onChanged: (texto) {
              setState(() {
                // Filtrar la lista de nombres basándose en la entrada del usuario
                resultados = filtrarNombres(texto);
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
                final datas = separetWords(resultados[index]);
                final separate = seprateSearch(resultados[index]);

                return ListTile(
                  title: HighlightedSelectableText(
                    text: resultados[index],
                    searchTerm: resultados[index],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  List<String> filtrarNombres(String palabraClave) {
    // Utilizar FuzzyWuzzy para realizar la búsqueda
    // ratio que define cómo se calcula la similitud entre la palabraClave y cada elemento de nombress
    //  ratio es el numero que afecta a la sensibildiadde busquedad si es menro
    // retorna  coincidencias con similitud menor pero si Ratio es mayor retorna  coincidencias
    // con similitud mayor
    return nombress
        .where((nombre) =>
            ratio(nombre.toLowerCase(), palabraClave.toLowerCase()) > 44)
        .toList();
  }
}

class HighlightedSelectableText extends StatelessWidget {
  final String text;
  final String searchTerm;

  const HighlightedSelectableText({
    super.key,
    required this.text,
    required this.searchTerm,
  });

  String _removeDiacritics(String str) {
    return removeDiacritics(str);
  }

  @override
  Widget build(BuildContext context) {
    if (searchTerm.isEmpty) {
      return SelectableText(
        text,
        style: const TextStyle(fontSize: 17),
      );
    }

    final normalizedText = _removeDiacritics(text).toLowerCase();
    final normalizedSearchTerm = _removeDiacritics(searchTerm).toLowerCase();
    List<TextSpan> spans = [];
    int start = 0;

    while (start < text.length) {
      final indexOfHighlight =
          normalizedText.indexOf(normalizedSearchTerm, start);

      if (indexOfHighlight != -1) {
        final endOfHighlight = indexOfHighlight + normalizedSearchTerm.length;
        if (indexOfHighlight > start) {
          spans.add(
            TextSpan(
              text: text.substring(start, indexOfHighlight),
            ),
          );
        }

        final highlightedText =
            text.substring(indexOfHighlight, endOfHighlight);

        // Verificar si la coincidencia es exacta antes de pintar en amarillo
        if (highlightedText.toLowerCase() == normalizedSearchTerm) {
          spans.add(
            TextSpan(
              text: highlightedText,
              style: const TextStyle(
                backgroundColor: Colors.yellow, // Color amarillo
                color: Colors.black,
              ),
            ),
          );
        } else {
          spans.add(
            TextSpan(
              text: highlightedText,
            ),
          );
        }

        start = endOfHighlight;
      } else {
        spans.add(
          TextSpan(
            text: text.substring(start),
          ),
        );
        break;
      }
    }

    return Text.rich(
      TextSpan(
        children: spans,
        style: const TextStyle(
          color: Colors.black,
        ),
      ),
      textAlign: TextAlign.justify,
      style: const TextStyle(
        fontSize: 17,
      ),
    );
  }
}

List<dynamic> separetWords(String separate) {
  final wordsS = separate.split(" ");
  final worsSeparas = [];
  for (var element in wordsS) {
    if (element.length > 9) {
      worsSeparas.add(element.substring(0, 8));
    }
    if (element.length > 6) {
      worsSeparas.add(element.substring(0, 5));
    }
    bool esEntero = int.tryParse(element) != null;
    if (esEntero) {
      if (element.length >= 2) {
        worsSeparas.add(element.substring(0, 2));
      }
      if (element.isNotEmpty) {
        worsSeparas.add(element);
      }
    }
  }
  return worsSeparas;
}

extension IterableIndexed<E> on Iterable<E> {
  Iterable<T> mapIndexed<T>(T Function(int index, E element) f) {
    var index = 0;
    return map((element) => f(index++, element));
  }
}

String seprateSearch(String search) {
  List<String> palabras = search.split(' ');

  String resultado = palabras.mapIndexed((index, palabra) {
    if (index == palabras.length - 1) {
      return palabra;
    } else {
      return '$palabra |';
    }
  }).join(' ');

  return resultado;
}
