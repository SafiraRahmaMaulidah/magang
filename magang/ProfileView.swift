//
//  ProfileView.swift
//  magang
//
//  Created by MacBook Pro M1 on 20/11/25.
//

import SwiftUI
import Combine
import Foundation

class ProfileViewModel: ObservableObject {
    @Published var username = "User Demo"
}

struct ProfileView: View {
    @StateObject private var viewModel = ProfileViewModel()

    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                Text(viewModel.username)
                    .font(.title)

                Button("Logout") {
                    print("Logout tapped")
                }
                .foregroundColor(.red)

                Spacer()
            }
            .navigationTitle("Profile")
        }
    }
}
//#Preview {
//    ProfileView()
////}
