import 'package:design/messages.dart';
import 'package:flutter/material.dart';

class Chats extends StatefulWidget {
  const Chats({super.key});

  @override
  State<Chats> createState() => _ChatsState();
}

class _ChatsState extends State<Chats> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: const Color.fromARGB(255, 143, 40, 245),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 120, 61, 246),
              Color.fromARGB(255, 179, 152, 239)
            ],
          ),
        ),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  const SizedBox(
                    height: 60,
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Message\'s (32)',
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                      Icon(
                        Icons.search,
                        color: Colors.white,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 5, horizontal: 10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.white),
                        child: const Text(
                          'Friends',
                          style: TextStyle(fontSize: 15, color: Colors.blue),
                        ),
                      ),
                      const Text(
                        'Teachers',
                        style: TextStyle(fontSize: 15, color: Colors.white),
                      ),
                      const Text(
                        'Groups',
                        style: TextStyle(fontSize: 15, color: Colors.white),
                      ),
                      const Text(
                        'Add More',
                        style: TextStyle(fontSize: 15, color: Colors.white),
                      ),
                    ],
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40)),
                ),
                child: ListView.builder(
                  itemCount: 8,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        ListTile(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const Messages(
                                  userName: 'Ahsan Malik',
                                  userImage: 'assets/images.jpg',
                                ),
                              ),
                            );
                          },
                          leading: const CircleAvatar(
                            radius:
                                30, // Adjust the size of the circular avatar
                            backgroundImage: AssetImage('assets/images.jpg'),
                          ),
                          title: const Text('Ahsan Malik'),
                          subtitle: const Text("How are you!"),
                          trailing: Column(
                            children: [
                              const SizedBox(height: 10,),
                              Container(
                                height: 20,
                                width: 20,
                                decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Color.fromARGB(255, 129, 84, 225)),
                                child: const Center(
                                    child: Text(
                                  "1",
                                  style: TextStyle(color: Colors.white),
                                )),
                              ),
                              const SizedBox(height: 7,),
                              const Text('9:43 AM'),
                            ],
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8),
                          child: Divider(
                            
                            thickness: 1, 
                            color: Colors.grey, 
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
