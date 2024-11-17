//
//  GayGradientButton.swift
//  IsItGay
//
//  Created by Chris Rogers on 11/18/24.
//
import SwiftUI

struct GayGradientButton: View {
    var title: String
    var action: () -> Void

    var body: some View {
        Button(action: action) {
            Text(title)
                .font(.headline)
                .foregroundColor(.white)
                .padding(5)
                .background(LinearGradient(gradient: Gradient(colors: [
                    .red,
                    .orange,
                    .yellow,
                    .green,
                    .blue,
                    .purple,
                    .purple]), startPoint: .topLeading, endPoint: .bottomTrailing))
                .cornerRadius(10)
                .shadow(radius: 5)
        }
    }
}
