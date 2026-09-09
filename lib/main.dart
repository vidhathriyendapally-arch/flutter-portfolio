import 'package:flutter/material.dart';

void main() {
  runApp(const PortfolioApp());
}

class PortfolioApp extends StatelessWidget {
  const PortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My Portfolio',
      theme: ThemeData(
        useMaterial3: true,
        fontFamily: 'Arial',
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF6C63FF),
        ),
      ),
      home: const PortfolioHome(),
    );
  }
}

class PortfolioHome extends StatefulWidget {
  const PortfolioHome({super.key});

  @override
  State<PortfolioHome> createState() => _PortfolioHomeState();
}

class _PortfolioHomeState extends State<PortfolioHome> {
  int selectedIndex = 0;

  final List<String> menuItems = [
    'Home',
    'About Me',
    'Skills',
    'Projects',
  ];

  void changePage(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F7FF),

      // Desktop navigation
      appBar: MediaQuery.of(context).size.width > 700
          ? AppBar(
              elevation: 0,
              backgroundColor: Colors.white,
              title: const Text(
                'My Portfolio',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                  color: Color(0xFF29263D),
                ),
              ),
              actions: [
                for (int i = 0; i < menuItems.length; i++)
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 6),
                    child: TextButton(
                      onPressed: () => changePage(i),
                      child: Text(
                        menuItems[i],
                        style: TextStyle(
                          color: selectedIndex == i
                              ? const Color(0xFF6C63FF)
                              : const Color(0xFF555166),
                          fontWeight: selectedIndex == i
                              ? FontWeight.bold
                              : FontWeight.normal,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                const SizedBox(width: 20),
              ],
            )
          : null,

      body: IndexedStack(
        index: selectedIndex,
        children: const [
          HomePage(),
          AboutPage(),
          SkillsPage(),
          ProjectsPage(),
        ],
      ),

      // Mobile navigation
      bottomNavigationBar: MediaQuery.of(context).size.width <= 700
          ? NavigationBar(
              selectedIndex: selectedIndex,
              onDestinationSelected: changePage,
              backgroundColor: Colors.white,
              destinations: const [
                NavigationDestination(
                  icon: Icon(Icons.home_outlined),
                  selectedIcon: Icon(Icons.home),
                  label: 'Home',
                ),
                NavigationDestination(
                  icon: Icon(Icons.person_outline),
                  selectedIcon: Icon(Icons.person),
                  label: 'About',
                ),
                NavigationDestination(
                  icon: Icon(Icons.code_outlined),
                  selectedIcon: Icon(Icons.code),
                  label: 'Skills',
                ),
                NavigationDestination(
                  icon: Icon(Icons.work_outline),
                  selectedIcon: Icon(Icons.work),
                  label: 'Projects',
                ),
              ],
            )
          : null,
    );
  }
}

// ------------------------------------------------------------
// HOME PAGE
// ------------------------------------------------------------

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isMobile = width <= 700;

    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: isMobile ? 25 : 70,
          vertical: isMobile ? 40 : 70,
        ),
        child: isMobile
            ? const Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ProfileCircle(),
                  SizedBox(height: 30),
                  HomeText(),
                ],
              )
            : const Row(
                children: [
                  Expanded(
                    child: HomeText(),
                  ),
                  SizedBox(width: 70),
                  ProfileCircle(),
                ],
              ),
      ),
    );
  }
}

