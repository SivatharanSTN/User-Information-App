import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:userinformationapp/model_data.dart';
import 'package:userinformationapp/service.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: FutureBuilder<List<ModelData>?>(
          future: Service().getData(),
          builder: ((context, data) {
            return Container(
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
                      headerWidget(
                          context: context, count: data.data?.length ?? 0),
                      cardContent(
                        context: context,
                        count: data.data?.length ?? 0,
                        data: data,
                      )
                    ],
                  ),
                ),
              ),
            );
          }),
        ),
      ),
    );
  }

  Widget headerWidget({required BuildContext context, required count}) {
    return Container(
      height: 80,
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.only(bottom: 15),
      padding: const EdgeInsets.all(10),
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
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: 65,
            width: 65,
            decoration: BoxDecoration(
              color: const Color(0xff586AD7),
              borderRadius: BorderRadius.circular(25),
            ),
            child: const Center(
              child: FaIcon(
                FontAwesomeIcons.commentDots,
                color: Color(0xffFCFCFF),
                size: 30,
              ),
            ),
          ),
          TextButton(
            style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all(
                  const Color.fromARGB(255, 16, 18, 20)),
            ),
            onPressed: () {},
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 1),
                      child: const Text(
                        "Team conversations",
                        style: TextStyle(
                          color: Color(0xffFCFCFF),
                        ),
                      ),
                    ),
                    const FaIcon(
                      FontAwesomeIcons.chevronDown,
                      color: Colors.white,
                      size: 15,
                    )
                  ],
                ),
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(5),
                      child: Text(
                        "$count Total Users",
                        style: const TextStyle(
                          color: Color.fromARGB(207, 252, 252, 255),
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            // child: const FaIcon(
            //   FontAwesomeIcons.bars,
            //   color: Color(0xffFCFCFF),
            //   size: 22,
            // ),
            child: SvgPicture.asset(
              "assets/svg/filter.svg",
              height: 25,
              color: const Color(0xffFCFCFF),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            // child: const FaIcon(
            //   // ignore: deprecated_member_use
            //   FontAwesomeIcons.arrowsV,
            //   color: Color(0xffFCFCFF),
            //   size: 22,
            // ),
            child: SvgPicture.asset(
              "assets/svg/mobiledata.svg",
              height: 25,
              color: const Color(0xffFCFCFF),
            ),
          ),
        ],
      ),
    );
  }

  Widget cardContent(
      {required BuildContext context, required int count, data}) {
    return Expanded(
      child: ListView.builder(
        itemCount: count,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.all(4),
            height: 90,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: const Color.fromARGB(255, 250, 250, 250),
            ),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: CachedNetworkImage(
                    height: 65,
                    width: 65,
                    fit: BoxFit.cover,
                    imageUrl: data.data?[index].avatar ?? "",
                    progressIndicatorBuilder:
                        (context, url, downloadProgress) =>
                            CircularProgressIndicator(
                                value: downloadProgress.progress),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                  ),
                ),
                Column(
                  children: [
                    Container(
                      height: 60,
                      padding: const EdgeInsets.only(
                          top: 10, bottom: 4, right: 20, left: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              const FaIcon(
                                // ignore: deprecated_member_use
                                FontAwesomeIcons.tags,
                                color: Color.fromARGB(251, 75, 75, 75),
                                size: 18,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(
                                data.data?[index].profile.firstName ?? "",
                                style: GoogleFonts.openSans(
                                  fontStyle: FontStyle.normal,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                  color: const Color.fromARGB(239, 75, 75, 75),
                                ),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Text(
                                data.data?[index].profile.lastName ?? "",
                                style: GoogleFonts.openSans(
                                  fontStyle: FontStyle.normal,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                  color: const Color.fromARGB(239, 75, 75, 75),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                "${data.data?[index].profile.age.toString() ?? 0.toString()} Years old",
                                style: GoogleFonts.openSans(
                                  fontStyle: FontStyle.normal,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14,
                                  color: const Color.fromARGB(239, 75, 75, 75),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
