import 'package:alex_astudillo/ui/pages/profile/widgets/profile_account.dart';
import 'package:alex_astudillo/ui/pages/profile/widgets/profile_detail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ProfileTabBar extends StatelessWidget {
  const ProfileTabBar({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Column(
        children: [
          Container(
            constraints: const BoxConstraints(maxWidth: 300.0),
            decoration: BoxDecoration(
              color: const Color(0xFF757575).withOpacity(0.05),
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: TabBar(
              indicatorPadding: const EdgeInsets.all(4.0),
              indicator: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.circular(15.0),
              ),
              indicatorSize: TabBarIndicatorSize.tab,
              tabs: [
                Tab(
                  child: Text(AppLocalizations.of(context)!.details),
                ),
                Tab(
                  child: Text(AppLocalizations.of(context)!.account),
                ),
              ],
            ),
          ),
          const Expanded(
            child: TabBarView(
              physics: BouncingScrollPhysics(),
              children: [
                ProfileDetail(),
                ProfileAccount(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
