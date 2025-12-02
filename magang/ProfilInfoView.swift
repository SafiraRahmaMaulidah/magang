//
//  ProfilInfoView.swift
//  magang
//
//  Created by iCodeWave Community on 01/12/25.
//
import SwiftUI
import FirebaseAuth

struct ProfilInfoView: View {
    @ObservedObject var auth = AuthenticationManager.shared

    var body: some View {
        VStack(spacing: 24) {

            Image(systemName: "person.crop.circle")
                .resizable()
                .scaledToFit()
                .frame(width: 90, height: 90)
                .foregroundStyle(.pink)
                .padding(.top, 20)

            VStack(spacing: 4) {
                Text("Email")
                    .font(.caption)
                    .foregroundStyle(.secondary)

                Text(auth.user?.email ?? "-")
                    .font(.headline)
            }

            Divider().padding(.horizontal)

            Button {
                auth.signOut()
            } label: {
                Text("Keluar")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.red)
                    .foregroundStyle(.white)
                    .cornerRadius(12)
            }
            .padding(.horizontal)

            Spacer()
        }
        .navigationTitle("Profil")
        .navigationBarTitleDisplayMode(.inline)
    }
}


