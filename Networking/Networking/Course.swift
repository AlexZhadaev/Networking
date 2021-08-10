//
//  Course.swift
//  Networking
//
//  Created by Жадаев Алексей on 10.08.2021.
//

import Foundation

struct Course: Decodable {
    let id: Int?
    let name: String?
    let link: String?
    let imageUrl: String?
    let number_of_lessons: Int?
    let number_of_tests: Int?
    
}
