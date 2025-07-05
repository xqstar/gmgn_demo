import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gmgn/model/models.dart';
import 'package:gmgn/router/router.dart';

class RankPage extends StatelessWidget {
  final Color itemBgColor = Color(0xffF8F9FB);
  final controller = Get.put<RankController>(RankController());
  late TabController _filterTabController;
  int _currentBottomIndex = 1; // Rank tab is selected
  String _selectedPeriod = '7D';
  String _selectedFilter = 'All';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            _buildHeader(),
            _buildFilterTabs(),
            _buildControlsSection(),
            Expanded(child: _buildRankingList()),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        children: [
          Text(
            'Rank',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Colors.black87),
          ),
          SizedBox(width: 8),
          Text(
            'CopyTrade',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Colors.black54),
          ),
          Spacer(),
          Icon(Icons.search, color: Colors.grey[600], size: 24),
          SizedBox(width: 8),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 2),
            decoration: BoxDecoration(color: itemBgColor, borderRadius: BorderRadius.circular(6)),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.wallet, size: 16, color: Colors.black87),
                SizedBox(width: 6),
                Text(
                  'Create',
                  style: TextStyle(color: Colors.black87, fontSize: 12, fontWeight: FontWeight.w500),
                ),
                Icon(Icons.arrow_forward_ios_rounded, size: 12, color: Colors.grey.shade400),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFilterTabs() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: controller.childTabs
              .mapIndexed(
                (index, tabName) => GestureDetector(
                  onTap: () {
                    controller.currentChildTab.value = index;
                  },
                  child: ObxValue((currentIndex) {
                    final bgColor = currentIndex.value == index ? Colors.black87 : itemBgColor;
                    final textColor = currentIndex.value == index ? Colors.white : Colors.grey.shade500;
                    return Container(
                      padding: EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                      margin: EdgeInsets.only(right: 6),
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(4), color: bgColor),
                      child: Text(tabName, style: TextStyle(fontSize: 12, color: textColor)),
                    );
                  }, controller.currentChildTab),
                ),
              )
              .toList(),
        ),
      ),

      //
      // Row(
      //   children: filters.map((filter) {
      //     final isSelected = filter == _selectedFilter;
      //     return GestureDetector(
      //       onTap: () {
      //         // setState(() {
      //         //   _selectedFilter = filter;
      //         // });
      //       },
      //       child: Container(
      //         height: 24,
      //         alignment: AlignmentDirectional.center,
      //         margin: EdgeInsets.only(right: 12),
      //         padding: EdgeInsets.symmetric(horizontal: 8),
      //         decoration: BoxDecoration(
      //           color: isSelected ? Colors.black : itemBgColor,
      //           borderRadius: BorderRadius.circular(4),
      //           // border: Border.all(color: isSelected ? Colors.black : Colors.grey[300]!),
      //         ),
      //         child: Text(
      //           filter,
      //           style: TextStyle(
      //             color: isSelected ? Colors.white : Colors.grey[600],
      //             fontSize: 12,
      //             fontWeight: isSelected ? FontWeight.w500 : FontWeight.normal,
      //           ),
      //         ),
      //       ),
      //     );
      //   }).toList(),
      // ),
    );
  }

  Widget _buildControlsSection() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        children: [
          Text('Period: ', style: TextStyle(color: Colors.grey[600], fontSize: 12)),
          Text(
            _selectedPeriod,
            style: TextStyle(color: Colors.black87, fontSize: 12, fontWeight: FontWeight.w500),
          ),
          SizedBox(width: 16),
          Text('Sort by: ', style: TextStyle(color: Colors.grey[600], fontSize: 12)),
          Text(
            'PnL High to Low',
            style: TextStyle(color: Colors.black87, fontSize: 12, fontWeight: FontWeight.w500),
          ),
          Icon(Icons.arrow_drop_down_rounded, color: Colors.grey.shade400, size: 16),
          Spacer(),
          Row(
            children: [
              Icon(Icons.tune, color: Colors.grey.shade400, size: 16),
              SizedBox(width: 4),
              Text('Filter', style: TextStyle(color: Colors.black87, fontSize: 12)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildRankingList() {
    final traders = [
      TraderData(
        rank: '1st',
        username: '8mse...bej9',
        avatar: '👤',
        pnl: '+\$880.38K',
        pnlPercentage: '+33.12% PnL',
        followers: 349,
        txsWin: '37',
        txsF: '5.7',
        txsL: '3.2',
        winRate: '58.3%',
        lastActive: '1d ago',
        isVerified: true,
      ),
      TraderData(
        rank: '2nd',
        username: '7JyT...vP2H',
        avatar: '👤',
        pnl: '+\$501.94K',
        pnlPercentage: '+134.1% PnL',
        followers: 219,
        txsWin: '15',
        txsF: '5.7',
        txsL: '3.2',
        winRate: '75.4%',
        lastActive: '35m ago',
        score: 7.29,
      ),
      TraderData(
        rank: '3rd',
        username: 'Cupsey',
        avatar: '🐸',
        pnl: '+\$449.62K',
        pnlPercentage: '+18.5% PnL',
        followers: 16046,
        txsWin: '8.9',
        txsF: '5.7',
        txsL: '3.2',
        winRate: '68.2%',
        lastActive: '11m ago',
        score: 1965.99,
      ),
      TraderData(
        rank: '4th',
        username: 'EvBD...2b1g',
        avatar: '👤',
        pnl: '+\$269.88K',
        pnlPercentage: '+77.4% PnL',
        followers: 222,
        txsWin: '68',
        txsF: '5.7',
        txsL: '3.2',
        winRate: '48.3%',
        lastActive: '7h ago',
        score: 0.0015,
      ),
    ];

    return ListView.builder(
      padding: EdgeInsets.symmetric(horizontal: 16),
      itemCount: traders.length,
      itemBuilder: (context, index) {
        return _buildTraderCard(traders[index]);
      },
    );
  }

  Widget _buildTraderCard(TraderData trader) {
    return Card.outlined(
      margin: EdgeInsets.only(bottom: 16),
      color: Colors.white,
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        side: BorderSide(color: Colors.grey.shade100, width: 0.5),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 8),
            height: 14,
            child: Text(trader.rank, style: TextStyle(fontSize: 10, color: Colors.black87)),
            decoration: BoxDecoration(
              color: _getRankColor(trader.rank),
              borderRadius: BorderRadius.only(bottomRight: Radius.circular(12)),
            ),
          ),
          // Header row
          Row(
            children: [
              // Rank
              SizedBox(width: 16),

              // Avatar and username
              Container(
                width: 32,
                height: 32,
                decoration: BoxDecoration(color: Colors.orange[100], borderRadius: BorderRadius.circular(8)),
                child: Center(child: Text(trader.avatar, style: TextStyle(fontSize: 16))),
              ),
              SizedBox(width: 8),
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    trader.username,
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: Colors.black87),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.menu_rounded, size: 12, color: Colors.grey.shade400),
                      SizedBox(width: 4),
                      Text(
                        trader.score == null ? '0' : '${trader.score}',
                        style: TextStyle(color: Colors.black87, fontSize: 12, fontWeight: FontWeight.w400),
                      ),
                      SizedBox(width: 6),
                      Icon(Icons.currency_exchange, size: 12, color: Colors.grey.shade400),
                    ],
                  ),
                ],
              ),
              // if (trader.isVerified) ...[SizedBox(width: 4), Icon(Icons.edit, size: 16, color: Colors.grey[400])],
              // if (trader.score != null) ...[
              //   SizedBox(width: 8),
              //   Container(
              //     padding: EdgeInsets.symmetric(horizontal: 6, vertical: 2),
              //     decoration: BoxDecoration(color: Colors.grey[800], borderRadius: BorderRadius.circular(10)),
              //     child: Text(
              //       trader.score.toString(),
              //       style: TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.w500),
              //     ),
              //   ),
              // ],
              Spacer(),

              // PnL
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    trader.pnl,
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: Colors.green.shade600),
                  ),
                  Text(trader.pnlPercentage, style: TextStyle(fontSize: 13, color: Colors.grey[500])),
                ],
              ),
              SizedBox(width: 16),
            ],
          ),
          SizedBox(height: 16),

          // Stats row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Followers', style: TextStyle(fontSize: 12, color: Colors.grey.shade400)),
                  SizedBox(height: 4),
                  Text(trader.followers.toString(), style: TextStyle(fontSize: 12, color: Colors.black87)),
                ],
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('TXs/Win Rate', style: TextStyle(fontSize: 12, color: Colors.grey.shade400)),
                    SizedBox(height: 8),
                    RichText(
                      text: TextSpan(
                        style: TextStyle(fontSize: 14),
                        children: [
                          TextSpan(
                            text: trader.txsWin,
                            style: TextStyle(color: Colors.black87),
                          ),
                          TextSpan(
                            text: ' (',
                            style: TextStyle(color: Colors.grey.shade400),
                          ),
                          TextSpan(
                            text: trader.txsF,
                            style: TextStyle(color: Colors.green.shade600),
                          ),
                          TextSpan(
                            text: '/',
                            style: TextStyle(color: Colors.grey.shade400),
                          ),
                          TextSpan(
                            text: trader.txsL,
                            style: TextStyle(color: Colors.red),
                          ),
                          TextSpan(
                            text: ')',
                            style: TextStyle(color: Colors.grey.shade400),
                          ),
                          TextSpan(
                            text: trader.winRate,
                            style: TextStyle(color: Colors.black87),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text('Last Active', style: TextStyle(fontSize: 12, color: Colors.grey.shade400)),
                  SizedBox(height: 4),
                  Text(trader.lastActive, style: TextStyle(fontSize: 12, color: Colors.black87)),
                ],
              ),
              SizedBox(width: 16),
            ],
          ),
          SizedBox(height: 16),

          // Action buttons
          Row(
            children: [
              SizedBox(width: 16),
              Expanded(
                child: Container(
                  height: 30,
                  child: OutlinedButton(
                    onPressed: () {
                      Get.toNamed(Routers.copyTrade);
                    },
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(color: Colors.grey[300]!),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.copy, size: 16, color: Colors.grey[600]),
                        SizedBox(width: 4),
                        Text(
                          'Copy',
                          style: TextStyle(color: Colors.black87, fontSize: 13, fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(width: 12),
              Expanded(
                child: Container(
                  height: 30,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey[800],
                      foregroundColor: Colors.white,

                      elevation: 0,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.favorite_border, size: 16),
                        SizedBox(width: 4),
                        Text('Follow', style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600)),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(width: 16),
            ],
          ),
          SizedBox(height: 16),
        ],
      ),
    );
  }

  Color _getRankColor(String rank) {
    switch (rank) {
      case '1st':
        return Colors.yellow[600]!;
      case '2nd':
        return Colors.grey[400]!;
      case '3rd':
        return Colors.orange[400]!;
      default:
        return Colors.grey[600]!;
    }
  }
}

class RankController extends GetxController with GetSingleTickerProviderStateMixin {
  final childTabs = ['All', 'Pump SM', 'Smart Money', 'Fresh Wallet', 'KOL/VC'];

  late final TabController tabController;
  final currentChildTab = 0.obs;

  @override
  void onInit() {
    super.onInit();
    tabController = TabController(length: childTabs.length, vsync: this);
  }

  @override
  void onClose() {
    tabController.dispose();
    super.onClose();
  }
}
