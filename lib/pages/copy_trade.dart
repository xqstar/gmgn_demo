import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CopyTradePage extends StatefulWidget {
  @override
  _CopyTradeScreenState createState() => _CopyTradeScreenState();
}

class _CopyTradeScreenState extends State<CopyTradePage> {
  bool _lightningMode = true;
  String _selectedBuyMethod = 'Max Buy';
  String _selectedSellMethod = 'Auto Sells';
  bool _advancedSettingsOpen = true;
  final Color itemBgColor = Color(0xffF8F9FB);
  final controller = Get.put<CopyTradeController>(CopyTradeController());
  // final TextEditingController _amountController = TextEditingController();

  @override
  void dispose() {
    // _amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        backgroundColor: Colors.grey[50],
        elevation: 0,
        scrolledUnderElevation: 0,
        title: Text(
          'CopyTrade',
          style: TextStyle(color: Colors.black87, fontSize: 18, fontWeight: FontWeight.w500),
        ),
        actions: [
          Container(
            margin: EdgeInsets.only(right: 16),
            child: TextButton.icon(
              onPressed: () {},
              icon: Icon(Icons.school_outlined, color: Colors.black54, size: 24),
              label: Text('Tutorial', style: TextStyle(color: Colors.grey[600], fontSize: 14)),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Lightning mode toggle
            _buildLightningModeToggle(),

            // SizedBox(height: 16),

            // Wallet section
            _buildWalletSection(),

            SizedBox(height: 16),

            // Copy From section
            _buildCopyFromSection(),

            SizedBox(height: 16),

            // Buy method tabs
            _buildBuyMethodTabs(),

            SizedBox(height: 16),

            // Amount input
            _buildAmountSection(),

            SizedBox(height: 16),

            // Sell method section
            _buildSellMethodSection(),

            SizedBox(height: 16),

            // Advanced settings
            _buildAdvancedSettings(),

            SizedBox(height: 32),

            // Confirm button
            _buildConfirmButton(),

            SizedBox(height: 16),

            // Note
            _buildNote(),
          ],
        ),
      ),
    );
  }

  Widget _buildLightningModeToggle() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Lightning mode, rapid on-chain',
          style: TextStyle(color: Colors.orange[600], fontSize: 13, fontWeight: FontWeight.w500),
        ),
        Icon(Icons.help_outline, color: Colors.grey[400], size: 12),
        Expanded(
          child: Switch(
            value: _lightningMode,
            onChanged: (value) {
              setState(() {
                _lightningMode = value;
              });
            },
            thumbColor: WidgetStateProperty.all(Colors.black87),
            activeColor: Colors.orange[600],
          ),
        ),
      ],
    );
  }

  Widget _buildWalletSection() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16),
      height: 48,
      decoration: BoxDecoration(
        color: Colors.blueGrey.shade50,
        borderRadius: BorderRadius.circular(12),
        // border: Border.all(color: Colors.grey[200]!),
      ),
      child: Row(
        children: [
          Container(
            width: 24,
            height: 24,
            decoration: BoxDecoration(color: Colors.orange[100], borderRadius: BorderRadius.circular(16)),
            child: Icon(Icons.account_balance_wallet, color: Colors.orange[600], size: 12),
          ),
          SizedBox(width: 12),
          Text(
            'Wallet1',
            style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500, color: Colors.black87),
          ),
          Text(' Geg5...3dWx', style: TextStyle(fontSize: 13, color: Colors.grey.shade400)),
          SizedBox(width: 4),
          Icon(Icons.copy, color: Colors.grey.shade400, size: 12),
          Spacer(),
          Row(
            children: [
              Icon(Icons.menu, size: 16, color: Colors.black87),
              SizedBox(width: 4),
              Text('0', style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildCopyFromSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Copy From',
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: Colors.black87),
        ),
        SizedBox(height: 12),
        Container(
          height: 40,
          alignment: AlignmentDirectional.centerStart,
          padding: EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.shade200, width: 1),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Text(
            'sHtr8HyJ7q8scBImULPkPpA557prMG47xCHQfK',
            maxLines: 1,
            style: TextStyle(fontSize: 13, color: Colors.blueGrey.shade200),
          ),
        ),
      ],
    );
  }

  Widget _buildBuyMethodTabs() {
    List<String> methods = ['Max Buy', 'Fixed Buy', 'Fixed Ratio'];

    return Container(
      height: 44,
      decoration: BoxDecoration(color: Colors.blueGrey.shade50, borderRadius: BorderRadius.circular(8)),
      child: Row(
        children: methods.map((method) {
          bool isSelected = method == _selectedBuyMethod;
          return Expanded(
            child: GestureDetector(
              onTap: () {
                setState(() {
                  _selectedBuyMethod = method;
                });
              },
              child: Container(
                margin: EdgeInsets.only(right: method != methods.last ? 8 : 0),
                height: 40,
                decoration: BoxDecoration(
                  color: isSelected ? Colors.white : Colors.transparent,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: isSelected ? Colors.grey[300]! : Colors.transparent),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      method,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: isSelected ? FontWeight.w500 : FontWeight.normal,
                        color: isSelected ? Colors.black87 : Colors.grey[500],
                      ),
                    ),
                    SizedBox(width: 4),
                    Icon(Icons.help_outline, size: 16, color: Colors.grey[400]),
                  ],
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildAmountSection() {
    return Column(
      children: [
        TextField(
          controller: controller.controller,
          keyboardType: TextInputType.number,
          cursorColor: Get.theme.primaryColor,
          autofocus: true,
          decoration: InputDecoration(
            prefixText: 'Amount',
            prefixStyle: TextStyle(fontSize: 14, color: Colors.grey.shade500),
            contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 16),
            suffixText: 'SOL',
            suffixStyle: TextStyle(fontSize: 14, color: Colors.grey.shade500),
            enabled: true,

            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: Colors.grey.shade200, width: 1),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: Colors.grey.shade200, width: 1),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: Colors.grey.shade200, width: 1),
            ),
            // contentPadding: EdgeInsets.zero,
            labelStyle: TextStyle(color: Colors.grey.shade400, fontSize: 14),
          ),
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: Colors.black87),
        ),
        SizedBox(height: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('≈\$295.06(2SOL)', style: TextStyle(fontSize: 13, color: Colors.grey[600])),
            Row(
              children: [
                Text('Balance: 0 SOL', style: TextStyle(fontSize: 13, color: Colors.grey[600])),
                SizedBox(width: 4),
                Icon(Icons.add, size: 16, color: Colors.green),
              ],
            ),
          ],
        ),
        SizedBox(height: 8),
        Text(
          'Balance is less than 0.05 SOL, The Copy Trade order may fail, please top up in time.',
          style: TextStyle(fontSize: 10, color: Colors.red[400]),
          textAlign: TextAlign.end,
        ),
      ],
    );
  }

  Widget _buildSellMethodSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              'Sell Method',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: Colors.black87),
            ),
            SizedBox(width: 8),
            Icon(Icons.help_outline, size: 18, color: Colors.grey[400]),
          ],
        ),
        SizedBox(height: 12),
        SingleChildScrollView(
          child: Row(
            children: [
              _buildSellMethodButton('Auto Sells'),
              SizedBox(width: 8),
              _buildSellMethodButton('Not Sells'),
              SizedBox(width: 8),
              _buildSellMethodButton('Customize TP & SL'),
            ],
          ),
          scrollDirection: Axis.horizontal,
        ),
      ],
    );
  }

  Widget _buildSellMethodButton(String method) {
    bool isSelected = method == _selectedSellMethod;
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedSellMethod = method;
        });
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          // color: isSelected ? Colors.black87 : Colors.white,
          borderRadius: BorderRadius.circular(4),
          border: Border.all(color: isSelected ? Colors.black87 : Colors.grey.shade200, width: 0.5),
        ),
        child: Text(
          method,
          style: TextStyle(
            fontSize: 12,
            color: isSelected ? Colors.black87 : Colors.grey[600],
            fontWeight: isSelected ? FontWeight.w500 : FontWeight.normal,
          ),
        ),
      ),
    );
  }

  Widget _buildAdvancedSettings() {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              _advancedSettingsOpen = !_advancedSettingsOpen;
            });
          },
          child: Row(
            children: [
              Text(
                'Advanced Settings',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: Colors.black87),
              ),
              SizedBox(width: 8),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 2),
                decoration: BoxDecoration(color: Colors.blueGrey.shade200, borderRadius: BorderRadius.circular(4)),
                child: Text('1', style: TextStyle(fontSize: 12, color: Colors.black87)),
              ),
              SizedBox(width: 8),
              Text(
                _advancedSettingsOpen ? 'Open' : 'Close',
                style: TextStyle(fontSize: 14, color: Colors.green[600], fontWeight: FontWeight.w500),
              ),
              // SizedBox(width: 4),
              Icon(
                _advancedSettingsOpen ? Icons.keyboard_arrow_down : Icons.keyboard_arrow_right,
                color: Colors.green[600],
                size: 16,
              ),
              Spacer(),
              Icon(Icons.currency_exchange, size: 12, color: Colors.grey[400]),
              SizedBox(width: 4),
              Text('Clear', style: TextStyle(fontSize: 14, color: Colors.grey[400])),
            ],
          ),
        ),
        if (_advancedSettingsOpen) ...[
          SizedBox(height: 32),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildAdvancedSettingItem('Slippage:', 'Auto'),
              _buildAdvancedSettingItem('PRIO:', '0.012'),
              _buildAdvancedSettingItem('MEV:', 'Off'),
            ],
          ),
        ],
      ],
    );
  }

  Widget _buildAdvancedSettingItem(String label, String value) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: TextStyle(fontSize: 14, color: Colors.grey[600])),
        SizedBox(height: 4),
        Text(value, style: TextStyle(fontSize: 14, color: Colors.black87)),
      ],
    );
  }

  Widget _buildConfirmButton() {
    return ObxValue((submitState) {
      final normalColor = Colors.blueGrey.shade800.withValues(alpha: 0.4);
      return SizedBox(
        width: double.infinity,
        height: 48,
        child: TextButton(
          onPressed: submitState.value
              ? () {
                  controller.confirm();
                }
              : null,
          style: ElevatedButton.styleFrom(
            backgroundColor: submitState.value ? Colors.black87 : normalColor,
            foregroundColor: Colors.white,
            disabledBackgroundColor: normalColor,
            elevation: 0,

            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          ),
          child: Text('Confirm', style: TextStyle(fontSize: 16, color: Colors.white)),
        ),
      );
    }, controller.canSubmit);
  }

  Widget _buildNote() {
    return Text(
      'Note: Ensure your account has enough balance for copy trading to run smoothly.',
      style: TextStyle(fontSize: 12, color: Colors.grey[500]),
      textAlign: TextAlign.start,
    );
  }
}

class CopyTradeController extends GetxController {
  final TextEditingController controller = TextEditingController();
  final canSubmit = false.obs;
  @override
  void onInit() {
    super.onInit();
    controller.addListener(() {
      canSubmit.value = controller.text.isNotEmpty;
    });
  }

  void confirm() {
    if (canSubmit.value) {
      Get.back();
    }
  }
}
