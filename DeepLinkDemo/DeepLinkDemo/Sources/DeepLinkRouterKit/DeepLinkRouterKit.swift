// DeepLinkRouterKit.swift
// Swift Package: DeepLinkRouterKit
// Declarative Deep Linking Library for SwiftUI

import SwiftUI

public struct DeepLinkRoute {
    public let path: String
    public let destination: () -> AnyView

    public init<T: View>(path: String, @ViewBuilder destination: @escaping () -> T) {
        self.path = path
        self.destination = { AnyView(destination()) }
    }
}

public class DeepLinkRouter: ObservableObject {
    @Published public var activePath: String?
    private var routes: [String: () -> AnyView] = [:]

    public static let shared = DeepLinkRouter()
    private init() {}

    public func register(_ route: DeepLinkRoute) {
        routes[route.path] = route.destination
    }

    public func view(for path: String) -> AnyView? {
        routes[path]?()
    }

    public func handleURL(_ url: URL) {
        let path = url.path
        if routes[path] != nil {
            DispatchQueue.main.async {
                self.activePath = path
            }
        }
    }
}

public struct DeepLinkNavigationView<Content: View>: View {
    @ObservedObject private var router = DeepLinkRouter.shared
    let content: () -> Content

    public init(@ViewBuilder content: @escaping () -> Content) {
        self.content = content
    }

    public var body: some View {
        NavigationStack(path: Binding(
            get: { router.activePath.map { [$0] } ?? [] },
            set: { newValue in
                router.activePath = newValue.last
            }
        )) {
            content()
                .navigationDestination(for: String.self) { path in
                    router.view(for: path) ?? AnyView(Text("404 Not Found"))
                }
        }
    }
}
