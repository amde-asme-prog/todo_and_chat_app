import 'package:flutter/material.dart';
import 'package:todo_chat_app/screens/chat_screen.dart';

class Chat extends StatefulWidget {
  const Chat({super.key});

  @override
  State<Chat> createState() => _ChatState();
}

class _ChatState extends State<Chat> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
        appBar: AppBar(
          shadowColor: const Color.fromARGB(136, 189, 156, 156),
          bottomOpacity: 0.7,
          leading: Builder(
            builder: (BuildContext ctx) => IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {
                Scaffold.of(ctx).openDrawer();
              },
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.lock_open_outlined),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.search),
            ),
          ],
          bottom: TabBar(
            controller: _tabController,
            isScrollable: true,
            indicatorColor: Colors.deepPurple,
            indicatorWeight: 3.0,
            tabs: const [
              Tab(text: 'All Chats'),
              Tab(text: 'Groups'),
              Tab(text: 'Channels'),
              Tab(text: 'Bots'),
            ],
          ),
        ),
        drawer: const ChatDrawer(),
        body: TabBarView(
          controller: _tabController,
          children: [
            ChatListPage(),
            const Center(child: Text('Groups')),
            const Center(child: Text('Channels')),
            const Center(child: Text('Bots')),
          ],
        ),
      ),
    );
  }

  // Simulated list of chats like Telegram
}

class ChatListPage extends StatelessWidget {
  ChatListPage({super.key});
  final List<Map<String, String>> chats = [
    {'name': 'John Doe', 'message': 'Hey! How are you?', 'time': '10:00 AM'},
    {
      'name': 'Flutter Devs',
      'message': 'New Flutter update is awesome!',
      'time': '9:45 AM'
    },
    {
      'name': 'Jane Smith',
      'message': 'Let\'s catch up tomorrow.',
      'time': 'Yesterday'
    },
    {
      'name': 'Family Group',
      'message': 'Happy Birthday, Mom!',
      'time': 'Yesterday'
    },
  ];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: chats.length,
      itemBuilder: (context, index) {
        final chat = chats[index];
        return ListTile(
          leading: const CircleAvatar(
            backgroundImage: AssetImage('assets/profile_picture.png'),
          ),
          title: Text(chat['name']!),
          subtitle: Text(chat['message']!),
          trailing: Text(chat['time']!),
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (BuildContext context) => const ChatScreen(),
              ),
            );
          },
        );
      },
    );
  }
}

class ChatDrawer extends StatelessWidget {
  const ChatDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const UserAccountsDrawerHeader(
            accountName: Text(
              'Amde Asme',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18.0,
              ),
            ),
            accountEmail: Text('+1 (123) 456-7890'),
            currentAccountPicture: CircleAvatar(
              backgroundImage: AssetImage(
                  'assets/profile_picture.png'), // Replace with actual path
            ),
          ),
          ListTile(
            leading: const Icon(Icons.account_circle),
            title: const Text('User name'),
            onTap: () {
              // Handle profile tap
            },
          ),
          ListTile(
            leading: const Icon(Icons.add),
            title: const Text('Add Account'),
            onTap: () {
              // Handle add account tap
            },
          ),
          ListTile(
            leading: const Icon(Icons.account_circle_outlined),
            title: const Text('My Profile'),
            onTap: () {
              // Handle profile tap
            },
          ),
          ListTile(
            leading: const Icon(Icons.group),
            title: const Text('New Group'),
            onTap: () {
              // Handle new group tap
            },
          ),
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text('Contacts'),
            onTap: () {
              // Handle contacts tap
            },
          ),
          ListTile(
            leading: const Icon(Icons.call),
            title: const Text('Calls'),
            onTap: () {
              // Handle calls tap
            },
          ),
          ListTile(
            leading: const Icon(Icons.location_pin),
            title: const Text('People Nearby'),
            onTap: () {
              // Handle nearby people tap
            },
          ),
          ListTile(
            leading: const Icon(Icons.bookmark),
            title: const Text('Saved Messages'),
            onTap: () {
              // Handle saved messages tap
            },
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Settings'),
            onTap: () {
              // Handle settings tap
            },
          ),
          ListTile(
            leading: const Icon(Icons.person_add),
            title: const Text('Invite Friends'),
            onTap: () {
              // Handle invite friends tap
            },
          ),
          ListTile(
            leading: const Icon(Icons.question_mark_rounded),
            title: const Text('Telegram Features'),
            onTap: () {
              // Handle telegram features tap
            },
          ),
        ],
      ),
    );
  }
}
