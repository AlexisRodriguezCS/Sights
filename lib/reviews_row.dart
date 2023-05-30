import 'package:flutter/material.dart';

class ReviewRow extends StatefulWidget {
  final String description;
  final String title;

  const ReviewRow({Key? key, required this.description, required this.title})
      : super(key: key);

  @override
  _ReviewRowState createState() => _ReviewRowState();
}

class _ReviewRowState extends State<ReviewRow> {
  int like = 0;
  int dislike = 0;

  void _incrementLikes() {
    setState(() {
      like++;
    });
  }

  void _decrementLikes() {
    setState(() {
      dislike++;
    });
  }

  @override
  Widget build(BuildContext context) {
    const Color boxColor = Color(0xff161a1d);
    const Color textColor = Color(0xffEEEEEE);
    const Color likeBtnColor = Color(0xff80ed99);
    const Color dislikeBtnColor = Color(0xffd62828);
    const Color btnTextColor = Color(0xff000000);
    const TextStyle titleStyle = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 18.0,
      color: textColor,
    );
    const TextStyle descriptionStyle = TextStyle(
      fontSize: 14,
      color: textColor,
    );
    const TextStyle buttonLabelStyle = TextStyle(
      fontSize: 12.0,
      color: btnTextColor,
    );

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      margin: const EdgeInsets.symmetric(horizontal: 15.0),
      height: 160.0,
      decoration: BoxDecoration(
        color: boxColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Column(
            children: [
              Text(
                widget.title,
                style: titleStyle,
              ),
              Text(
                widget.description,
                style: descriptionStyle,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 15.0),
                child: SizedBox(
                  height: 25.0,
                  width: 110.0,
                  child: ElevatedButton.icon(
                    style: ButtonStyle(
                      backgroundColor:
                      MaterialStateProperty.all(likeBtnColor),
                    ),
                    onPressed: _incrementLikes,
                    icon: const Icon(
                      Icons.thumb_up,
                      size: 12.0,
                      color: btnTextColor,
                    ),
                    label: Text(
                      'Likes: $like',
                      style: buttonLabelStyle,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 25.0,
                width: 110.0,
                child: ElevatedButton.icon(
                  style: ButtonStyle(
                    backgroundColor:
                    MaterialStateProperty.all(dislikeBtnColor),
                  ),
                  onPressed: _decrementLikes,
                  icon: const Icon(
                    Icons.thumb_down,
                    size: 12.0,
                    color: btnTextColor,
                  ),
                  label: Text(
                    'Dislikes: $dislike',
                    style: buttonLabelStyle,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
