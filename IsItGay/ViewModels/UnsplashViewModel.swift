//
//  UnsplashViewModel.swift
//  IsItGay
//
//  Created by Chris Rogers on 11/17/24.
//


import Foundation

class UnsplashViewModel: ObservableObject {
    @Published var photos: [UnsplashPhoto] = []
    @Published var coolPhotos: [UnsplashPhoto] = []
    @Published var notCoolPhotos: [UnsplashPhoto] = []
    
    private let apiKey = "${{ secrets.APIKeySecret }}"
    private let baseURL = "https://api.unsplash.com/photos/random"
    
    func fetchRandomPhotos(count: Int) {
        guard let url = URL(string: "\(baseURL)?count=\(count)&client_id=\(apiKey)") else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data, let jsonArray = try? JSONSerialization.jsonObject(with: data) as? [[String: Any]] {
                DispatchQueue.main.async {
                    self.photos = jsonArray.compactMap { photoData in
                        if let id = photoData["id"] as? String,
                           let urls = photoData["urls"] as? [String: String],
                           let regular = urls["regular"] {
                            return UnsplashPhoto(id: id, url: regular)
                        }
                        return nil
                    }
                }
            }
        }.resume()
    }
    
    func markAsCool(photo: UnsplashPhoto) {
        coolPhotos.append(photo)
        photos.removeAll { $0.id == photo.id }
    }
    
    func markAsNotCool(photo: UnsplashPhoto) {
        notCoolPhotos.append(photo)
        photos.removeAll { $0.id == photo.id }
    }
}