class ProfileCircle extends StatelessWidget {
  const ProfileCircle({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 230,
      height: 230,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: const LinearGradient(
          colors: [
            Color(0xFF6C63FF),
            Color(0xFF9C8CFF),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.12),
            blurRadius: 25,
            offset: const Offset(0, 12),
          ),
        ],
      ),
      child: const Center(
        child: Text(
          'VR',
          style: TextStyle(
            color: Colors.white,
            fontSize: 65,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

class HomeText extends StatelessWidget {
  const HomeText({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width <= 700;

    return Column(
      crossAxisAlignment:
          isMobile ? CrossAxisAlignment.center : CrossAxisAlignment.start,
      children: [
        const Text(
          'Hello, I am',
          style: TextStyle(
            fontSize: 24,
            color: Color(0xFF6C63FF),
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 10),
        const Text(
          'Vidhãthri Reddy',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 48,
            fontWeight: FontWeight.bold,
            color: Color(0xFF29263D),
          ),
        ),
        const SizedBox(height: 12),
        const Text(
          'B.Tech CSE – Applied Mathematics',
          style: TextStyle(
            fontSize: 21,
            color: Color(0xFF555166),
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 8),
        const Text(
          '3rd Year | CR Rao AIMSCS',
          style: TextStyle(
            fontSize: 18,
            color: Color(0xFF777284),
          ),
        ),
        const SizedBox(height: 25),
        SizedBox(
          width: 600,
          child: Text(
            'I am a Computer Science student passionate about web development and software development. I enjoy building useful applications and exploring new technologies to solve real-world problems.',
            textAlign: isMobile ? TextAlign.center : TextAlign.left,
            style: const TextStyle(
              fontSize: 17,
              height: 1.7,
              color: Color(0xFF625E70),
            ),
          ),
        ),
        const SizedBox(height: 30),
        Wrap(
          spacing: 15,
          runSpacing: 12,
          alignment:
              isMobile ? WrapAlignment.center : WrapAlignment.start,
          children: [
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF6C63FF),
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(
                  horizontal: 25,
                  vertical: 15,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Text(
                'Explore My Work',
                style: TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

// ------------------------------------------------------------
// ABOUT PAGE
// ------------------------------------------------------------

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width <= 700;

    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 25 : 70,
        vertical: 50,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const PageTitle(
            title: 'About Me',
            subtitle: 'A little about me and my interests',
          ),
          const SizedBox(height: 35),

          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(30),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 15,
                  offset: const Offset(0, 7),
                ),
              ],
            ),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Who Am I?',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF29263D),
                  ),
                ),
                SizedBox(height: 15),
                Text(
                  'I am a third-year B.Tech Computer Science student specializing in Applied Mathematics at CR Rao AIMSCS. I have a strong interest in web development and software development.',
                  style: TextStyle(
                    fontSize: 17,
                    height: 1.7,
                    color: Color(0xFF625E70),
                  ),
                ),
                SizedBox(height: 15),
                Text(
                  'I enjoy learning new technologies, developing practical applications, and turning ideas into working solutions. My goal is to continuously improve my technical skills and build projects that are useful and user-friendly.',
                  style: TextStyle(
                    fontSize: 17,
                    height: 1.7,
                    color: Color(0xFF625E70),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 30),

          Row(
            children: [
              Expanded(
                child: InfoCard(
                  icon: Icons.school,
                  title: 'Education',
                  text: 'B.Tech CSE – Applied Mathematics',
                ),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: InfoCard(
                  icon: Icons.computer,
                  title: 'Expertise',
                  text: 'Web Development',
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// ------------------------------------------------------------
// SKILLS PAGE
// ------------------------------------------------------------

class SkillsPage extends StatelessWidget {
  const SkillsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width <= 700;

    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 25 : 70,
        vertical: 50,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const PageTitle(
            title: 'My Skills',
            subtitle: 'Technologies and tools I work with',
          ),
          const SizedBox(height: 35),

          Wrap(
            spacing: 18,
            runSpacing: 18,
            children: const [
              SkillCard(
                icon: Icons.code,
                title: 'Programming',
                skills: 'Java\nC',
              ),
              SkillCard(
                icon: Icons.web,
                title: 'Web Development',
                skills: 'HTML\nCSS\nNode.js',
              ),
              SkillCard(
                icon: Icons.storage,
                title: 'Database',
                skills: 'MySQL',
              ),
              SkillCard(
                icon: Icons.build,
                title: 'Tools',
                skills: 'VS Code\nEclipse',
              ),
              SkillCard(
                icon: Icons.cloud,
                title: 'Version Control',
                skills: 'Git\nGitHub',
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// ------------------------------------------------------------
// PROJECTS PAGE
// ------------------------------------------------------------

class ProjectsPage extends StatelessWidget {
  const ProjectsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width <= 700;

    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 25 : 70,
        vertical: 50,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const PageTitle(
            title: 'My Projects',
            subtitle: 'Some of the projects I have worked on',
          ),
          const SizedBox(height: 35),

          const ProjectCard(
            number: '01',
            title: 'Smart Semantic Video Transcription System',
            technologies:
                'Python • Flask • OpenAI Whisper • FFmpeg • MoviePy',
            description:
                'An AI-powered video transcription system that generates timestamped and intelligent transcripts from video. It uses speech-to-text, multilingual processing and contextual analysis to provide transcripts beyond standard subtitling.',
          ),

          const SizedBox(height: 25),

          const ProjectCard(
            number: '02',
            title: 'ShopSphere — Full Stack E-Commerce Platform',
            technologies:
                'React.js • Node.js • Express.js • MySQL • REST APIs',
            description:
                'A full-stack e-commerce platform featuring authentication, product management, cart, wishlist and order processing. It includes REST APIs, MySQL database integration and an admin dashboard for managing users, products and orders.',
          ),
        ],
      ),
    );
  }
}

// ------------------------------------------------------------
// REUSABLE WIDGETS
// ------------------------------------------------------------

class PageTitle extends StatelessWidget {
  final String title;
  final String subtitle;

  const PageTitle({
    super.key,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 38,
            fontWeight: FontWeight.bold,
            color: Color(0xFF29263D),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          subtitle,
          style: const TextStyle(
            fontSize: 17,
            color: Color(0xFF777284),
          ),
        ),
        const SizedBox(height: 12),
        Container(
          width: 65,
          height: 5,
          decoration: BoxDecoration(
            color: const Color(0xFF6C63FF),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ],
    );
  }
}

class InfoCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String text;

  const InfoCard({
    super.key,
    required this.icon,
    required this.title,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 12,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            icon,
            size: 32,
            color: const Color(0xFF6C63FF),
          ),
          const SizedBox(height: 12),
          Text(
            title,
            style: const TextStyle(
              fontSize: 19,
              fontWeight: FontWeight.bold,
              color: Color(0xFF29263D),
            ),
          ),
          const SizedBox(height: 7),
          Text(
            text,
            style: const TextStyle(
              color: Color(0xFF625E70),
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }
}

class SkillCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String skills;

  const SkillCard({
    super.key,
    required this.icon,
    required this.title,
    required this.skills,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    double cardWidth;

    if (width <= 600) {
      cardWidth = width - 50;
    } else if (width <= 1000) {
      cardWidth = (width - 110) / 2;
    } else {
      cardWidth = 250;
    }

    return Container(
      width: cardWidth,
      padding: const EdgeInsets.all(25),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: const Color(0xFFE9E6FF),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 12,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: const Color(0xFFF0EEFF),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(
              icon,
              color: const Color(0xFF6C63FF),
              size: 28,
            ),
          ),
          const SizedBox(height: 18),
          Text(
            title,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Color(0xFF29263D),
            ),
          ),
          const SizedBox(height: 12),
          Text(
            skills,
            style: const TextStyle(
              fontSize: 16,
              height: 1.8,
              color: Color(0xFF625E70),
            ),
          ),
        ],
      ),
    );
  }
}

class ProjectCard extends StatelessWidget {
  final String number;
  final String title;
  final String technologies;
  final String description;

  const ProjectCard({
    super.key,
    required this.number,
    required this.title,
    required this.technologies,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(30),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(22),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 15,
            offset: const Offset(0, 7),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 55,
            height: 55,
            decoration: BoxDecoration(
              color: const Color(0xFF6C63FF),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Center(
              child: Text(
                number,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),
          ),

          const SizedBox(width: 22),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 23,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF29263D),
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  technologies,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF6C63FF),
                  ),
                ),
                const SizedBox(height: 15),
                Text(
                  description,
                  style: const TextStyle(
                    fontSize: 16,
                    height: 1.7,
                    color: Color(0xFF625E70),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}