//
//  TicketView.swift
//  magang
//
//  Created by MacBook Pro M1 on 20/11/25.
//

import SwiftUI
import Combine

class TicketViewModel: ObservableObject {
    @Published var tickets: [Event] = []
}


struct TicketView: View {
    @StateObject var vm = TicketViewModel()

    var body: some View {
        NavigationView {
            List(vm.tickets) { event in
                VStack(alignment: .leading) {
                    Text(event.title).bold()
                    Text("Status: Sudah Dibayar").foregroundColor(.green)
                }
            }
            .navigationTitle("Tiket Anda")
        }
    }
}

#Preview {
    TicketView()
}
