import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';

class ChatDetailScreen extends StatefulWidget {
  const ChatDetailScreen({super.key});

  @override
  State<ChatDetailScreen> createState() => _ChatDetailScreenState();
}

class _ChatDetailScreenState extends State<ChatDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: ListTile(
          contentPadding: EdgeInsets.zero,
          horizontalTitleGap: Sizes.size7,
          leading: Stack(
            children: [
              const CircleAvatar(
                radius: Sizes.size24,
                foregroundImage: NetworkImage(
                  "https://avatars.githubusercontent.com/u/11994918?v=4",
                ),
                child: Text("DH"),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: Container(
                  width: Sizes.size18,
                  height: Sizes.size18,
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(
                      Sizes.size24,
                    ),
                    border: Border.all(
                      color: Colors.white,
                      width: Sizes.size3,
                    ),
                  ),
                ),
              ),
            ],
          ),
          title: const Text(
            "DH",
            style: TextStyle(
              fontWeight: FontWeight.w600,
            ),
          ),
          subtitle: const Text("Active now"),
          trailing: const Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              FaIcon(
                FontAwesomeIcons.flag,
                color: Colors.black,
                size: Sizes.size20,
              ),
              Gaps.h32,
              FaIcon(
                FontAwesomeIcons.ellipsis,
                color: Colors.black,
                size: Sizes.size20,
              ),
            ],
          ),
        ),
      ),
      body: Stack(
        children: [
          ListView.separated(
            padding: const EdgeInsets.symmetric(
              vertical: Sizes.size20,
              horizontal: Sizes.size14,
            ),
            itemBuilder: (context, index) {
              final isMine = index % 2 == 0;
              return Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment:
                    isMine ? MainAxisAlignment.end : MainAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.all(
                      Sizes.size14,
                    ),
                    decoration: BoxDecoration(
                      color:
                          isMine ? Colors.blue : Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.only(
                        topLeft: const Radius.circular(
                          Sizes.size20,
                        ),
                        topRight: const Radius.circular(
                          Sizes.size20,
                        ),
                        bottomLeft: Radius.circular(
                          isMine ? Sizes.size20 : 0,
                        ),
                        bottomRight: Radius.circular(
                          !isMine ? Sizes.size20 : 0,
                        ),
                      ),
                    ),
                    child: const Text(
                      "This is messages.",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: Sizes.size16,
                      ),
                    ),
                  ),
                ],
              );
            },
            separatorBuilder: (context, index) => Gaps.v20,
            itemCount: 10,
          ),
          Positioned(
            bottom: 0,
            width: MediaQuery.of(context).size.width,
            child: BottomAppBar(
              color: Colors.grey.shade50,
              child: Row(
                children: [
                  const Expanded(
                    child: TextField(),
                  ),
                  Gaps.h20,
                  Container(
                    child: const FaIcon(
                      FontAwesomeIcons.paperPlane,
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
