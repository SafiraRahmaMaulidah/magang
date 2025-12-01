import SwiftUI

struct LoginView: View {
    @Environment(\.dismiss) var dismiss
    @ObservedObject var auth = AuthenticationManager.shared

    @State private var email = ""
    @State private var password = ""
    @State private var showRegister = false
    @State private var loginFailed = false

    var body: some View {
        NavigationStack {
            VStack(spacing: 16) {

                Image(systemName: "person.crop.circle.fill")
                    .font(.system(size: 80))
                    .foregroundColor(.pink.opacity(0.7))
                    .padding(.bottom, 20)

                TextField("Email", text: $email)
                    .textFieldStyle(.roundedBorder)
                SecureField("Password", text: $password)
                    .textFieldStyle(.roundedBorder)

                Button {
                    Task {
                        do {
                            try await auth.signIn(email: email, password: password)
                            dismiss()
                        } catch {
                            loginFailed = true
                        }
                    }
                } label: {
                    Text("Masuk")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.pink)
                        .foregroundColor(.white)
                        .cornerRadius(12)
                }

                Button("Belum punya akun? Daftar") {
                    showRegister = true
                }
                .padding(.top, 8)

                Spacer()
            }
            .padding()
            .navigationTitle("Masuk")
            .sheet(isPresented: $showRegister) {
                RegisterView()
            }
            .alert("Login gagal", isPresented: $loginFailed) {
                Button("OK", role: .cancel) {}
            } message: {
                Text("Email atau password salah, atau akun tidak ditemukan.")
            }
        }
    }
}

