//
//  NotGayGradientButton.swift
//  IsItGay
//
//  Created by Chris Rogers on 11/18/24.
//
import SwiftUI

struct NotGayGradientButton: View {
    var title: String
    var action: () -> Void

    var body: some View {
        Button(action: action) {
            Text(title)
                .font(.headline)
                .foregroundColor(.white)
                .padding(5)
            // Grey and black gradient button
                .background(LinearGradient(gradient: Gradient(colors: [.white, .gray, .black]), startPoint: .topLeading, endPoint: .bottomTrailing))
                .cornerRadius(10)
                .shadow(radius: 5)
                
        }
    }
}
