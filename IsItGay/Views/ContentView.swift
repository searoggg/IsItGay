//
//  ContentView.swift
//  IsItGay
//
//  Created by Chris Rogers on 11/17/24.
//


import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = UnsplashViewModel()
    @State private var gridColumns = [GridItem(.adaptive(minimum: 150))]
    @State private var photoCount = 5
    
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    Button("Generate Photos") {
                        viewModel.fetchRandomPhotos(count: photoCount)
                    }
                    .buttonStyle(.borderedProminent)
                    
                    Stepper("Count: \(photoCount)", value: $photoCount, in: 1...20)
                }
                .padding()
                
                ScrollView {
                    LazyVGrid(columns: gridColumns, spacing: 20) {
                        ForEach(viewModel.photos) { photo in
                            RandomPhotoView(photo: photo) {
                                viewModel.markAsCool(photo: photo)
                            } onNotCool: {
                                viewModel.markAsNotCool(photo: photo)
                            }
                        }
                    }
                    .padding()
                }
                
                NavigationLink("View Cool Photos") {
                    CoolPhotosView(photos: viewModel.coolPhotos)
                }
                .padding()
                
                NavigationLink("View Not Cool Photos") {
                    NotCoolPhotosView(photos: viewModel.notCoolPhotos)
                }
                .padding()
            }
            .navigationTitle("Unsplash Viewer")
        }
    }
}

//Add Xcode Preview
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
