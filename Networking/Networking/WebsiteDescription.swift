//
//  WebsiteDescription.swift
//  Networking
//
//  Created by Жадаев Алексей on 10.08.2021.
//

import Foundation

struct WebsiteDescription: Decodable {
    let websiteDescription: String?
    let websiteName: String?
    let courses: [Course]
}
