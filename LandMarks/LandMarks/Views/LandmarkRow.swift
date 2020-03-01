//
//  LandmarkRow.swift
//  LandMarks
//
//  Created by zl jiao on 2020/2/29.
//  Copyright © 2020 zl jiao. All rights reserved.
//

import SwiftUI

struct LandmarkRow: View {
    var landmark: LandMark
    
    var body: some View {
        HStack {
            landmark.image
                .resizable()
                .frame(width: 50, height: 50)
                .cornerRadius(8)
            Text(landmark.name)
            Spacer()
            if landmark.isFavorite {
                Image(systemName: "star.fill")
                    .imageScale(.medium)
                    .foregroundColor(.yellow)
            }
        }
    }
}

struct LandmarkRow_Previews: PreviewProvider {
    static var previews: some View {
        
        Group {
            LandmarkRow(landmark: landmarkData[0])
            LandmarkRow(landmark: landmarkData[1])
        }.previewLayout(PreviewLayout.fixed(width: 300, height: 70))
        
    }
}
