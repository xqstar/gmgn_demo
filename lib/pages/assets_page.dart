import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AssetsPage extends StatelessWidget {
  final Color itemBgColor = Color(0xffF8F9FB);
  final controller = Get.put<AssetsController>(AssetsController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        scrolledUnderElevation: 0,
        leading: IconButton(
          style: IconButton.styleFrom(
            backgroundColor: Colors.pink.shade100,
            maximumSize: Size(24, 24),
            minimumSize: Size(24, 24),
            padding: EdgeInsets.zero,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
          ),

          icon: Text('🐸', style: TextStyle(fontSize: 12)),
          onPressed: () {},
        ),
        titleSpacing: 0,
        actionsPadding: EdgeInsets.only(right: 16),
        actions: [
          Icon(Icons.school, size: 24, color: Colors.black87),
          SizedBox(width: 8),
          Text('Tutorial', style: TextStyle(fontSize: 14, color: Colors.black87)),
          SizedBox(width: 16),
          Icon(Icons.open_in_new_rounded, size: 24, color: Colors.black87),
        ],
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IntrinsicHeight(
              child: Row(
                children: [
                  Text(
                    'Geg5...Wx',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.black87),
                  ),
                  SizedBox(width: 8),

                  // Copy icons
                  Icon(Icons.copy, size: 12, color: Colors.grey[400]),
                  SizedBox(width: 8),
                  SizedBox(height: 8, child: VerticalDivider(color: Colors.grey.shade400, thickness: 1, width: 1)),
                  SizedBox(width: 8),
                  Icon(Icons.menu_rounded, size: 12, color: Colors.grey[400]),
                ],
              ),
            ),
            SizedBox(height: 4),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('funs', style: TextStyle(color: Colors.grey.shade400, fontSize: 12)),
                SizedBox(width: 4),
                Text('0', style: TextStyle(color: Colors.black87, fontSize: 12)),
              ],
            ),
          ],
        ),
      ),
      body: SafeArea(
        minimum: EdgeInsets.symmetric(horizontal: 16),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(child: SizedBox(height: 4)),
            SliverToBoxAdapter(child: _buildBalanceSection()),
            SliverToBoxAdapter(child: _buildAnalysisSection()),
            SliverToBoxAdapter(
              child: TabBar(
                controller: controller.tabController,
                isScrollable: true,
                tabAlignment: TabAlignment.start,
                padding: EdgeInsets.only(left: 0),
                indicatorColor: Colors.black87,
                overlayColor: WidgetStateProperty.all(Colors.transparent),
                indicatorPadding: EdgeInsets.symmetric(vertical: 2, horizontal: 20),
                labelPadding: EdgeInsets.only(left: 0, right: 24),
                labelStyle: TextStyle(fontSize: 15, fontWeight: FontWeight.w500, color: Colors.black87),
                unselectedLabelStyle: TextStyle(fontSize: 15, color: Colors.grey[400], fontWeight: FontWeight.w500),
                // dividerHeight: 0,
                dividerColor: Colors.transparent,
                tabs: ['Holdings', 'Activity'].map((tabName) => Tab(text: tabName)).toList(),
              ),
            ),
            SliverFillRemaining(
              fillOverscroll: true,
              child: TabBarView(
                controller: controller.tabController,
                children: ['Holdings', 'Activity']
                    .map(
                      (tabName) => Container(
                        height: 120,
                        child: Icon(Icons.menu_book_rounded, color: Colors.grey.shade400, size: 48),
                      ),
                    )
                    .toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBalanceSection() {
    return Container(
      padding: EdgeInsets.only(right: 16, left: 16, bottom: 8, top: 16),
      decoration: BoxDecoration(color: itemBgColor, borderRadius: BorderRadius.circular(12)),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: EdgeInsets.only(left: 2),
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(12),
                  border: BoxBorder.all(color: Colors.grey.shade200),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: 16,
                      height: 16,
                      decoration: BoxDecoration(color: Colors.purple, borderRadius: BorderRadius.circular(8)),
                    ),
                    SizedBox(width: 6),
                    Text(
                      'SOL',
                      style: TextStyle(color: Colors.black87, fontSize: 12, fontWeight: FontWeight.w500),
                    ),
                    // SizedBox(width: 4),
                    Icon(Icons.arrow_drop_down, color: Colors.grey.shade400, size: 16),
                  ],
                ),
              ),
              SizedBox(width: 8),
              Text('Total bal.', style: TextStyle(fontSize: 12, color: Colors.blueGrey.shade200)),
              SizedBox(width: 8),
              Icon(Icons.visibility, size: 16, color: Colors.blueGrey.shade200),
            ],
          ),
          // SizedBox(height: 12),
          // Balance amount
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('≈', style: TextStyle(fontSize: 16, color: Colors.black87)),
              SizedBox(width: 8),
              Text(
                '0',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.black87),
              ),
              SizedBox(width: 12),
              Icon(Icons.currency_exchange, color: Colors.black54, size: 12),
              SizedBox(width: 2),
              Text('SOL', style: TextStyle(fontSize: 12, color: Colors.black54)),
            ],
          ),
          _buildActionButtons(),
        ],
      ),
    );
  }

  Widget _buildActionButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Expanded(child: _buildActionButton(Icons.arrow_downward, 'Deposit', false)),
        Expanded(child: _buildActionButton(Icons.arrow_upward, 'Withdraw', false)),
        Expanded(child: _buildActionButton(Icons.credit_card, 'Buy', true)),
        Expanded(child: _buildActionButton(Icons.card_giftcard, 'Invite Now', false)),
      ],
    );
  }

  Widget _buildActionButton(IconData icon, String label, bool isHot) {
    return Column(
      // crossAxisAlignment: CrossAxisAlignment.center,
      // mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Stack(
          alignment: AlignmentDirectional.topCenter,
          children: [
            IconButton(
              style: IconButton.styleFrom(
                elevation: 2,

                backgroundColor: Colors.white,
                shadowColor: Colors.grey.shade300,
              ),

              // decoration: BoxDecoration(
              //   color: Colors.white,
              //   borderRadius: BorderRadius.circular(16),
              //   border: Border.all(color: Colors.grey[200]!),
              // ),
              icon: Icon(icon, color: label == 'Invite\nNow' ? Colors.green : Colors.grey[700], size: 24),
              onPressed: () {},
            ),
            if (isHot)
              Align(
                alignment: FractionalOffset(1, 0),
                // widthFactor: 1,
                child: Container(
                  height: 16,
                  width: 48,
                  alignment: AlignmentDirectional.center,
                  padding: EdgeInsets.symmetric(horizontal: 2),
                  decoration: BoxDecoration(color: Colors.red, borderRadius: BorderRadius.circular(4)),
                  child: Text(
                    '🔥HOT',
                    style: TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
          ],
        ),
        SizedBox(height: 4),
        Text(
          label,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 13, color: Colors.black87, fontWeight: FontWeight.w500),
        ),
      ],
    );
  }

  Widget _buildAnalysisTab(String label, bool isSelected) {
    return Container(
      decoration: BoxDecoration(
        color: isSelected ? Colors.black87 : Colors.blueGrey.shade50,
        borderRadius: BorderRadius.circular(6),
      ),
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      child: Text(
        label,
        style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500, color: isSelected ? Colors.white : Colors.black26),
      ),
    );
  }

  Widget _buildAnalysisSection() {
    return Container(
      padding: EdgeInsets.only(right: 16, left: 16, bottom: 8, top: 16),
      margin: EdgeInsets.only(top: 12),
      decoration: BoxDecoration(color: itemBgColor, borderRadius: BorderRadius.circular(12)),

      child: Column(
        children: [
          // Analysis tabs
          Row(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      _buildAnalysisTab('PnL', false),
                      SizedBox(width: 4),
                      _buildAnalysisTab('Analysis', true),
                      SizedBox(width: 4),
                      _buildAnalysisTab('Distribution', false),
                      SizedBox(width: 4),
                      _buildAnalysisTab('Phishing check', false),
                    ],
                  ),
                ),
              ),

              Container(
                padding: EdgeInsets.symmetric(horizontal: 2, vertical: 2),
                margin: EdgeInsets.only(left: 8),
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  border: Border.all(color: Colors.grey.shade200, width: 1),
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('7d', style: TextStyle(fontSize: 12, color: Colors.grey[700])),
                    SizedBox(width: 4),
                    Icon(Icons.keyboard_arrow_down, size: 16, color: Colors.grey[500]),
                  ],
                ),
              ),
            ],
          ),

          // SizedBox(height: 20),

          // Analysis data
          Column(
            children: [
              _buildAnalysisRow('Total PnL', '--'),
              _buildAnalysisRow('Unrealized Profits', '-- SOL'),
              _buildAnalysisRow('7d Avg Duration', '--'),
              _buildAnalysisRow('7d Total Cost', '-- SOL'),
              _buildAnalysisRow('7d Token Avg Cost', '-- SOL'),
              _buildAnalysisRow('7d Token Avg Realized Profits', '-- SOL'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildAnalysisRow(String label, String value) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: TextStyle(fontSize: 14, color: Color(0xff6C6F72))),
          Text(value, style: TextStyle(fontSize: 14, color: Colors.black87)),
        ],
      ),
    );
  }

  Widget _buildHoldingsSection() {
    return Container(
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          // Holdings tabs and controls
          Row(
            children: [
              Text(
                'Holdings',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: Colors.black87),
              ),
              SizedBox(width: 20),
              Text('Activity', style: TextStyle(fontSize: 18, color: Colors.grey[400])),
              Spacer(),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(color: Colors.black, borderRadius: BorderRadius.circular(16)),
                child: Text(
                  'U Swap',
                  style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.w500),
                ),
              ),
            ],
          ),
          SizedBox(height: 16),

          // Sort and filter
          Row(
            children: [
              Text('Sort by: ', style: TextStyle(fontSize: 14, color: Colors.grey[600])),
              Text(
                'Last TX High to Low',
                style: TextStyle(fontSize: 14, color: Colors.black87, fontWeight: FontWeight.w500),
              ),
              SizedBox(width: 4),
              Icon(Icons.keyboard_arrow_down, size: 16, color: Colors.grey[500]),
              Spacer(),
              Row(
                children: [
                  Icon(Icons.tune, size: 16, color: Colors.grey[500]),
                  SizedBox(width: 4),
                  Text('Filter', style: TextStyle(fontSize: 14, color: Colors.grey[600])),
                ],
              ),
            ],
          ),
          SizedBox(height: 20),

          // Empty state
          Expanded(
            child: Center(
              child: Container(
                padding: EdgeInsets.all(40),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(color: Colors.grey[100], borderRadius: BorderRadius.circular(40)),
                      child: Icon(Icons.folder_outlined, size: 40, color: Colors.grey[300]),
                    ),
                    SizedBox(height: 16),
                    Text('No holdings yet', style: TextStyle(fontSize: 16, color: Colors.grey[400])),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class AssetsController extends GetxController with GetSingleTickerProviderStateMixin {
  late final TabController tabController = TabController(length: 2, vsync: this);
  @override
  void onInit() {
    super.onInit();
  }
}
