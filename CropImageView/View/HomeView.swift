//
//  HomeView.swift
//  CropImageView
//
//  Created by YILMAZ ER on 29.05.2023.
//

import SwiftUI

struct HomeView: View {
    @State private var showPicker: Bool = false
    @State private var croppedImage: UIImage?
    var body: some View {
        NavigationStack {
            VStack {
                if let croppedImage {
                    Image(uiImage: croppedImage)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 300, height: 400)
                } else {
                    Text("No Image is Selected")
                        .font(.caption)
                        .foregroundColor(.gray)
                }
            }
            .navigationTitle("Crop Image Picker")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        showPicker.toggle()
                    } label: {
                        Image(systemName: "photo.on.rectangle.angled")
                            .font(.callout)
                    }

                }
            }
            .cropImagePicker(options: [.circle, .square, .rectangle], show: $showPicker, cropImage: $croppedImage)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
