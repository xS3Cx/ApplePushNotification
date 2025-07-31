<div align="center">

# 🍎 Apple Push Notification System

[![iOS](https://img.shields.io/badge/iOS-10.0+-blue.svg)](https://developer.apple.com/ios/)
[![License](https://img.shields.io/badge/License-MIT-green.svg)](LICENSE)
[![Platform](https://img.shields.io/badge/Platform-iOS-lightgrey.svg)](https://www.apple.com/ios/)
[![Language](https://img.shields.io/badge/Language-Objective--C-orange.svg)](https://developer.apple.com/library/archive/documentation/Cocoa/Conceptual/ProgrammingWithObjectiveC/Introduction/Introduction.html)

**A simple, local push notification for iOS**

[Features](#-features) • [Installation](#-installation) • [Usage](#-usage) • [Examples](#-examples)

</div>

---

![photo_1_2025-07-31_04-38-17](https://github.com/user-attachments/assets/e788d5e2-2187-4f64-9fdb-d6bbc2fe87c1)


## 🎯 Overview

**Apple Push Notification** is a lightweight, efficient local notification system designed specifically for iOS applications. Unlike traditional push notifications that require external servers, this system operates entirely locally on the device.

### ✨ Key Benefits

> 💡 **Local Operation** - No external server dependencies
> 
> 🎯 **System Integration** - Seamless iOS experience
> 
> ⚡ **Instant Delivery** - Immediate notification display
> 
> 🔒 **Privacy Focused** - All data stays on device

---

## 🏗️ Architecture

<div align="center">

```mermaid
graph TB
    subgraph "Application Layer"
        A["<div style='background: linear-gradient(45deg, #2c3e50 0%, #34495e 100%); padding: 10px; border-radius: 10px; color: white; font-weight: bold;'>Your App Code</div>"] --> B["<div style='background: linear-gradient(45deg, #8e44ad 0%, #9b59b6 100%); padding: 10px; border-radius: 10px; color: white; font-weight: bold;'>ApplePushNotification</div>"]
        B --> C["<div style='background: linear-gradient(45deg, #2980b9 0%, #3498db 100%); padding: 10px; border-radius: 10px; color: white; font-weight: bold;'>UNUserNotificationCenter</div>"]
    end
    
    subgraph "System Layer"
        C --> D["<div style='background: linear-gradient(45deg, #e74c3c 0%, #c0392b 100%); padding: 10px; border-radius: 10px; color: white; font-weight: bold;'>UNMutableNotificationContent</div>"]
        C --> E["<div style='background: linear-gradient(45deg, #f39c12 0%, #e67e22 100%); padding: 10px; border-radius: 10px; color: white; font-weight: bold;'>UNTimeIntervalNotificationTrigger</div>"]
        D --> F["<div style='background: linear-gradient(45deg, #27ae60 0%, #2ecc71 100%); padding: 10px; border-radius: 10px; color: white; font-weight: bold;'>UNNotificationRequest</div>"]
        E --> F
        F --> G["<div style='background: linear-gradient(45deg, #1a1a2e 0%, #16213e 100%); padding: 10px; border-radius: 10px; color: white; font-weight: bold;'>iOS System</div>"]
    end
    
    subgraph "User Layer"
        G --> H["<div style='background: linear-gradient(45deg, #16a085 0%, #1abc9c 100%); padding: 10px; border-radius: 10px; color: white; font-weight: bold;'>Notification Banner</div>"]
        G --> I["<div style='background: linear-gradient(45deg, #8e44ad 0%, #9b59b6 100%); padding: 10px; border-radius: 10px; color: white; font-weight: bold;'>Notification Center</div>"]
        G --> J["<div style='background: linear-gradient(45deg, #e67e22 0%, #d35400 100%); padding: 10px; border-radius: 10px; color: white; font-weight: bold;'>Lock Screen</div>"]
    end
    
    style A fill:none
    style B fill:none
    style C fill:none
    style D fill:none
    style E fill:none
    style F fill:none
    style G fill:none
    style H fill:none
    style I fill:none
    style J fill:none
```

</div>



---

## 📦 Installation

### Prerequisites

- iOS 10.0 or later
- Xcode 12.0 or later (or Theos)
- Objective-C project

### Setup

1. **Add files to your project:**
   ```bash
   ApplePushNotification.h
   ApplePushNotification.mm
   ```

2. **Import in your project:**
   ```objc
   #import "ApplePushNotification.h"
   ```

3. **Request permissions in setup:**
   ```objc
   [ApplePushNotification requestPermissions];
   ```

---

## ⚡ Quick Start

```objc
// 1. Import the header
#import "ApplePushNotification.h"

// 2. Request permissions (in setup)
[ApplePushNotification requestPermissions];

// 3. Send a basic notification
[ApplePushNotification Notification:@"Hello World" 
                            message:@"This is your first notification!"];

// 4. Send with subtitle
[ApplePushNotification NotificationWithSubtitle:@"Status Update" 
                                       subtitle:@"System" 
                                        message:@"Everything is working perfectly!"];
```

---

## 📖 Usage

### 🔔 Basic Notification

```objc
[ApplePushNotification Notification:@"Title" message:@"Description"];
```

**Features:**
- ✅ Title
- ✅ Description  
- ✅ Default sound
- ✅ Badge (1)

### 📝 Notification with Subtitle

```objc
[ApplePushNotification NotificationWithSubtitle:@"Title" 
                                       subtitle:@"Subtitle" 
                                        message:@"Description"];
```

**Features:**
- ✅ Title
- ✅ Subtitle
- ✅ Description
- ✅ Default sound

### 🔐 Permission Management

```objc
// Check if notifications are enabled
if ([ApplePushNotification isEnabled]) {
    // Send notification
    [ApplePushNotification Notification:@"Test" message:@"It works!"];
} else {
    // Request permissions
    [ApplePushNotification requestPermissions];
}
```



---

## 💡 Examples

### 🎯 Example 1: Status Notification

![photo_4_2025-07-31_04-38-17](https://github.com/user-attachments/assets/a5a439d9-007b-45e6-a6b7-07a06b0fd57a)

```objc
dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
    [ApplePushNotification Notification:@"System Ready" 
                                message:@"Application has been successfully started"];
});
```

### 🎯 Example 2: Feature Activation

![photo_3_2025-07-31_04-38-17](https://github.com/user-attachments/assets/c3d555a1-4b39-4ca9-aeeb-65a6621b62eb)

```objc
dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(4.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
    [ApplePushNotification NotificationWithSubtitle:@"Feature Activated" 
                                           subtitle:@"Radar System" 
                                            message:@"Radar has been enabled"];
});
```



## ⚠️ Requirements

<div align="center">

| Requirement | Version | Notes |
|:-----------:|:-------:|:------|
| **iOS** | 10.0+ | Minimum supported version |
| **Xcode** | 12.0+ | For compilation (or Theos) |
| **Framework** | UserNotifications | System framework |
| **Permissions** | User consent | Required for notifications |

</div>

---

## 🔒 Limitations

> ⚠️ **Limited Customization** - Appearance controlled by iOS
> 
> 🚫 **No Animations** - Static display only
> 
> 🔧 **System Dependent** - Follows iOS notification rules
> 
> 🔊 **Sound Control** - Uses system default sound



---

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

---

## 🙏 Credits

This project is based on the excellent work by [nbhasin2/LocalPushNotification](https://github.com/nbhasin2/LocalPushNotification/tree/main) - a simple iOS Swift app for local push notifications. I've adapted and enhanced their implementation for Objective-C with additional features and improved documentation.

**Original Project:** [LocalPushNotification](https://github.com/nbhasin2/LocalPushNotification/tree/main) by [nbhasin2](https://github.com/nbhasin2)

---

<div align="center">

**Made with ❤️ by Alex Zero**

</div> 
