import 'package:flutter/material.dart';
import 'editprofile.dart'; // Import the edit profile screen

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool isDarkMode = false; // State variable for dark mode

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Center(
            child: Column(
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage('assets/profile_pic.png'),
                ),
                SizedBox(height: 16),
                Text(
                  'Yuan Goe',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF65A967),
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'onthegoe@email.com',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          Center(
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const EditProfileScreen()),
                );
              },
              child: const Text('Edit Profile'),
            ),
          ),
          const SizedBox(height: 32),
          SwitchListTile(
            title: const Text('Dark Mode'),
            value: isDarkMode, // Use the state variable
            onChanged: (bool value) {
              setState(() {
                isDarkMode = value; // Toggle state without applying dark mode
              });
            },
          ),
          ListTile(
            title: Text('Language'),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {},
          ),
          ListTile(
            title: Text('About'),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {},
          ),
          ListTile(
            title: Text('Terms and Conditions'),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {},
          ),
          ListTile(
            title: Text('Privacy Policy'),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {},
          ),
          ListTile(
            title: Text('Rate this App'),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {},
          ),
          ListTile(
            title: Text('Share this App'),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
