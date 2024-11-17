//
//  CoolPhotosView.swift
//  IsItGay
//
//  Created by Chris Rogers on 11/17/24.
//


import SwiftUI

struct CoolPhotosView: View {
    let photos: [UnsplashPhoto]
    
    var body: some View {
        List(photos) { photo in
            AsyncImage(url: URL(string: photo.url)) { image in
                image
                    .resizable()
                    .scaledToFit()
            } placeholder: {
                ProgressView()
            }
        }
        .navigationTitle("Cool Photos")
    }
}
