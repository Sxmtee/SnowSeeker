//
//  OptionalAlertSheet.swift
//  SnowSeeker
//
//  Created by mac on 02/12/2024.
//

import SwiftUI

struct User: Identifiable {
    var id = "Taylor Swift"
}

struct OptionalAlertSheet: View {
    @State private var selectedUser: User? = nil
    @State private var isShowingUser = false
    
    var body: some View {
        Button("Tap Me") {
            selectedUser = User()
            isShowingUser = true
        }
        .sheet(item: $selectedUser) { user in
            Text(user.id)
                .presentationDetents([.medium, .large])
        }
//        .alert(
//            "Welcome",
//            isPresented: $isShowingUser,
//            presenting: selectedUser
//        ) { user in
//            Button(user.id) { }
//        }
    }
}

#Preview {
    OptionalAlertSheet()
}
