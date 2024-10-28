import 'package:flutter/material.dart';
import 'package:todo_chat_app/widgets/vertical_options.dart';

class UserProfileSheet extends StatelessWidget {
  const UserProfileSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          shadowColor: const Color.fromARGB(136, 189, 156, 156),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () => Navigator.pop(context),
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.videocam_outlined),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(Icons.call),
              onPressed: () {},
            ),
            const VerticalOptions(),
          ],
        ),
        body: const ProfileContent(),
      ),
    );
  }
}

class ProfileContent extends StatefulWidget {
  const ProfileContent({super.key});

  @override
  State<ProfileContent> createState() => _ProfileContentState();
}

class _ProfileContentState extends State<ProfileContent>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            const ListTile(
              minVerticalPadding: 0,
              contentPadding: EdgeInsets.all(0),
              leading: CircleAvatar(
                radius: 30,
                backgroundColor: Colors.white,
                child: Icon(Icons.person, size: 30, color: Colors.blue),
              ),
              title: Text("Amde Asme"),
              subtitle: Text("Last seen today at 10:00 AM"),
              trailing: CircleAvatar(
                radius: 30,
                backgroundColor: Colors.white,
                child: Icon(
                  Icons.message_outlined,
                ),
              ),
            ),
            const ListTile(
              contentPadding: EdgeInsets.all(0),
              title: Text(
                "+251 (123) 456-7890",
                style: TextStyle(fontSize: 12),
              ),
              subtitle: Text(
                "Mobile",
                style: TextStyle(fontSize: 8),
              ),
            ),
            const ListTile(
              contentPadding: EdgeInsets.all(0),
              title: Text(
                "Some text description of bio",
                style: TextStyle(fontSize: 12),
              ),
              subtitle: Text(
                "Bio",
                style: TextStyle(fontSize: 8),
              ),
            ),
            const ListTile(
              contentPadding: EdgeInsets.all(0),
              title: Text(
                "@amdeasme",
                style: TextStyle(fontSize: 12),
              ),
              subtitle: Text(
                "Username",
                style: TextStyle(fontSize: 8),
              ),
              trailing: Icon(Icons.qr_code),
            ),
            const ListTile(
              minVerticalPadding: 0,
              contentPadding: EdgeInsets.all(0),
              title: Text(
                "Notifications",
                style: TextStyle(fontSize: 12),
              ),
              subtitle: Text(
                "On",
                style: TextStyle(fontSize: 8),
              ),
              trailing: Icon(Icons.toggle_on),
            ),
            const SizedBox(height: 16),
            TabBar(
              controller: tabController,
              tabs: const [
                Tab(text: 'Posts'),
                Tab(text: 'Media'),
                Tab(text: 'Files'),
                Tab(text: 'Links'),
              ],
            ),
            SizedBox(
              height:
                  300, // Define a fixed height or dynamically based on content
              child: TabBarView(
                controller: tabController,
                children: const [
                  Center(
                    child: Text('Profile content'),
                  ),
                  Center(
                    child: Text('Media'),
                  ),
                  Center(
                    child: Text('Files'),
                  ),
                  Center(
                    child: Text('Links'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
