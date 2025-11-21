//
//  EventCard.swift
//  magang
//
//  Created by MacBook Pro M1 on 20/11/25.
//

import SwiftUI

struct EventCard: View {
    let event: Event

    var body: some View {
        VStack(alignment: .leading) {
            Rectangle()
                .fill(Color.gray.opacity(0.2))
                .frame(height: 140)      // nanti diganti image async

            Text(event.title)
                .font(.headline)

            Text(event.city)
                .foregroundColor(.gray)

            Text(event.date)
                .foregroundColor(.gray)

            Text("Rp \(event.price)")
                .foregroundColor(.pink)
        }
        .padding()
        .background(Color.white)
        .cornerRadius(12)
        .shadow(radius: 3)
        .padding(.horizontal)
    }
}


//#Preview {
//    EventCard()
//}
