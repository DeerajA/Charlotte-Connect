//
//  Charlotte_ConnectApp.swift
//  Charlotte Connect
//
//  Created by Deeraj Anandraj on 9/16/24.
//

import SwiftUI
import SwiftData

@main
struct Charlotte_ConnectApp: App {
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            Item.self,
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(sharedModelContainer)
    }
}
