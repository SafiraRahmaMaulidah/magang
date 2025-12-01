import SwiftUI

struct RegisterView: View {
    @Environment(\.dismiss) var dismiss
    @ObservedObject var auth = AuthenticationManager.shared

    @State private var email = ""
    @State private var password = ""
    @State private var showError = false

    var body: some View {
        NavigationStack {
            VStack(spacing: 16) {

                Image(systemName: "rectangle.and.pencil.and.ellipsis")
                    .font(.system(size: 70))
                    .foregroundColor(.pink)
                    .padding(.bottom, 20)

                TextField("Email", text: $email)
                    .textFieldStyle(.roundedBorder)

                SecureField("Password", text: $password)
                    .textFieldStyle(.roundedBorder)

                Button {
                    Task {
                        do {
                            try await auth.register(email: email, password: password)
                            dismiss()
                        } catch {
                            showError = true
                        }
                    }
                } label: {
                    Text("Daftar")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.green)
                        .foregroundColor(.white)
                        .cornerRadius(12)
                }

                Spacer()
            }
            .padding()
            .navigationTitle("Daftar")
            .alert("Gagal mendaftar", isPresented: $showError) {
                Button("OK", role: .cancel) {}
            }
        }
    }
}
