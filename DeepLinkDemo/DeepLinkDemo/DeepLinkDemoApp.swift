// DeepLinkRouterKit.swift
// Swift Package: DeepLinkRouterKit
// Declarative Deep Linking Library for SwiftUI

import SwiftUI

// MARK: - Example Usage (for DemoApp)

#if DEBUG
public struct DeepLinkExampleHome: View {
    public var body: some View {
        VStack(spacing: 20) {
            Text("🏠 Home Screen")
                .font(.largeTitle)
            Button("Go to Profile") {
                DeepLinkRouter.shared.handleURL(URL(string: "/profile")!)
            }
            Button("Go to Settings") {
                DeepLinkRouter.shared.handleURL(URL(string: "/settings")!)
            }
        }
    }
}

public struct DeepLinkExampleProfile: View {
    public var body: some View {
        Text("👤 Profile Page")
            .font(.title)
    }
}

public struct DeepLinkExampleSettings: View {
    public var body: some View {
        Text("⚙️ Settings Page")
            .font(.title)
    }
}

@main
struct DeepLinkDemoApp: App {
    init() {
        DeepLinkRouter.shared.register(DeepLinkRoute(path: "/profile") { DeepLinkExampleProfile() })
        DeepLinkRouter.shared.register(DeepLinkRoute(path: "/settings") { DeepLinkExampleSettings() })
    }

    var body: some Scene {
        WindowGroup {
            DeepLinkNavigationView {
                DeepLinkExampleHome()
            }
        }
    }
}
#endif
