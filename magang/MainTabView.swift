//
//  MainTabView.swift
//  magang
//
//  Created by MacBook Pro M1 on 20/11/25.
//

import SwiftUI

struct MainTabView: View {
    var body: some View {
        NavigationStack {
            TabView {
                HomeView()
                    .tabItem { Label("Home", systemImage: "house.fill") }

                FavoriteView()
                    .tabItem { Label("Favorite", systemImage: "heart.fill") }

                TransactionHistoryView()
                    .tabItem { Label("History", systemImage: "ticket.fill") }

                ProfileView()
                    .tabItem { Label("Profile", systemImage: "person.fill") }
            }
        }
    }
}

//#Preview {
//  MainTabView
//}
