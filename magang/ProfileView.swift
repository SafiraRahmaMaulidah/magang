import SwiftUI

struct ProfileView: View {
    @StateObject private var auth = AuthenticationManager.shared
    @State private var showLogin = false

    var body: some View {
        Group {
            if auth.user == nil {
                // kosong → hanya trigger login
                Color.clear
                    .onAppear { showLogin = true }
            } else {
                ProfilInfoView()
            }
        }
        .sheet(isPresented: $showLogin, onDismiss: {
            if auth.user == nil {
                showLogin = true   // tetap buka login
            }
        }) {
            LoginView()
        }
        .onAppear {
            auth.loadInitialUser()
            if auth.user == nil {
                showLogin = true
            }
        }
    }
}

