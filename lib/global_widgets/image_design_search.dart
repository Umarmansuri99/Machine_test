import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// Note : photo video app bar worked diffrently
ClipRRect ImageDesignSearch(double height, double width, String img_url,
        double borderRadius, String default_img) =>
    ClipRRect(
        borderRadius: BorderRadius.circular(borderRadius),
        child: (identical(img_url, 'show_more'))
            ? Image(
                fit: BoxFit.fill,
                height: height,
                width: width,
                color: Colors.amber,
                image: AssetImage(""),
              )
            : Image(
                errorBuilder: (BuildContext context, Object exception,
                    StackTrace? stackTrace) {
                  return Image.asset(
                    default_img,
                    height: 30,
                    width: 30,
                  );
                },
                fit: BoxFit.fill,
                height: height,
                width: width,
                image: NetworkImage(img_url),
              ));
