//
//  NavigationBarView.swift
//  EatMe
//
//  Created by Юрий Альт on 30.06.2023.
//

import SwiftUI

struct NavigationBarView: View {
    let title: String
    let backButtonAction: () -> Void
    
    var body: some View {
        HStack {
            Button(action: backButtonAction) {
                Image("arrowLeft")
                    .frame(width: 32.dhs, height: 32.dhs)
            }
            Spacer()
            Text(title)
                .font(Font.SFProDisplay.Medium.size(of: 18.dfs))
            Spacer()
            Image("avatar")
                .frame(width: 44.dhs, height: 44.dhs)
        }
        .padding(.top, 51.dvs)
        .padding(.horizontal, 16.dhs)
        .frame(height: 101.dvs)
    }
}



