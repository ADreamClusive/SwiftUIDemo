//
//  Home.swift
//  LandMarks
//
//  Created by zl jiao on 2020/3/1.
//  Copyright © 2020 zl jiao. All rights reserved.
//

import SwiftUI

struct CategoryHome: View {
    var categories: [String: [LandMark]] {
        Dictionary (
            grouping: landmarkData,
            by: { $0.category.rawValue }
        )
    }
    
    var featured: [LandMark] {
        landmarkData.filter{ $0.isFeatured }
    }
    
    @State var showingProfile = false
    @EnvironmentObject var userData: UserData
    
    var profileButton: some View {
        Button(action: { self.showingProfile.toggle()
        }) {
            Image(systemName: "person.crop.circle")
                .imageScale(.large)
            .accessibility(label: Text("User Profile"))
            .padding()
        }
    }
    
    var body: some View {
        
        NavigationView {
            List {
//                FeaturedLandMarks(landmarks: featured)
//                    .scaledToFill()
//                    .frame(height: 200)
//                    .clipped()
//                    .listRowInsets(EdgeInsets())
                
                PageView(features.map { FeatureCard(landmark: $0) })
                .aspectRatio(3/2, contentMode: .fit)
                .listRowInsets(EdgeInsets())
                
                ForEach(categories.keys.sorted(), id: \.self) { key in
                    
                    CategoryRow(categoryName: key, items: self.categories[key]!)
                }
                    .listRowInsets(EdgeInsets())
                    
                    NavigationLink(destination: LandmarkList()) {
                        Text("See All")
                    }
                    
                }
            .navigationBarTitle(Text("Featured"))
            .navigationBarItems(trailing: profileButton)
            .sheet(isPresented: $showingProfile) {
                ProfileHost()
                    .environmentObject(self.userData)
            }
        }
        
    }
}

struct FeaturedLandMarks: View {
    var landmarks: [LandMark]
    var body: some View {
        landmarks[0].image.resizable()
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        CategoryHome()
        .environmentObject(UserData())
    }
}
