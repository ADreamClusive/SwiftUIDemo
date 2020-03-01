//
//  LandmarkList.swift
//  LandMarks
//
//  Created by zl jiao on 2020/2/29.
//  Copyright © 2020 zl jiao. All rights reserved.
//

import SwiftUI

struct LandmarkList: View {
    
    @EnvironmentObject var userData: UserData
    
    var body: some View {
        
        
        List {
            Toggle(isOn: $userData.showFavoritesOnly) {
                Text("Favorites only")
            }
            
            ForEach(userData.landmarks) { landmark in
                
                if !self.userData.showFavoritesOnly || landmark.isFavorite {
                    NavigationLink(destination: LandmarkDetail(landmark: landmark)){
                        LandmarkRow(landmark: landmark)
                    }
                }
            }
        }
        .navigationBarTitle(Text("LandMarks"))
    }
}

struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
        //        "iPhone 11", "iPhone 8", "iPhone 8 Plus"
        NavigationView {
        ForEach(["iPhone 11"], id: \.self) { deviceName in
            
            LandmarkList()
                .environmentObject(UserData())
                .previewDevice(PreviewDevice(rawValue: deviceName))
                .previewDisplayName(deviceName)
        }
        }
    }
}
