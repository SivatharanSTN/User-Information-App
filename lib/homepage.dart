import 'package:flutter/material.dart';
// ignore: implementation_imports

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.all(10),
          decoration: const BoxDecoration(
            color: Color(0xffA1AEF0),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(40),
            child: Container(
              height: MediaQuery.of(context).size.height - 44,
              width: MediaQuery.of(context).size.width - 20,
              padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
              decoration: BoxDecoration(
                color: const Color(0xffFFFFFF),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                children: [
                  headerWidget(context: context),
                  cardContent(context: context),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget headerWidget({required BuildContext context}) {
    return Container(
      height: 70,
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        color: const Color(0xff8092EF),
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: const Color(0xff8092EF).withOpacity(0.4),
            spreadRadius: 4,
            blurRadius: 8,
            offset: const Offset(-2, 5),
          ),
        ],
      ),
    );
  }

  Widget cardContent({required BuildContext context}) {
    return Expanded(
      child: ListView.builder(
        itemCount: 20,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            margin: const EdgeInsets.all(4),
            height: 80,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: const Color.fromARGB(255, 228, 228, 228),
            ),
          );
        },
      ),
    );
  }
}
