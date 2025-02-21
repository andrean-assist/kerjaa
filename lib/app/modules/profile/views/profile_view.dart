import 'package:assist_hadir/shared/shared_theme.dart';
import 'package:assist_hadir/utils/constants_assets.dart';
import 'package:assist_hadir/utils/constants_connect.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';

import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = context.textTheme;
    final size = context.mediaQuerySize;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        centerTitle: false,
        backgroundColor: const Color(0xFF2E90C5),
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: Container(
              height: double.infinity,
              color: const Color(0xFF2E90C5),
            ),
          ),
          Positioned(
            top: -100,
            left: 0,
            right: 0,
            child: SvgPicture.asset(
              ConstantsAssets.icGSProfile,
              fit: BoxFit.cover,
            ),
          ),
          Positioned.fill(
            top: size.height / 14,
            child: Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: context.theme.colorScheme.surface,
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(20),
                ),
              ),
              child: Obx(
                () => Column(
                  children: [
                    ListTile(
                      contentPadding: EdgeInsets.zero,
                      leading: CachedNetworkImage(
                        imageUrl:
                            '${ConstantsConnect.endPointBaseUrlImage}${controller.profilePicture.value}',
                        imageBuilder: (context, imageProvider) => CircleAvatar(
                          backgroundImage: imageProvider,
                          radius: 28,
                        ),
                        progressIndicatorBuilder: (context, url, progress) =>
                            CircleAvatar(
                          child: CircularProgressIndicator.adaptive(
                            value: progress.progress,
                          ),
                        ),
                        errorWidget: (context, url, error) =>
                            const CircleAvatar(
                          backgroundImage:
                              AssetImage(ConstantsAssets.imgNoPhoto),
                        ),
                      ),
                      title: Text(controller.fullName.value ?? '-'),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(controller.position.value ?? '-'),
                          const SizedBox(height: 4),
                          Text(controller.email.value ?? '-'),
                        ],
                      ),
                      trailing: IconButton(
                        onPressed: controller.moveToEditProfile,
                        icon: SvgPicture.asset(ConstantsAssets.icEdit),
                      ),
                    ),
                    const SizedBox(height: 24),
                    _builderItem(
                      textTheme: textTheme,
                      label: 'Akun',
                      iconPath: ConstantsAssets.icActivityHistory,
                      title: 'Riwayat Aktifitas',
                      onPressed: controller.moveToActivityHistory,
                    ),
                    const SizedBox(height: 4),
                    _builderItem(
                      textTheme: textTheme,
                      label: 'Info lainnya',
                      iconPath: ConstantsAssets.icRating,
                      title: 'Beri Kami Nilai',
                      subtitle:
                          'Beri kami nilai agar aplikasi terus berkembang.',
                      onPressed: () {},
                    ),
                    const SizedBox(height: 4),
                    _builderItem(
                      textTheme: textTheme,
                      iconPath: ConstantsAssets.icLogout,
                      title: 'Keluar',
                      onPressed: controller.logout,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _builderItem({
    required TextTheme textTheme,
    String? label,
    required String iconPath,
    required String title,
    String? subtitle,
    required Function() onPressed,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label != null)
          AutoSizeText(
            label,
            style: textTheme.labelLarge?.copyWith(
              fontWeight: SharedTheme.semiBold,
            ),
          ),
        const SizedBox(height: 12),
        ListTile(
          leading: SvgPicture.asset(iconPath),
          title: Text(
            title,
          ),
          titleTextStyle: textTheme.titleMedium?.copyWith(
            fontWeight: SharedTheme.semiBold,
          ),
          subtitle: (subtitle != null) ? Text(subtitle) : null,
          isThreeLine: subtitle != null,
          onTap: onPressed,
        ),
      ],
    );
  }
}
