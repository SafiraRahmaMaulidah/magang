import SwiftUI
import Combine

class RegisterViewModel: ObservableObject {
  @Published var email = ""
  @Published var password = ""
  @Published var isRegistering = false
  @Published var isShowSucses = false
  @Published var isShowFailed = false
  func register() {
    Task {
      do {
        let user = try await AuthenticationManager.shared.createUser(email: email, password: password)
        
        print("Register UID:", user.uid)
        isShowSucses = true
        isRegistering = false
      } catch {
        isShowFailed = true
        isRegistering = false
      }
    }
  }
}


struct RegisterView: View {
  @Environment(\.dismiss) var dismiss
  @StateObject var vm = RegisterViewModel()
  
  
  var body: some View {
    NavigationStack {
      Form {
        Section("Email") {
          TextField("Email", text: $vm.email)
            .keyboardType(.emailAddress)
            .textInputAutocapitalization(.never)
            .disableAutocorrection(true)
        }
        Section("Password") {
          TextField("Password", text: $vm.password)
          
        }
        Section {
          Button {
            vm.register()
            vm.isRegistering = true
          } label: {
            HStack {
              if vm.isRegistering {
                ProgressView()
              }
              Text(vm.isRegistering ? "Mendaftarkan..." : "Daftar Akun")
                .bold()
            }
            .disabled(vm.isRegistering)
          }
          
          
          
          .alert("Pendaftaran Berhasil", isPresented: $vm.isShowSucses) {
            Button("Lanjut") { dismiss() }
          } message: {
            Text("Akunmu berhasil dibuat!")
          }
          
          // 🔹 ALERT GAGAL
          .alert("Gagal", isPresented: $vm.isShowFailed) {
            Button("Tutup") { }
          } message: {
            Text("Terjadi kesalahan. Silakan coba lagi.")
          }         }
        .navigationTitle("Register")
        .toolbar {
          ToolbarItem(placement: .cancellationAction) {
            Button("Cancel") {
              dismiss()
            }
          }
        }
      }
    }
  }
}
#Preview {
    RegisterView()
}
