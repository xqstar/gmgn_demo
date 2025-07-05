import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gmgn/router/router.dart';
import 'package:gmgn/widget/outline_button.dart';

class DiscoverPage extends StatelessWidget {
  final controller = Get.put<DiscoverController>(DiscoverController());

  DiscoverPage({super.key});
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(child: _buildSearchHeader()),
        SliverToBoxAdapter(child: _buildHeroSection()),
        SliverToBoxAdapter(child: Divider(thickness: 1, color: Colors.grey.shade100, height: 1)),
        SliverToBoxAdapter(child: _buildMainTabs()),
        SliverToBoxAdapter(child: _buildContent()),
      ],
    );
  }

  Widget _buildSearchHeader() {
    return Container(
      padding: EdgeInsets.all(16),
      child: Row(
        children: [
          // Frog mascot
          Container(
            width: 32,
            height: 32,
            decoration: BoxDecoration(color: Colors.green[100], borderRadius: BorderRadius.circular(12)),
            child: Center(child: Text('🐸', style: TextStyle(fontSize: 16))),
          ),
          SizedBox(width: 12),

          // Search bar
          Expanded(
            child: SizedBox(
              height: 32,
              child: TextField(
                cursorColor: Get.theme.primaryColor,
                cursorHeight: 24,
                decoration: InputDecoration(
                  prefixIconConstraints: BoxConstraints(maxHeight: 20, maxWidth: 52),
                  prefixIcon: Padding(
                    padding: EdgeInsets.only(left: 16),
                    child: Icon(Icons.search, color: Colors.grey.shade400, size: 20),
                  ),
                  hintText: 'Search token/contract/wallet',

                  // filled: true,
                  contentPadding: EdgeInsets.only(left: 4),
                  enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Get.theme.primaryColor)),
                  focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Get.theme.primaryColor)),
                  disabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Get.theme.primaryColor)),
                  border: OutlineInputBorder(borderSide: BorderSide(color: Get.theme.primaryColor)),
                  // fillColor: Colors.grey.shade50,
                  hintStyle: TextStyle(color: Colors.grey[400], fontSize: 12),
                ),
              ),
            ),
          ),

          SizedBox(width: 12),

          // QR code icon
          Icon(Icons.qr_code_scanner_rounded, color: Colors.grey[600], size: 24),
        ],
      ),
    );
  }

  Widget _buildHeroSection() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24, vertical: 40),
      child: Column(
        children: [
          Text(
            'Discover Faster, Trading In Seconds 🚀',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black87, height: 1.2),
          ),
          SizedBox(height: 12),
          Text(
            'Fast on-chain, click to trade; Auto sell with stop loss/take profit.',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 13, color: Colors.grey[600], height: 1.2),
          ),
          SizedBox(height: 16),

          // Action buttons
          Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 40,
                width: 120,
                child: GMGNOutlineButton(
                  fontSize: 15,
                  backgroundColor: Colors.grey.shade50,
                  onPressed: () {
                    Get.toNamed(Routers.register);
                  },
                  text: 'Sign up',
                ),
              ),
              SizedBox(width: 16),
              SizedBox(
                height: 40,
                width: 120,
                child: GMGNOutlineButton(
                  fontSize: 15,
                  onPressed: () {
                    Get.toNamed(Routers.login);
                  },
                  text: 'Login',
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildMainTabs() {
    return Row(
      children: [
        Expanded(
          child: TabBar(
            controller: controller.tabController,
            isScrollable: true,
            tabAlignment: TabAlignment.start,
            labelColor: Colors.black87,
            padding: EdgeInsets.only(left: 16, right: 8),
            labelPadding: EdgeInsets.only(right: 8),
            dividerHeight: 0,
            overlayColor: WidgetStateProperty.all(Colors.transparent),

            unselectedLabelColor: Colors.blueGrey.shade200,
            indicator: BoxDecoration(color: Colors.transparent),
            labelStyle: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
            unselectedLabelStyle: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
            tabs: controller.tabs.map((tabName) => Tab(text: tabName)).toList(),
          ),
        ),
        OutlinedButton.icon(
          style: OutlinedButton.styleFrom(
            side: BorderSide(color: Colors.grey.shade300, width: 1),
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            maximumSize: Size(40, 24),
            minimumSize: Size(40, 24),
            iconSize: 12,
            backgroundColor: Colors.grey.shade200,
            padding: EdgeInsets.symmetric(horizontal: 4),
          ),
          onPressed: () {},

          label: Icon(Icons.arrow_drop_down_rounded, size: 16, color: Colors.grey),
          icon: CircleAvatar(
            backgroundColor: Colors.black87,
            maxRadius: 6,
            minRadius: 6,
            child: Icon(Icons.menu_rounded, size: 12, color: Get.theme.primaryColor),
          ),
        ),
        SizedBox(width: 16),
      ],
    );
  }

  Widget _buildContent() {
    return Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // No data illustration
            Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(color: Colors.grey[100], borderRadius: BorderRadius.circular(60)),
              child: Center(child: Icon(Icons.analytics_outlined, size: 60, color: Colors.grey[300])),
            ),
            SizedBox(height: 20),
            Text(
              'No Data',
              style: TextStyle(fontSize: 18, color: Colors.grey[400], fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    );
  }
}

class DiscoverController extends GetxController with GetSingleTickerProviderStateMixin {
  final tabs = ["Watchlist", "Trenches", "New pair", "Trending", "xStocks", "Monitor Square"];
  late final TabController tabController;
  @override
  void onInit() {
    super.onInit();
    tabController = TabController(length: tabs.length, vsync: this);
  }
}
