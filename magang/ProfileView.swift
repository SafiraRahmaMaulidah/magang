import SwiftUI
import FirebaseAuth
import Combine

struct ProfileInfoView: View {
  @ObservedObject var auth: AuthenticationManager
  
  var body: some View {
    VStack(spacing: 24) {
      
      // Foto Profil (placeholder)
      Image(systemName: "person.crop.circle")
        .resizable()
        .scaledToFit()
        .frame(width: 90, height: 90)
        .foregroundStyle(.pink)
        .padding(.top, 20)
      
      // Email
      VStack(spacing: 4) {
        Text("Email")
          .font(.caption)
          .foregroundStyle(.secondary)
        
        Text(auth.user?.email ?? "-")
          .font(.headline)
      }
      
      Divider().padding(.horizontal)
      
      // Tombol Refresh
      Button {
        Task { await auth.reloadUser() }
      } label: {
        HStack {
          Image(systemName: "arrow.clockwise")
          Text("Refresh")
        }
        .frame(maxWidth: .infinity)
        .padding()
        .background(.gray.opacity(0.15))
        .cornerRadius(12)
      }
      .padding(.horizontal)
      
      // Tombol Logout
      Button {
        auth.signOut()
      } label: {
        HStack {
          Image(systemName: "rectangle.portrait.and.arrow.right")
          Text("Keluar")
        }
        .frame(maxWidth: .infinity)
        .padding()
        .background(Color.red)
        .foregroundStyle(.white)
        .cornerRadius(12)
      }
      .padding(.horizontal)
      
      Spacer()
    }
    .navigationTitle("Profile")
    .navigationBarTitleDisplayMode(.inline)
  }
}

struct ProfileView: View {
  @StateObject private var auth = AuthenticationManager.shared
  @State private var showLogin = false
  
  var body: some View {
    Group {
      // MARK: - Kondisi Belum Login
      if auth.user == nil {
        VStack(spacing: 16) {
          Image(systemName: "person.crop.circle.badge.exclamationmark")
            .font(.system(size: 64))
            .foregroundStyle(.secondary)
          
          Text("Anda belum login")
            .font(.headline)
          
          Button {
            showLogin = true
          } label: {
            Text("Masuk / Daftar")
              .frame(maxWidth: .infinity)
              .padding()
              .background(Color.pink)
              .foregroundStyle(.white)
              .cornerRadius(12)
          }
          .padding(.horizontal)
        }
        .sheet(isPresented: $showLogin) {
          LoginView()
        }
        
      } else {
        // MARK: - Sudah Login
        ProfileInfoView(auth: auth)
      }
    }
    .onAppear {
      auth.loadInitialUser()              // <-- WAJIB agar login bertahan
      Task { await auth.reloadUser() }    // <-- Refresh data user
    }
  }
}

#Preview {
  NavigationStack { ProfileView() }
}
