import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class BuildTaskItem extends StatelessWidget {
  BuildTaskItem(
    this.atrticals, {
    super.key,
  });
  Map<String, dynamic> atrticals;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                  height: 140,
                  width: 140,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: CachedNetworkImage(
                      imageUrl: "${atrticals['urlToImage']}" ??
                          "https://image.cnbcfm.com/api/v1/image/107061533-1652703018960-img_2066.jpg?v=1652703099&w=1920&h=1080",
                      placeholder: (context, url) =>
                          Center(child: CircularProgressIndicator()),
                      errorWidget: (context, url, error) => Icon(Icons.error),
                    ),
                  )
                  // // margin: const EdgeInsets.all(20),
                  // decoration: BoxDecoration(
                  //   borderRadius: BorderRadius.circular(10),
                  //   image: DecorationImage(
                  //     image : CachedNetworkImage(
                  //       imageUrl:

                  //       )
                  //     // image: NetworkImage(
                  //     //   // https://i.ytimg.com/vi/78PSwr_p7To/maxresdefault.jpg
                  //     //     "${atrticals['urlToImage']}"),
                  //    // fit: BoxFit.cover,
                  //   ),
                  // ),
                  ),
              Expanded(
                child: Container(
                  height: 140,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20, bottom: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Text(
                            "${atrticals['title']}",
                            maxLines: 4,
                            style: Theme.of(context).textTheme.bodyText1,
                            // const TextStyle(
                            //   fontSize: 16,
                            //   fontWeight: FontWeight.w600,
                            //   overflow: TextOverflow.ellipsis,
                            // ),
                          ),
                        ),
                        Text(
                          "${atrticals['publishedAt']}",
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.grey,
                            fontWeight: FontWeight.w600,
                            overflow: TextOverflow.ellipsis,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          //const MyDevider()
        ],
      ),
    );
  }
}
