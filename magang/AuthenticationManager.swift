import Foundation
import FirebaseAuth
import Combine

class AuthenticationManager: ObservableObject {
    static let shared = AuthenticationManager()
    private init() {}

    @Published var user: User?

    func loadInitialUser() {
        self.user = Auth.auth().currentUser
    }

    @MainActor
    func reloadUser() async {
        guard let current = Auth.auth().currentUser else {
            self.user = nil
            return
        }
        try? await current.reload()
        self.user = Auth.auth().currentUser
    }

    func signIn(email: String, password: String) async throws {
        let result = try await Auth.auth().signIn(withEmail: email, password: password)
        await MainActor.run { self.user = result.user }
    }

    func register(email: String, password: String) async throws {
        let result = try await Auth.auth().createUser(withEmail: email, password: password)
        await MainActor.run { self.user = result.user }
    }

    func signOut() {
        try? Auth.auth().signOut()
        self.user = nil
    }
}

