import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),
            const CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage('https://sm.askmen.com/t/askmen_in/article/f/facebook-p/facebook-profile-picture-affects-chances-of-gettin_fr3n.1200.jpg'),
            ),
            const SizedBox(height: 10),
            TextButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.edit, color: Colors.blueAccent),
              label: const Text('Edit Profile', style: TextStyle(color: Colors.blueAccent)),
            ),
            const SizedBox(height: 20),
            ProfileDetailCard(icon: Icons.person, label: 'Name', value: 'John Doe'),
            ProfileDetailCard(icon: Icons.email, label: 'Email', value: 'johndoe@example.com'),
            ProfileDetailCard(icon: Icons.phone, label: 'Phone', value: '+1 234 567 890'),
            ProfileDetailCard(icon: Icons.location_on, label: 'Country', value: 'United States'),
            ProfileDetailCard(icon: Icons.card_giftcard, label: 'Credit Points', value: '1500'),
          ],
        ),
      ),
    );
  }
}

class ProfileDetailCard extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const ProfileDetailCard({Key? key, required this.icon, required this.label, required this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      child: Card(
        elevation: 3,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: ListTile(
          leading: Icon(icon, color: Colors.blueAccent),
          title: Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),
          subtitle: Text(value),
        ),
      ),
    );
  }
}