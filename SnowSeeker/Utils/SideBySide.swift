//
//  SideBySide.swift
//  SnowSeeker
//
//  Created by mac on 02/12/2024.
//

import SwiftUI

struct SideBySide: View {
    var body: some View {
        NavigationSplitView {
            NavigationLink("Primary") {
                Text("New view")
            }
        } detail: {
            Text("Content")
        }
    }
}

#Preview {
    SideBySide()
}
