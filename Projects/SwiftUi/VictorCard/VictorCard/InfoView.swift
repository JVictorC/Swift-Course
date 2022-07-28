//
//  InfoView.swift
//  VictorCard
//
//  Created by Joao Victor on 21/07/22.
//

import SwiftUI

struct InfoView: View {
    
    let title: String
    let imageName: String
    
    var body: some View {
        RoundedRectangle(cornerRadius: 25)
            .frame(height: 50)
            .foregroundColor(.white)
            .overlay(
                HStack {
                    Image(systemName: imageName)
                        .foregroundColor(.green)
                    Text(title)
                    
                }
            )
            .padding()
    }
}

struct InfoPreview: PreviewProvider{
    static var previews: some View {
        InfoView(title: "Preview", imageName: "phone.fill")
            .previewLayout(.sizeThatFits)
    }
}
