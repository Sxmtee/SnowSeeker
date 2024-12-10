//
//  GroupLayoutView.swift
//  SnowSeeker
//
//  Created by mac on 02/12/2024.
//

import SwiftUI

struct UserView: View {
    var body: some View {
        Group {
            Text("Name: Paul")
            Text("Country: England")
            Text("Pets: Luna and Arya")
        }
        .font(.title)
    }
}

struct GroupLayoutView: View {
    @Environment(\.horizontalSizeClass) var horizontalSizeClass

    var body: some View {
        ViewThatFits {
            Rectangle()
                .frame(width: 500, height: 200)

            Circle()
                .frame(width: 200, height: 200)
        }
//        if horizontalSizeClass == .compact {
//            VStack {
//                UserView()
//            }
//        } else {
//            HStack {
//                UserView()
//            }
//        }
    }
}

#Preview {
    GroupLayoutView()
}
