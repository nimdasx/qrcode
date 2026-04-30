# Persiapan Publish Aplikasi LensaQR ke Google Play Store

Dokumen ini berisi panduan langkah-demi-langkah untuk mempersiapkan aplikasi LensaQR agar siap dipublikasikan ke Google Play Store.

## 1. Pengaturan Identitas Aplikasi
Pastikan informasi berikut sudah sesuai:
- **Application ID**: `id.web.sofy.qrcode` (Sudah terkonfigurasi di `android/app/build.gradle.kts`). Jangan mengubah ini setelah aplikasi dipublikasikan.
- **App Name**: `LensaQR` (Pastikan nama tampilan di `AndroidManifest.xml` sudah benar).
- **Version**: Update versi di `pubspec.yaml`.
  - `version: 1.0.0+1` (Format: `versionName+versionCode`). `versionCode` harus selalu naik setiap kali upload build baru.

## 2. Ikon Aplikasi & Splash Screen
- Ikon aplikasi saat ini menggunakan `assets/icon.png`.
- Pastikan ikon sudah memenuhi standar Google Play (Adaptive Icons).
- Jalankan perintah berikut untuk memperbarui ikon:
  ```bash
  flutter pub run flutter_launcher_icons
  ```

## 3. Konfigurasi Signing (Keystore)
Aplikasi harus ditandatangani (signed) dengan keystore untuk versi release.

### Langkah-langkah Membuat Keystore:
1. Jalankan perintah berikut di terminal:
   ```bash
   keytool -genkey -v -keystore ~/upload-keystore.jks -keyalg RSA -keysize 2048 -validity 10000 -alias upload
   ```
2. Simpan file `upload-keystore.jks` di tempat yang aman dan **jangan pernah menghilangkannya**.

### Konfigurasi di Flutter:
1. Buat file `android/key.properties`:
   ```properties
   storePassword=PASSWORD_ANDA
   keyPassword=PASSWORD_ANDA
   keyAlias=upload
   storeFile=/Users/sofyan/upload-keystore.jks
   ```
2. Update `android/app/build.gradle.kts` untuk menggunakan `key.properties` pada `signingConfigs`.

## 4. Optimasi Build
Gunakan App Bundle (.aab) untuk ukuran download yang lebih kecil bagi pengguna.

**Perintah Build:**
```bash
flutter build appbundle
```
Hasil file akan berada di: `build/app/outputs/bundle/release/app-release.aab`

## 5. Persiapan Google Play Console
Siapkan aset berikut untuk halaman toko:
- **Deskripsi Singkat**: (Maks 80 karakter).
- **Deskripsi Lengkap**: (Maks 4000 karakter).
- **Ikon Aplikasi**: 512 x 512 px (PNG/JPEG, max 1MB).
- **Feature Graphic**: 1024 x 500 px (PNG/JPEG).
- **Screenshots**: Minimal 2 screenshot untuk ponsel, tablet 7 inci, dan 10 inci.

## 6. Checklist Terakhir sebelum Upload
- [ ] Sudah mencoba `flutter run --release` untuk memastikan tidak ada bug di mode release.
- [ ] Sudah melakukan pengujian pada berbagai ukuran layar.
- [ ] Sudah menyiapkan Privacy Policy (diperlukan untuk akses kamera).
- [ ] Versi aplikasi di `pubspec.yaml` sudah benar.
