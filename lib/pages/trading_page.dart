import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/utils.dart';
import 'package:gmgn/pages/assets_page.dart';
import 'package:gmgn/pages/discover_page.dart';
import 'package:gmgn/pages/rank_page.dart';

class TradingPage extends StatefulWidget {
  @override
  _TradingAppState createState() => _TradingAppState();
}

class _TradingAppState extends State<TradingPage> with TickerProviderStateMixin {
  late TabController _mainTabController;
  late TabController _filterTabController;
  int _currentBottomIndex = 0;
  final pageController = PageController();
  // final controller = Get.put<DiscoverController>(DiscoverController());
  @override
  void initState() {
    super.initState();
    _mainTabController = TabController(length: 5, vsync: this);
    _filterTabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _mainTabController.dispose();
    _filterTabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: SafeArea(
        child: PageView(
          controller: pageController,
          physics: NeverScrollableScrollPhysics(),
          children: [DiscoverPage(), RankPage(), DiscoverPage(), DiscoverPage(), AssetsPage()],
        ),
      ),
      bottomNavigationBar: _buildBottomNavigation(),
    );
  }

  Widget _buildFilterSection() {
    return Container(
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          // Filter tabs
          SizedBox(
            height: 36,
            child: Row(
              children: [
                _buildFilterChip('New Creation', true),
                SizedBox(width: 8),
                _buildFilterChip('Completing', false),
                SizedBox(width: 8),
                _buildFilterChip('Soaring', false),
                SizedBox(width: 8),
                _buildFilterChip('Completed', false),
              ],
            ),
          ),
          SizedBox(height: 12),

          // Filter controls
          Row(
            children: [
              Icon(Icons.tune, color: Colors.grey[600], size: 20),
              SizedBox(width: 4),
              Text('Filter', style: TextStyle(color: Colors.grey[600], fontSize: 14)),
              SizedBox(width: 16),
              Icon(Icons.pause_circle_outline, color: Colors.orange, size: 20),
              SizedBox(width: 4),
              Text('Paused', style: TextStyle(color: Colors.orange, fontSize: 14)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildFilterChip(String label, bool isSelected) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: isSelected ? Colors.black : Colors.transparent,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: isSelected ? Colors.black : Colors.grey[300]!),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: isSelected ? Colors.white : Colors.grey[600],
          fontSize: 14,
          fontWeight: isSelected ? FontWeight.w500 : FontWeight.normal,
        ),
      ),
    );
  }

  Widget _buildBottomNavigation() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10, offset: Offset(0, -2))],
      ),
      child: BottomNavigationBar(
        currentIndex: _currentBottomIndex,
        onTap: (index) {
          setState(() {
            _currentBottomIndex = index;
            pageController.jumpToPage(index);
          });
        },
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        selectedItemColor: Get.theme.primaryColor,
        unselectedItemColor: Colors.grey[400],
        selectedLabelStyle: TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
        unselectedLabelStyle: TextStyle(fontSize: 12, fontWeight: FontWeight.normal),
        items: [
          BottomNavigationBarItem(
            icon: Container(padding: EdgeInsets.all(4), child: Icon(Icons.explore)),
            label: 'Discover',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.leaderboard), label: 'Rank'),
          BottomNavigationBarItem(
            icon: Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(color: Colors.grey[800], borderRadius: BorderRadius.circular(20)),
              child: Icon(Icons.swap_horiz, color: Colors.white),
            ),
            label: 'Trade',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person_add_outlined), label: 'Follow'),
          BottomNavigationBarItem(icon: Icon(Icons.account_balance_wallet_outlined), label: 'Assets'),
        ],
      ),
    );
  }
}
