import Foundation
import Combine
import FirebaseAuth
import FirebaseFirestore

@MainActor
class AuthenticationManager: ObservableObject {
    static let shared = AuthenticationManager()

    @Published var user: FirebaseAuth.User?

    private init() {
        // ❌ Jangan akses Auth di sini
        self.user = nil
    }

    func loadInitialUser() {
        self.user = Auth.auth().currentUser
    }

    func reloadUser() async {
        do {
            try await Auth.auth().currentUser?.reload()
            self.user = Auth.auth().currentUser
        } catch {
            print("Failed to reload user:", error.localizedDescription)
        }
    }

    func signOut() {
        do {
            try Auth.auth().signOut()
            self.user = nil
        } catch {
            print("Sign out error:", error.localizedDescription)
        }
    }

    func createUser(email: String, password: String) async throws -> FSUserModel {
        let result = try await Auth.auth().createUser(withEmail: email, password: password)
        let authUser = AuthUserModel(user: result.user)
        self.user = result.user

        let data: [String: Any] = [
            "id": authUser.uid,
            "email": authUser.email ?? ""
        ]

        try await Firestore.firestore()
            .collection("user")
            .document(authUser.uid)
            .setData(data, merge: false)

        return FSUserModel(uid: authUser.uid, email: authUser.email ?? "")
    }

    func signInUser(email: String, password: String) async throws -> FSUserModel {
        let signInResult = try await Auth.auth().signIn(withEmail: email, password: password)
        let authUser = AuthUserModel(user: signInResult.user)
        self.user = signInResult.user

        let snapshot = try await Firestore.firestore()
            .collection("user")
            .document(authUser.uid)
            .getDocument()

        guard let data = snapshot.data() else {
            return FSUserModel(uid: "", email: "")
        }

        let id = data["id"] as? String ?? ""
        let email = data["email"] as? String ?? ""
        return FSUserModel(uid: id, email: email)
    }
}

