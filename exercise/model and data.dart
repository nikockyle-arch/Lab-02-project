import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

// 

class Product {
  final int id;
  final String name;
  final double price;
  final String category;
  final String imagePath;
  final String description;

  const Product({
    required this.id,
    required this.name,
    required this.price,
    required this.category,
    required this.imagePath,
    required this.description,
  });
}

// 

const List<Product> sampleProducts = [
  Product(
    id: 1,
    name: 'MoYu RS3M V5 3x3 Ball-Core UV Coated Stickerless',
    price: 1761.06,
    category: 'Puzzle',
    imagePath:
        'https://down-ph.img.susercontent.com/file/sg-11134201-81zv2-mmvgnzh7m70j27',
    description:
        'The MagLev version comes with adjustable elasticity, MagLev system, and a robot cube stand from MoYu. Additionally, this cube has been enhanced with ball-core magnets, which increase stability and make the cube easier to control.',
  ),
  Product(
    id: 2,
    name: 'GAN 251 M Pro 2x2 Magnetic',
    price: 2034.76,
    category: 'Puzzle',
    imagePath:
        'https://speedcubeshop.com/cdn/shop/files/gan-251-2x2-pro-magnetic-core-magnets-stickerless.jpg?v=1771619316&width=1000',
    description:
        'The GAN 251 2x2 Pro (Magnetic, Core Magnets) is a premium 2x2 speed cube. This version introduces adjustable magnet strength and features the same core magnet system found in the GAN 11 M Pro, increasing stability and control during solves.',
  ),
  Product(
    id: 3,
    name: 'YJ MGC 4x4 Magnetic',
    price: 1161.61,
    category: 'Puzzle',
    imagePath:
        'https://speedcubeshop.com/cdn/shop/files/yj-mgc-4x4-magnetic-stickerless.jpg?v=1765412310&width=1000',
    description:
        "The YJ MGC 4x4 Magnetic Cube is the first 4x4 in the MGC line and is perfect for speedcubers who love fast turning. This magnetic cube features incredibly smooth turning, widened outer edge pieces for added stability, and a flexible mechanism with a loose feel out of the box. If you're looking for one of the best magnetic cubes for speed and performance, the MGC 4x4 is a top choice!",
  ),
  Product(
    id: 4,
    name: "Lee Ghost Cube 7x7",
    price: 15875.24,
    category: 'Puzzle',
    imagePath:
        'https://www.thecubicle.com/cdn/shop/products/Lee_20Ghost_20Cube_207x7_4333eddd-f2c4-4c0b-a324-d4766973022a.jpg?v=1651775604&width=800',
    description:
        "The Lee Ghost Cube 7x7 is a ghost cube made by adding 3D printed extensions to a standard 7x7. This is one of the most difficult puzzles produced. So approach with caution and try to prove your skill with this intense puzzle challenge.",
  ),
  Product(
    id: 5,
    name: 'Roland TD716 6-piece V-Drums Electronic Drum Set Kit',
    price: 562950.00,
    category: 'Percussion',
    imagePath:
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQmLZx8SbJYkgE0kp7VyVTpUf0RBdgVuBKSgaoaPMEm7Yqx4cokQ8qQkimx&s=10',
    description:
        "Flagship V-Drums 7 Series Kit with the Expandable V71 Module and Advanced Pads. The V-Drums 7 Series opens a dynamic new chapter in the V-Drums legacy, elevating the world’s leading electronic drums with a reimagined sound module, next-generation pads, and enhanced creative tools. Our latest flagship platform gives you two ways to play: a core onboard sound library created in collaboration with Drum Workshop (DW) and DW Soundworks software for computer-based drumming. And with built-in wireless connectivity and Roland Cloud Connect on your smartphone, you can instantly change up your sound with a growing library of V-Drums Instrument Expansions, Kit Packs, and more",
  ),
  Product(
    id: 6,
    name: 'Alesis Compact Kit 7 7-Pad Portable Drum Pad',
    price: 13400.00,
    category: 'Percusion',
    imagePath:
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT5FPRc800et7OCvfJKopTKuzdFNFz9nQpcJRWjkfoN3w&s=10',
    description: 'Stylish sunglasses for sunny days and outdoor adventures.',
  ),
  Product(
    id: 7,
    name: 'Running Shoes',
    price: 2199.00,
    category: 'Footwear',
    imagePath:
        'https://images.unsplash.com/photo-1542291026-7eec264c27ff?w=600',
    description: 'Lightweight shoes designed for comfortable movement.',
  ),
  Product(
    id: 8,
    name: 'Travel Bag',
    price: 1799.00,
    category: 'Accessories',
    imagePath:
        'https://images.unsplash.com/photo-1553062407-98eeb64c6a62?w=600',
    description: 'A versatile bag for your daily essentials and weekend trips.',
  ),
];

