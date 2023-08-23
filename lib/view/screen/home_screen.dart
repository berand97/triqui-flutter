import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFD0BCFF),
      body: Column(
        children: [
          const SizedBox(height: 160),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                alignment: Alignment.center,
                width: 140,
                height: 40,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 246, 246, 247),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Text(
                  'Jugador 1 0',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF6750A4),
                  ),
                ),
              ),
              const SizedBox(width: 20),
              Container(
                alignment: Alignment.center,
                width: 140,
                height: 40,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 207, 207, 207),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Text(
                  'Jugador 2 X',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF6750A4),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 84),
          const Text(
            'Iniciar partida',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w400,
              color: Color(0xFF1C1B1F),
            ),
          ),
          const SizedBox(height: 70),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 100,
                height: 100,
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: Color(0xFF644381),
                      width: 5,
                    ),
                    right: BorderSide(
                      color: Color(0xFF644381),
                      width: 5,
                    ),
                  ),
                ),
              ),
              Container(
                width: 100,
                height: 100,
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: Color(0xFF644381),
                      width: 5,
                    ),
                  ),
                ),
              ),
              Container(
                width: 100,
                height: 100,
                decoration: const BoxDecoration(
                  border: Border(
                    left: BorderSide(
                      color: Color(0xFF644381),
                      width: 5,
                    ),
                    bottom: BorderSide(
                      color: Color(0xFF644381),
                      width: 5,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 100,
                height: 100,
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: Color(0xFF644381),
                      width: 5,
                    ),
                    right: BorderSide(
                      color: Color(0xFF644381),
                      width: 5,
                    ),
                  ),
                ),
              ),
              Container(
                width: 100,
                height: 100,
                decoration: const BoxDecoration(
                  border: Border(
                      bottom: BorderSide(
                    color: Color(0xFF644381),
                    width: 5,
                  )),
                ),
              ),
              Container(
                width: 100,
                height: 100,
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: Color(0xFF644381),
                      width: 5,
                    ),
                    left: BorderSide(
                      color: Color(0xFF644381),
                      width: 5,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 100,
                height: 100,
                decoration: const BoxDecoration(
                  border: Border(
                    right: BorderSide(
                      color: Color(0xFF644381),
                      width: 5,
                    ),
                  ),
                ),
              ),
              Container(
                width: 100,
                height: 100,
                decoration: const BoxDecoration(
                  border: Border(),
                ),
              ),
              Container(
                width: 100,
                height: 100,
                decoration: const BoxDecoration(
                  border: Border(
                    left: BorderSide(
                      color: Color(0xFF644381),
                      width: 5,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: Container(
              color: Colors.blue,
            ),
          ),
          const Padding(
            padding:  EdgeInsets.all(28),
            child:  Image(
              alignment: Alignment.bottomCenter,
              image: AssetImage('assets/images/pragma-patreon.png'),
              width: 300,
            ),
          ),
        ],
      ),
    );
  }
}
