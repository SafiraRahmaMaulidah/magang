import SwiftUI

struct ProfileView: View {
    @State private var username = "User Demo"
    @State private var email = "userdemo@example.com"

    var body: some View {
        NavigationView {
            VStack(spacing: 24) {

                // FOTO PROFIL
                Image(systemName: "person.circle.fill")
                    .resizable()
                    .frame(width: 110, height: 110)
                    .foregroundColor(.blue.opacity(0.7))
                    .padding(.top, 30)

                // NAMA DAN EMAIL
                VStack(spacing: 6) {
                    Text(username)
                        .font(.title2)
                        .fontWeight(.semibold)

                    Text(email)
                        .foregroundColor(.gray)
                        .font(.subheadline)
                }

                Divider()
                    .padding(.horizontal)

                Spacer()

                // LOGOUT
                Button(action: {
                    print("Logout tapped")
                }) {
                    Text("Logout")
                        .font(.headline)
                        .foregroundColor(.red)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.red.opacity(0.1))
                        .cornerRadius(10)
                }
                .padding(.horizontal)
                .padding(.bottom, 20)
            }
            .navigationTitle("Profile")
        }
    }

    // REUSABLE ROW COMPONENT
    @ViewBuilder
    func profileRow(icon: String, title: String) -> some View {
        HStack {
            Image(systemName: icon)
                .foregroundColor(.blue)
                .frame(width: 30)

            Text(title)
                .foregroundColor(.primary)

            Spacer()

            Image(systemName: "chevron.right")
                .foregroundColor(.gray)
                .font(.caption)
        }
        .padding()
        .background(Color(.systemGray6))
        .cornerRadius(12)
    }
}
