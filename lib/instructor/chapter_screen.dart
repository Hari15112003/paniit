import 'package:flutter/material.dart';
import 'package:name/instructor/add_media.dart';
import 'package:name/utilities/navigation.dart';

import '../custom/custom_size.dart';

class ChapterScreen extends StatefulWidget {
  const ChapterScreen(
      {super.key,
      required this.courseName,
      required this.totalLessons,
      required this.chapterName,
      required this.chapterCount});
  final String courseName;
  final int totalLessons;
  final int chapterCount;
  final String chapterName;
  @override
  State<ChapterScreen> createState() => _ChapterScreenState();
}

class _ChapterScreenState extends State<ChapterScreen> {
  List<TextEditingController> textEditor = [];

  @override
  void initState() {
    textEditor.addAll(List.generate(widget.totalLessons,
        (index) => TextEditingController(text: "Lesson ${index + 1} ")));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    CustomSizeData customSizeData = CustomSizeData.from(context);
    double height = customSizeData.height;
    double width = customSizeData.width;

    return SafeArea(
        child: Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () {
                  navigationpop(context: context);
                },
              ),
              Text(
                widget.courseName,
                style: const TextStyle(fontSize: 20),
              )
            ],
          ),
          Expanded(
            flex: 2,
            child: SizedBox(
              // color: Colors.amber,
              height: height * 0.7,
              width: width * 0.9,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: ListView.builder(
                    itemCount: textEditor.length,
                    itemBuilder: (BuildContext context, int index) {
                      return textField(
                          text: "Lesson ${index + 1}",
                          controller: textEditor[index],
                          height: height,
                          width: width);
                    }),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              OutlinedButton(
                  onPressed: () {
                    List<String> values = textEditor
                        .map((controller) => controller.text)
                        .toList();
                    navigationpush(
                        widget: AddMedia(
                          chapterCount: widget.chapterCount,
                          totalLessons: widget.totalLessons,
                          courseName: widget.courseName,
                          lessonName: values,
                          chapterName: widget.chapterName,
                        ),
                        context: context);
                  },
                  child: const Text("Add Media")),
              OutlinedButton(
                  onPressed: () {}, child: const Text("Create New Lesson")),
            ],
          )
        ],
      ),
    ));
  }

  Widget textField(
      {required String text,
      required TextEditingController controller,
      required double height,
      required double width}) {
    return SizedBox(
      height: height * 0.15,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(text),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: TextFormField(
              controller: controller,
              decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                  border: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.black),
                      borderRadius: BorderRadius.circular(12))),
            ),
          )
        ],
      ),
    );
  }
}
