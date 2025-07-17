# DeepLinkRouterKit

**A lightweight, declarative, and SwiftUI-native deep linking library for modern iOS apps.**  
Save hours of boilerplate, make your navigation system clean, and empower your app to respond to any URL with elegance.

---

## ✨ Why DeepLinkRouterKit?

Deep linking is essential for modern apps: marketing campaigns, push notifications, universal links, in-app routing — all rely on it.

Yet, traditional deep linking in SwiftUI is:
- ❌ Fragile with `NavigationLink`
- ❌ Cluttered with manual logic
- ❌ Hard to test or reuse

**DeepLinkRouterKit** makes it:
- ✅ Declarative and centralized
- ✅ Fully SwiftUI-compatible
- ✅ Minimal setup and maximum flexibility

---

## ✅ Key Benefits

- 🔗 **URL-to-View mapping** with just one line
- 🧭 **NavigationStack-compatible** routing
- 🧱 **Modular** and scalable routing engine
- 🧪 **Test-friendly** routing logic
- ⚡ **No third-party dependencies**
- 🛠 Easy to integrate into **existing or new SwiftUI apps**

---


## 📥 Installation

1. Drag `DeepLinkRouterKit.swift` into your Xcode project.
2. Use it in your SwiftUI or UIKit views as needed.

---

## 🚀 Getting Started

### Step 1: Register Routes

```swift
DeepLinkRouter.shared.register(
    DeepLinkRoute(path: "/profile") {
        ProfileView()
    }
)
```

### Step 2: Use `DeepLinkNavigationView`

```swift
@main
struct MyApp: App {
    init() {
        DeepLinkRouter.shared.register(DeepLinkRoute(path: "/settings") {
            SettingsView()
        })
    }

    var body: some Scene {
        WindowGroup {
            DeepLinkNavigationView {
                HomeView()
            }
        }
    }
}
```

### Step 3: Trigger Navigation via URL

```swift
Button("Go to Profile") {
    DeepLinkRouter.shared.handleURL(URL(string: "/profile")!)
}
```

---

## 💡 What Makes It Stand Out?

| Feature | DeepLinkRouterKit | Traditional SwiftUI |
|--------|-------------------|---------------------|
| Easy Deep Linking | ✅ One-line registration | ❌ Manual parsing |
| SwiftUI Navigation | ✅ NavigationStack support | ⚠️ Often breaks |
| Centralized Routing | ✅ Clean & testable | ❌ Scattered logic |
| Scalable Architecture | ✅ Built-in extensibility | ❌ Hard to maintain |

---

## 📁 Example

The demo app includes:
- `/profile` and `/settings` routes
- Navigation using `.handleURL()`
- A clean root view using `DeepLinkNavigationView`

---

## 🛡 License

MIT License. Use freely in personal and commercial projects.

---

## 💬 Support

Got feedback or feature request? Open an issue or drop a star 🌟 to support the project.

