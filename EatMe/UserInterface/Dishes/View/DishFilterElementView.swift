//
//  DishFilterElementView.swift
//  EatMe
//
//  Created by Юрий Альт on 29.06.2023.
//

import SwiftUI

struct DishFilterElementView: View {
    @State private var isSelected = false
    let title: String
    @ObservedObject var viewModel: DishViewModel
    
    var body: some View {
        ZStack {
            Color(isSelected ? .EATME.Blue : .EATME.LightGray)
            Text(title)
                .font(.SFProDisplay.Regular.size(of: 14))
                .foregroundColor(isSelected ? Color(.EATME.White) : Color(.EATME.Black))
                .padding(.horizontal, 10)
        }
        .onAppear {
            isSelected = viewModel.selectedTag == title
        }
        .frame(height: 35.dvs)
        .cornerRadius(10.dhs)
        .onTapGesture {
            viewModel.selectedTag = title
            isSelected.toggle()
            viewModel.filterByTags(isSelected: isSelected, tag: title)
        }
    }
}
