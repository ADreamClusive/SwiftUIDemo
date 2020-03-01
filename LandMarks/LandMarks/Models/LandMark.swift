//
//  LandMark.swift
//  LandMarks
//
//  Created by zl jiao on 2020/2/28.
//  Copyright © 2020 zl jiao. All rights reserved.
//

import SwiftUI
import CoreLocation

struct LandMark: Hashable, Codable, Identifiable {
    var id: Int
    var name: String
    fileprivate var imageName: String
    fileprivate var coordinates: Coordinates
    var state: String
    var park: String
    var category: Category
    var isFavorite: Bool
    var isFeatured: Bool
    
    
    var locationCoordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: coordinates.latitude, longitude: coordinates.longitude)
    }
    
    var featureImage: Image? {
        guard isFeatured else {
            return nil
        }
        
        return Image(ImageStore.loadImage(name:"\(imageName)_feature"),
                     scale: 2,
                     label: Text(name))
    }
    
    enum Category: String, CaseIterable, Codable, CodableEnumeration, Hashable {
        
        static var defaultCase: LandMark.Category {
            return unknown
        }
        
        case featured = "Featured"
        case lakes = "Lakes"
        case rivers = "Rivers"
        case mountains = "Mountains"
        case unknown = "unknown"
    }
}

protocol CodableEnumeration: RawRepresentable, Codable where RawValue: Codable {
    static var defaultCase: Self { get }
}

extension CodableEnumeration {
    init(from decoder:Decoder) throws {
        let container = try decoder.singleValueContainer()
        do {
            let decoded = try container.decode(RawValue.self)
            self = Self.init(rawValue:decoded) ?? Self.defaultCase
        } catch {
            self = Self.defaultCase
        }
    }
}


extension LandMark {
    var image: Image {
        ImageStore.shared.image(name: imageName)
    }
}

struct Coordinates: Hashable, Codable {
    var latitude: Double
    var longitude: Double
}


