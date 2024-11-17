//
//  GradientBackground.swift
//  IsItGay
//
//  Created by Chris Rogers on 11/18/24.
//
import SwiftUI

struct GradientBackground: View {
    var body: some View {
        //primary secondary background gradient
        LinearGradient(gradient: Gradient(colors: [.primary, .secondary]), startPoint: .leading, endPoint: .trailing)
            .edgesIgnoringSafeArea(.all)
    }
}