// TASK 5: APP AND THEME

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ThemeMode themeMode = ThemeMode.light;

  void toggleTheme() {
    setState(() {
      themeMode = themeMode == ThemeMode.light
          ? ThemeMode.dark
          : ThemeMode.light;
    });
  }

  @override
  Widget build(BuildContext context) {
    const seedColor = Colors.teal;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Product Catalog',
      themeMode: themeMode,

      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: seedColor,
          brightness: Brightness.light,
        ),
      ),

      darkTheme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: seedColor,
          brightness: Brightness.dark,
        ),
      ),

      home: CatalogPage(
        onToggleTheme: toggleTheme,
        isDark: themeMode == ThemeMode.dark,
      ),
    );
  }
}

// TASK 2: REUSABLE PRODUCT TILE

class ProductTile extends StatelessWidget {
  final Product product;
  final VoidCallback onTap;

  const ProductTile({super.key, required this.product, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      child: ListTile(
        onTap: onTap,
        hoverColor: Colors.transparent,
        minVerticalPadding: 12,

        leading: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.network(
            product.imagePath,
            width: 64,
            height: 64,
            fit: BoxFit.cover,
            semanticLabel: product.name,
          ),
        ),

        title: Text(
          product.name,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),

        subtitle: Text('₱${product.price.toStringAsFixed(2)}'),
      ),
    );
  }
}

// TASK 2: REUSABLE PRODUCT CARD

class ProductCard extends StatelessWidget {
  final Product product;
  final VoidCallback onTap;

  const ProductCard({super.key, required this.product, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: SizedBox(
                width: double.infinity,
                child: Image.network(
                  product.imagePath,
                  fit: BoxFit.cover,
                  semanticLabel: product.name,
                  errorBuilder: (_, __, ___) => const Center(
                    child: Icon(Icons.image_not_supported, size: 48),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.name,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    '₱${product.price.toStringAsFixed(2)}',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                      fontWeight: FontWeight.bold,
                    ),
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

// TASK 3: RESPONSIVE CATALOG SCREEN

class CatalogPage extends StatelessWidget {
  final VoidCallback onToggleTheme;
  final bool isDark;

  const CatalogPage({
    super.key,
    required this.onToggleTheme,
    required this.isDark,
  });

  void openProduct(BuildContext context, Product product) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => ProductDetailPage(product: product)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Catalog'),
        actions: [
          IconButton(
            tooltip: isDark ? 'Switch to light mode' : 'Switch to dark mode',
            icon: Icon(isDark ? Icons.light_mode : Icons.dark_mode),
            onPressed: onToggleTheme,
          ),
        ],
      ),

      body: LayoutBuilder(
        builder: (context, constraints) {
          final width = constraints.maxWidth;

          // Narrow screen: vertical list
          if (width < 600) {
            return ListView.builder(
              itemCount: sampleProducts.length,
              itemBuilder: (context, index) {
                final product = sampleProducts[index];

                return ProductTile(
                  product: product,
                  onTap: () => openProduct(context, product),
                );
              },
            );
          }

          // Wide screen: two or three columns
          final columns = width < 840 ? 2 : 3;

          return GridView.builder(
            padding: const EdgeInsets.all(12),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: columns,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              childAspectRatio: 0.8,
            ),
            itemCount: sampleProducts.length,
            itemBuilder: (context, index) {
              final product = sampleProducts[index];

              return ProductCard(
                product: product,
                onTap: () => openProduct(context, product),
              );
            },
          );
        },
      ),
    );
  }
}

// TASK 4: PRODUCT DETAIL SCREEN

class ProductDetailPage extends StatelessWidget {
  final Product product;

  const ProductDetailPage({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(title: const Text('Product Details')),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: AspectRatio(
                aspectRatio: 4 / 3,
                child: Image.network(
                  product.imagePath,
                  fit: BoxFit.cover,
                  semanticLabel: product.name,
                  errorBuilder: (_, __, ___) => const Center(
                    child: Icon(Icons.image_not_supported, size: 64),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 20),

            Chip(
              label: Text(product.category),
              backgroundColor: colors.secondaryContainer,
            ),

            const SizedBox(height: 12),

            Text(
              product.name,
              style: Theme.of(context).textTheme.headlineMedium,
            ),

            const SizedBox(height: 12),

            Text(
              '₱${product.price.toStringAsFixed(2)}',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                color: colors.primary,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 24),

            Text('Description', style: Theme.of(context).textTheme.titleMedium),

            const SizedBox(height: 8),

            Text(
              product.description,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ],
        ),
      ),
    );
  }
}
