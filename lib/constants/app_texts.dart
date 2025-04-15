import 'package:ibraheem_portfolio/models/project_models.dart';

class AppTexts {
  final String name = 'Your Name';
  final String title = 'Flutter Developer';
  final String profileImage = 'assets/images/profile.jpg';

  final String bio = '''
I'm a passionate Flutter developer with 3+ years of experience building 
cross-platform mobile and web applications. I specialize in creating 
beautiful, performant apps with great user experiences.
''';

  final List<String> skills = [
    'Flutter',
    'Dart',
    'Firebase',
    'REST APIs',
    'BLoC',
    'Provider',
    'GetX',
    'UI/UX Design',
    'Git',
    'CI/CD',
  ];

  final List<Map<String, String>> experiences = [
    {
      'title': 'Senior Flutter Developer',
      'company': 'Tech Company Inc.',
      'duration': '2021 - Present',
      'description': 'Led the development of multiple Flutter applications...',
    },
    {
      'title': 'Junior Flutter Developer',
      'company': 'Startup Co.',
      'duration': '2019 - 2021',
      'description': 'Developed and maintained Flutter applications...',
    },
  ];

  final List<Project> projects = [
    Project(
      title: 'E-Commerce App',
      description:
          'A full-featured e-commerce application with payment integration',
      technologies: ['Flutter', 'Firebase', 'Stripe'],
      imageUrl: 'assets/images/project1.jpg',
      githubUrl: 'https://github.com/yourusername/ecommerce-app',
    ),
    Project(
      title: 'Weather App',
      description: 'Real-time weather forecasting application',
      technologies: ['Flutter', 'OpenWeather API', 'BLoC'],
      imageUrl: 'assets/images/project2.jpg',
      githubUrl: 'https://github.com/yourusername/weather-app',
    ),
    Project(
      title: 'Task Manager',
      description: 'Productivity app for managing daily tasks',
      technologies: ['Flutter', 'Hive', 'Provider'],
      imageUrl: 'assets/images/project3.jpg',
      githubUrl: 'https://github.com/yourusername/task-manager',
    ),
    Project(
      title: 'Social Media App',
      description: 'A social networking platform for communities',
      technologies: ['Flutter', 'Firebase', 'GetX'],
      imageUrl: 'assets/images/project4.jpg',
      githubUrl: 'https://github.com/yourusername/social-app',
    ),
  ];

  final Map<String, Map<String, String>> socialLinks = {
    'GitHub': {
      'icon': 'assets/icons/github.png',
      'url': 'https://github.com/yourusername',
    },
    'LinkedIn': {
      'icon': 'assets/icons/linkedin.png',
      'url': 'https://linkedin.com/in/yourusername',
    },
    'Twitter': {
      'icon': 'assets/icons/twitter.png',
      'url': 'https://twitter.com/yourusername',
    },
    'Email': {
      'icon': 'assets/icons/email.png',
      'url': 'mailto:your.email@example.com',
    },
  };
}
