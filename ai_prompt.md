# Prompt for AI: Flutter QR Code Scanner Application

I want to build a professional Flutter application that can scan QR codes. Please provide a comprehensive step-by-step guide and the complete code implementation.

## Project Requirements

### 1. Core Functionality
- **Camera Integration**: Use a modern and well-maintained package (such as `mobile_scanner`) to implement the QR code scanning feature.
- **QR Detection**: The app must be able to detect, parse, and extract the data (URL or text) from a QR code in real-time.
- **Result Handling**: 
    - Display the scanned result in a clean UI (e.g., a bottom sheet or a separate result screen).
    - If the scanned content is a valid URL, provide a button to open it in the system browser using `url_launcher`.
- **History Management**: Implement a way to save scanned results locally. Users should be able to view a list of past scans, re-open URLs, copy the text to clipboard, and share the content using the system share sheet.

### 2. User Experience & UI
- **Design**: Follow Material 3 design guidelines for a modern, clean look.
- **Scanning Interface**: 
    - Implement a scanning screen with a clear viewfinder/overlay to guide the user.
    - Add a toggle button to control the camera flashlight.
- **Permission Handling**: Implement robust camera permission requests and handle cases where the user denies access.
- **History Screen**: A dedicated screen to list all previous scans, sorted by date (most recent first), with easy access to actions like opening, copying, and sharing.

### 3. Technical Specifications
- **Code Quality**: 
    - Follow Flutter best practices and clean architecture.
    - Maintain a clear separation between the UI layer and the business logic.
    - Use a simple state management approach (e.g., `Provider` or `Riverpod`) if necessary.
- **Documentation**: Provide clear comments explaining the logic behind key implementation details.
- **Local Persistence**: Use a lightweight local storage solution (e.g., `shared_preferences`, `hive`, or `sqflite`) to persist the scan history across app restarts.

## Expected Deliverables

Please provide the following:
1. **`pubspec.yaml`**: The complete list of necessary dependencies.
2. **Platform Configuration**: 
    - The required changes for Android (`AndroidManifest.xml`).
    - The required changes for iOS (`Info.plist`).
3. **Project Structure**: A suggested folder organization for the source code.
4. **Full Source Code**: Complete code for the main entry point, scanning screen, and result handling logic.
5. **Setup Guide**: Brief instructions on how to run the application.
