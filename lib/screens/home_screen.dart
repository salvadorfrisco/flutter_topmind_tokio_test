import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_topmind_tokio_test/widgets/product_card.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../services/auth_service.dart';
import '../widgets/section_card.dart';
import 'login_screen.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:provider/provider.dart';
import '../main.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final AuthService _authService = AuthService();
  User? _currentUser;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _currentUser = _authService.currentUser;
  }

  Future<void> _signOut() async {
    try {
      await _authService.signOut();
      if (mounted) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const LoginScreen()),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Erro ao fazer logout: $e'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    // debug: _currentUser: $_currentUser
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.black,
      drawer: Drawer(
        backgroundColor: Colors.black,
        child: Column(
          children: [
            Container(
              color: Colors.black,
              height: 140,
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Olá!',
                    style: TextStyle(color: Colors.white, fontSize: 14),
                  ),
                  SizedBox(height: 2),
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 24,
                        backgroundColor: Colors.white,
                        child: Icon(Icons.person, color: Colors.teal, size: 28),
                      ),
                      SizedBox(width: 16),
                      Text(
                        'Caio Maximo',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  _buildDrawerItem(Icons.settings, 'Home / Seguros'),
                  _buildDrawerItem(Icons.settings, 'Minhas Contratações'),
                  _buildDrawerItem(Icons.settings, 'Meus Sinistros'),
                  _buildDrawerItem(Icons.settings, 'Minha Família'),
                  _buildDrawerItem(Icons.settings, 'Meus Bens'),
                  _buildDrawerItem(Icons.settings, 'Pagamentos'),
                  _buildDrawerItem(Icons.settings, 'Coberturas'),
                  _buildDrawerItem(Icons.settings, 'Validar Boleto'),
                  _buildDrawerItem(Icons.settings, 'Telefones Importantes'),
                  _buildDrawerItem(Icons.settings, 'Configurações'),
                  ListTile(
                    leading: const Icon(Icons.logout, color: Colors.teal),
                    title: const Text(
                      'Sair',
                      style: TextStyle(color: Colors.white),
                    ),
                    onTap: _signOut,
                  ),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 24),
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [
                    Color.fromARGB(255, 67, 167, 130),
                    Color.fromARGB(255, 193, 182, 64),
                  ],
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(
                    'assets/images/marina-foto.png',
                    height: 48,
                    width: 48,
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Dúvidas',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(height: 4),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text(
                      'Lorem ipsum...',
                      style: TextStyle(color: Colors.white, fontSize: 14),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.menu, color: Colors.white),
          onPressed: () => _scaffoldKey.currentState?.openDrawer(),
        ),
        title: Center(
          child: Image.asset(
            'assets/images/logo_tokio_branco_transp.png',
            height: 36,
            width: 120,
          ),
        ),
        actions: [
          Stack(
            children: [
              IconButton(
                icon: const Icon(Icons.notifications, color: Colors.white),
                onPressed: () {},
              ),
              Positioned(
                right: 12,
                top: 12,
                child: Container(
                  width: 10,
                  height: 10,
                  decoration: BoxDecoration(
                    color: Colors.red,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(width: 8),
        ],
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Linha 1: Degradê + avatar + texto
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [
                    Color.fromARGB(255, 67, 167, 130),
                    Color.fromARGB(255, 193, 182, 64),
                  ],
                ),
              ),
              child: Row(
                children: [
                  const CircleAvatar(
                    radius: 24,
                    backgroundColor: Colors.white,
                    child: Icon(Icons.person, color: Colors.teal, size: 28),
                  ),
                  const SizedBox(width: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'Bem vindo',
                        style: TextStyle(color: Colors.white, fontSize: 14),
                      ),
                      SizedBox(height: 2),
                      Text(
                        'Caio Maximo',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Container(
                  color: Colors.black,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 8),
                      const Text(
                        'Cotar e Contratar',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 16),
                      SizedBox(
                        height: 120,
                        child: SizedBox(
                          height: 120,
                          child: Consumer<ProductCardProvider>(
                            builder: (context, provider, _) {
                              final selected = provider.selectedIndex;
                              final cards = [
                                {
                                  'icon': Icons.directions_car,
                                  'label': 'Automóvel',
                                  'onTap': () {
                                    provider.select(0);
                                    _openExternalUrl('https://frisco.dev.br');
                                  },
                                },
                                {
                                  'icon': Icons.home,
                                  'label': 'Residência',
                                  'onTap': () => provider.select(1),
                                },
                                {
                                  'icon': Icons.favorite,
                                  'label': 'Vida',
                                  'onTap': () => provider.select(2),
                                },
                                {
                                  'icon': Icons.health_and_safety,
                                  'label': 'Acidentes Pessoais',
                                  'onTap': () => provider.select(3),
                                },
                              ];
                              return ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: cards.length,
                                itemBuilder: (context, i) {
                                  return ProductCard(
                                    icon: cards[i]['icon'] as IconData,
                                    label: cards[i]['label'] as String,
                                    gradient: const LinearGradient(
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                      colors: [
                                        Color.fromARGB(255, 67, 167, 130),
                                        Color.fromARGB(255, 193, 182, 64),
                                      ],
                                    ),
                                    iconColor: selected == i
                                        ? Colors.white
                                        : Colors.grey,
                                    onTap: cards[i]['onTap'] as VoidCallback,
                                  );
                                },
                              );
                            },
                          ),
                        ),
                      ),
                      const SizedBox(height: 32),

                      const Text(
                        'Minha Família',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 16),

                      SectionCard(
                        description:
                            'Adicione aqui membros da sua família e compartilhe os seguros com eles.',
                        icon: Icons.add_circle_outline,
                        color: Color.fromARGB(255, 35, 35, 35),
                      ),

                      const SizedBox(height: 16),

                      const Text(
                        'Contratados',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 12),

                      SectionCard(
                        description:
                            'Você ainda não possui seguros contratados.',
                        icon: FontAwesomeIcons.faceFrownOpen,
                        color: Color.fromARGB(255, 35, 35, 35),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _openExternalUrl(String url) async {
    final Uri uri = Uri.parse(url);

    try {
      if (await canLaunchUrl(uri)) {
        await launchUrl(uri, mode: LaunchMode.externalApplication);
      } else {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Não foi possível abrir o link: $url'),
              backgroundColor: Colors.red,
            ),
          );
        }
      }
    } catch (e) {
      // debug: Erro ao abrir URL: $e
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Erro ao abrir link: $e'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }
}

Widget _buildDrawerItem(IconData icon, String title) {
  return ListTile(
    dense: true,
    visualDensity: const VisualDensity(vertical: -3),
    leading: Icon(icon, color: Colors.teal),
    title: Text(title, style: const TextStyle(color: Colors.white)),
    onTap: () {
      // debug: $title clicado
    },
  );
}
