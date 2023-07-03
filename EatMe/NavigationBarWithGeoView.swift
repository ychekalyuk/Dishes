//
//  NavigationBarWithGeoView.swift
//  EatMe
//
//  Created by Юрий Альт on 01.07.2023.
//

import SwiftUI

struct NavigationBarWithGeoView: View {
    @StateObject private var locationService = LocationService()
    private let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd MMMM, yyyy"
        return formatter
    }()
    
    var body: some View {
        HStack(spacing: 0) {
            VStack {
                Image("location")
                    .frame(width: 24, height: 24)
                    .padding(.top, 3)
                Spacer()
            }
            
            VStack {
                HStack {
                    Text(locationService.currentCity)
                        .font(Font.system(size: 18, weight: .medium))
                    Spacer()
                }
                .padding(.top, 1)
                HStack {
                    Text(dateFormatter.string(from: Date()))
                        .font(Font.system(size: 14, weight: .regular))
                        .foregroundColor(Color.black.opacity(0.5))
                    Spacer()
                }
                Spacer()
            }
            
            .padding(.leading, 4)
            Spacer()
            Image("avatar")
                .frame(width: 44, height: 44)
        }
        .padding(.top, 51)
        .padding(.horizontal, 16)
        .frame(height: 101)
        .onAppear {
            locationService.getLocation()
        }
    }
}
