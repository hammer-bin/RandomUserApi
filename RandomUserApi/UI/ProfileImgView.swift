//
//  ProfileImgView.swift
//  RandomUserApi
//
//  Created by minkyuLee on 2022/07/30.
//

import SwiftUI
import URLImage

struct ProfileImgView: View {
    
    let imageUrl: URL
    
    var body: some View {
        URLImage(imageUrl) { image in
            image
                .resizable()
                .aspectRatio(contentMode: .fit)
        }
        .frame(width: 50, height: 60)
        .clipShape(Circle())
        .overlay(
            Circle().stroke(Color.yellow, lineWidth: 2)
            )
    }
}

struct ProfileImgView_Previews: PreviewProvider {
    static var previews: some View {
        let url = URL(string: "https://randomuser.me/api/portraits/women/91.jpg")!
        ProfileImgView(imageUrl: url)
    }
}
