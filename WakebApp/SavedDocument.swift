//
//  SavedDocument.swift
//  demo app
//
//  Created by Reuof on 17/12/2024.
//

import Foundation

struct SavedDocument: Identifiable {
    var id = UUID()
    var title: String
    var content: String
    var date: Date
}
