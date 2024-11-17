//
//  NotCoolPhotosView.swift
//  IsItGay
//
//  Created by Chris Rogers on 11/17/24.
//


import SwiftUI

struct NotCoolPhotosView: View {
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
        .navigationTitle("Not Cool Photos")
    }
}
