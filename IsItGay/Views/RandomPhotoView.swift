//
//  RandomPhotoView.swift
//  IsItGay
//
//  Created by Chris Rogers on 11/17/24.
//


import SwiftUI

struct RandomPhotoView: View {
    let photo: UnsplashPhoto
    let onCool: () -> Void
    let onNotCool: () -> Void
    
    var body: some View {
        VStack {
            AsyncImage(url: URL(string: photo.url)) { image in
                image
                    .resizable()
                    .scaledToFit()
            } placeholder: {
                ProgressView()
            }
            HStack {
                Button("Cool") {
                    onCool()
                }
                .buttonStyle(.borderedProminent)
                .tint(.green)
                
                Button("Not Cool") {
                    onNotCool()
                }
                .buttonStyle(.borderedProminent)
                .tint(.red)
            }
        }
        .padding()
    }
}

