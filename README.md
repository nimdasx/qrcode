# QR Code Scanner

A modern Flutter application for scanning QR codes and barcodes with persistent history tracking.

## Features

- **Fast Scanning**: High-performance QR and barcode scanning using `mobile_scanner`.
- **Scan History**: Automatically saves every scanned result locally using `Hive`.
- **Smart Actions**: 
  - Open scanned URLs directly in the browser.
  - Copy results to the clipboard.
  - Share scanned content via `share_plus`.
- **History Management**:
  - Swipe to delete individual records using `flutter_slidable`.
  - Clear all history with a single tap.
- **Custom UI**: Includes a dedicated scanner overlay for a professional look and feel.

## Tech Stack

- **Framework**: Flutter
- **State Management**: [Riverpod](https://riverpod.dev/)
- **Local Database**: [Hive](https://hivedb.dev/)
- **Key Plugins**:
  - `mobile_scanner` - For camera scanning.
  - `flutter_slidable` - For history item actions.
  - `url_launcher` - For opening web links.
  - `share_plus` - For sharing content.

## Getting Started

### Prerequisites
- Flutter SDK installed.
- A physical device (Camera functionality does not work on most emulators).

### Installation
1. Clone the repository:
   ```bash
   git clone <repository-url>
   ```
2. Navigate to the project directory:
   ```bash
   cd qrcode
   ```
3. Install dependencies:
   ```bash
   flutter pub get
   ```
4. Run the application:
   ```bash
   flutter run
   ```
