//
//  ResortView.swift
//  SnowSeeker
//
//  Created by mac on 10/12/2024.
//

import SwiftUI

struct ResortView: View {
    let resort: Resort
    
    @Environment(\.horizontalSizeClass) private var horizontalSizeClass
    @Environment(\.dynamicTypeSize) private var dynamicTypeSize
    @Environment(Favorites.self) private var favorites
    
    @State private var selectedFacility: Facility?
    @State private var showingFacility = false
    
    // Break down the details view rendering
    private func createDetailsView() -> some View {
        Group {
            if horizontalSizeClass == .compact && dynamicTypeSize > .large {
                createVerticalDetailsView()
            } else {
                createHorizontalDetailsView()
            }
        }
        .padding(.vertical)
        .background(.primary.opacity(0.1))
        .dynamicTypeSize(...DynamicTypeSize.xxxLarge)
    }
    
    private func createVerticalDetailsView() -> some View {
        VStack(spacing: 10) {
            ResortDetailView(resort: resort)
            SkiDetailsView(resort: resort)
        }
    }
    
    private func createHorizontalDetailsView() -> some View {
        HStack(spacing: 10) {
            ResortDetailView(resort: resort)
            SkiDetailsView(resort: resort)
        }
    }
    
    // Create a separate view for facilities
    private func createFacilitiesSection() -> some View {
        Group {
            Text("Facilities")
                .font(.headline)

            HStack {
                ForEach(resort.facilityTypes) { facility in
                    Button {
                        selectedFacility = facility
                        showingFacility = true
                    } label: {
                        facility.icon
                            .font(.title)
                    }
                }
            }
            .padding(.vertical)
        }
        .padding(.horizontal)
    }
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 0) {
                ZStack(alignment: .bottomTrailing) {
                    Image(decorative: resort.id)
                        .resizable()
                        .scaledToFit()
                    
                    Text(resort.imageCredit)
                        .padding(10)
                        .background(.black.opacity(0.7))
                        .foregroundStyle(.white)
                        .offset(x: -5, y: -5)
                }
                
                createDetailsView()
                
                Group {
                    Text(resort.description)
                        .padding(.vertical)

                    createFacilitiesSection()
                }
                
                Button(favorites.contains(resort) ? "Remove from Favorites" : "Add to Favorites") {
                    if favorites.contains(resort) {
                        favorites.remove(resort)
                    } else {
                        favorites.add(resort)
                    }
                }
                .buttonStyle(.borderedProminent)
                .padding()
            }
        }
        .navigationTitle("\(resort.name), \(resort.country)")
        .navigationBarTitleDisplayMode(.inline)
        .alert(selectedFacility?.name ?? "More information", isPresented: $showingFacility, presenting: selectedFacility) { _ in
        } message: { facility in
            Text(facility.description)
        }
    }
}

#Preview {
    ResortView(resort: .example)
        .environment(Favorites())
}
