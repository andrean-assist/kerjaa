import '../app/data/db/onboarding/onboarding_model.dart';
import 'constants_assets.dart';

abstract class ConstantsStrings {
  static const assist = 'Assist Hadir';

  // WALKTHROUGHT PAGE
  static final onboardingList = [
    OnboardingModel(
      title: 'Selamat datang di Assist Hadir',
      description: 'Absensi pintar untuk para pejuang kesehatan',
      image: ConstantsAssets.imgOnboard,
    ),
    OnboardingModel(
      title: 'Absen secepat mengedipkan mata',
      description:
          'Tidak perlu repot dengan mesin absensi. Buka aplikasi, dan.. tada! Anda sudah terekam hadir',
      image: ConstantsAssets.imgOnboard2,
    ),
    OnboardingModel(
      title: 'Lihat performa Anda',
      description:
          'Penasaran seberapa rajin Anda bulan ini?cek statistik Anda disini. Siapa tahu bisa dapat award karyawan terajin',
      image: ConstantsAssets.imgOnboard3,
    ),
    OnboardingModel(
      title: 'Siap beraksi dengan Assist Hadir?',
      description:
          'Dengan Assist Hadir. Anda bisa fokus pada yang penting : pasien Anda.',
      image: ConstantsAssets.imgOnboard4,
    ),
  ];

  static const onboardingNext = 'Selanjutnya';
  static const onboardingDone = 'Mulai Sekarang';

  //* LOGIN
  static const labelEmail = 'Email';
  static const hintEmail = 'Masukkan email';

  static const labelPassword = 'Password';
  static const hintPassword = 'Masukkan password';
}
