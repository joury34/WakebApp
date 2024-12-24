//
//  FileManagerUtility.swift
//  WakebApp
//
//  Created by Reuof on 24/12/2024.
//


import Foundation

class FileManagerUtility {
    static let shared = FileManagerUtility()

    private init() {}

    func saveTextToFile(text: String, filename: String) {
        let fileManager = FileManager.default
        if let documentsDirectory = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first {
            let fileURL = documentsDirectory.appendingPathComponent("\(filename).txt")
            
            do {
                try text.write(to: fileURL, atomically: false, encoding: .utf8)
                print("File saved to: \(fileURL)")
            } catch {
                print("Error saving file: \(error.localizedDescription)")
            }
        }
    }

    func readTextFromFile(filename: String) -> String? {
        let fileManager = FileManager.default
        if let documentsDirectory = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first {
            let fileURL = documentsDirectory.appendingPathComponent("\(filename).txt")
            
            do {
                let text = try String(contentsOf: fileURL, encoding: .utf8)
                return text
            } catch {
                print("Error reading file: \(error.localizedDescription)")
                return nil
            }
        }
        return nil
    }

    func deleteFile(filename: String) {
        let fileManager = FileManager.default
        if let documentsDirectory = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first {
            let fileURL = documentsDirectory.appendingPathComponent("\(filename).txt")
            
            do {
                try fileManager.removeItem(at: fileURL)
                print("File deleted: \(fileURL)")
            } catch {
                print("Error deleting file: \(error.localizedDescription)")
            }
        }
    }
}