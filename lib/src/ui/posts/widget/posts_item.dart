import 'package:daily_mobile_app/src/domain/entities/post.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class PostsItem extends StatelessWidget {
  final Post _post;

  const PostsItem(this._post, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cornerRadius = Radius.circular(10);
    final cardHeight = 280.0; // estimated card height based on intuition
    final maxTags = 2;
    var tags = _post.tags.length > maxTags
        ? _post.tags
                .sublist(0, maxTags)
                .map((v) => "#" + v[0].toUpperCase() + v.substring(1))
                .join(", ") +
            ", +${_post.tags.length - maxTags}"
        : _post.tags
            .map((v) => "#" + v[0].toUpperCase() + v.substring(1))
            .join(", ");
    final publishedAt =
        DateTime.now().difference(DateTime.parse(_post.publishedAt));
    String timeFromPublication;
    if (publishedAt.inMinutes > 60 * 24 * 1.3) {
      timeFromPublication = DateFormat.yMMMMd().format(DateTime.parse(_post.publishedAt));
    } else if (publishedAt.inMinutes > 60) {
      timeFromPublication = "${publishedAt.inMinutes ~/ 60}h ago";
    } else {
      timeFromPublication = "${publishedAt}m ago";
    }

    var imageContainer = LayoutBuilder(
        builder: (BuildContext buildContext, BoxConstraints constraints) {
      return Container(
        height: cardHeight / 2,
        width: constraints.maxWidth,
        child: ClipRRect(
          borderRadius:
              BorderRadius.only(topLeft: cornerRadius, topRight: cornerRadius),
          child: FittedBox(
            fit: BoxFit.fitWidth,
            child: Transform.scale(
              scale: 1.1,
              child: Image.network(_post.image),
            ),
          ),
        ),
      );
    });

    var infoContainer = Container(
      padding: EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 15),
      decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: BorderRadius.all(cornerRadius)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(bottom: 20),
            alignment: Alignment.centerLeft,
            child: Text(
              _post.title,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                tags,
                style: TextStyle(
                    color: Color.fromARGB(255, 153, 153, 156), fontSize: 12),
              ),
              _post.readTime != null
                  ? Text("${_post?.readTime} min read",
                      style: TextStyle(
                          color: Color.fromARGB(255, 153, 153, 156),
                          fontSize: 12))
                  : Text(""),
            ],
          ),
          Divider(
            color: Color.fromARGB(255, 77, 77, 77),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                child: Row(
                  children: <Widget>[
                    ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(3)),
                      child: FittedBox(
                        fit: BoxFit.fitWidth,
                        child: Image.network(_post.publicationImage,
                            width: 25, height: 25),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Text(
                        timeFromPublication,
                        style: TextStyle(
                            color: Color.fromARGB(255, 153, 153, 156),
                            fontSize: 12,
                            fontStyle: FontStyle.italic),
                      ),
                    )
                  ],
                ),
              ),
              Row(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(right: 10),
                    child: Image.asset(
                      'assets/images/bookmark.png',
                      height: 20,
                      width: 20,
                    ),
                  ),
                  Image.asset(
                    'assets/images/three_dots.png',
                    height: 20,
                    width: 20,
                  )
                ],
              )
            ],
          )
        ],
      ),
    );

    return Container(
        child: Container(
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Column(children: <Widget>[imageContainer, infoContainer]),
    ));
  }
}
