import 'package:auto_size_text/auto_size_text.dart';
import 'package:daily_mobile_app/src/domain/entities/post.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class PostsItem extends StatelessWidget {
  final Post _post;
  final maxTags = 2;
  final cardHeight = 280.0; // estimated card height based on intuition

  const PostsItem(this._post, {Key key}) : super(key: key);

  String timeFromPublicationDiff(Duration createdAt) {
    if (createdAt.inMinutes > 60 * 24 * 2) {
      return DateFormat.yMMMMd().format(DateTime.parse(_post.createdAt));
    } else if (createdAt.inMinutes > 60) {
      return "${createdAt.inMinutes ~/ 60}h ago";
    } else {
      return "${createdAt.inMinutes}m ago";
    }
  }

  @override
  Widget build(BuildContext context) {
    final cornerRadius = Radius.circular(10);
    var tags = _post.tags.length > maxTags
        ? _post.tags
                .sublist(0, maxTags)
                .map((v) => "#" + v[0].toUpperCase() + v.substring(1))
                .join(", ") +
            ", +${_post.tags.length - maxTags}"
        : _post.tags
            .map((v) => "#" + v[0].toUpperCase() + v.substring(1))
            .join(", ");
    String timeFromPublication = timeFromPublicationDiff(
        DateTime.now().difference(DateTime.parse(_post.createdAt)));

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
      padding: EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 16),
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
              AutoSizeText(
                tags,
                style: TextStyle(
                    color: Theme.of(context).secondaryHeaderColor,
                    fontSize: 12),
                maxLines: 1,
              ),
              _post.readTime != null && _post.readTime != 0
                  ? Text("${_post?.readTime} min read",
                      style: TextStyle(
                          color: Theme.of(context).secondaryHeaderColor,
                          fontSize: 12))
                  : Text(""),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(top: 4, bottom: 4),
            child: Divider(
              color: Theme.of(context).dividerColor,
            ),
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
                            width: 24, height: 24),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 16),
                      child: Text(
                        timeFromPublication,
                        style: TextStyle(
                            color: Theme.of(context).secondaryHeaderColor,
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
                    padding: EdgeInsets.only(right: 8),
                    child: Image.asset(
                      'assets/images/bookmark.png',
                      height: 24,
                      width: 24,
                    ),
                  ),
                  Image.asset(
                    'assets/images/three_dots.png',
                    height: 24,
                    width: 24,
                  )
                ],
              )
            ],
          )
        ],
      ),
    );

    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Column(children: <Widget>[imageContainer, infoContainer]),
    );
  }
}
