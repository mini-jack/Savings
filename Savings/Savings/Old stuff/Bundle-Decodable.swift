//
//  Bundle-Decodable.swift
//  Moonshot
//
//  Created by Kat Ou on 15.06.2020.
//  Copyright © 2020 Kat Ou. All rights reserved.
//

import Foundation

extension Bundle{
    func decode<T: Codable>(_ file: String) -> T{
        guard let url = self.url(forResource: file, withExtension: nil) else{
            fatalError("Failed to locate\(file) in bundle.")
        }
        guard let data = try? Data(contentsOf: url) else{
            fatalError("Failed to locate\(file) in bundle.")
        }
        let decoder = JSONDecoder()
        
        let formatter = DateFormatter()
        formatter.dateFormat = "E, d MMM yyyy HH:mm:ss Z"
        decoder.dateDecodingStrategy = .formatted(formatter)
        
        
        guard let loaded = try? decoder.decode(T.self, from: data) else{
            fatalError("Failed to locate\(file.debugDescription) in bundle.")
        }
        return loaded
    }
    func encode<T: Codable>(_ file: String, _ json: T){
//        guard let url = self.url(forResource: file, withExtension: nil) else{
//            fatalError("Failed to locate\(file) in bundle.")
//        }
        let url = URL(fileURLWithPath:"file:///Users/katou/Documents/savings.json")
        let encoder = JSONEncoder()

//        let formatter = DateFormatter()
//        formatter.dateFormat = "E, d MMM yyyy HH:mm:ss Z"
//        encoder.dateEncodingStrategy = .formatted(formatter)


        guard let _ = try? encoder.encode(json).write(to: url, options: .atomicWrite) else{
            fatalError("Failed to locate\(file.debugDescription) in bundle.")
        }

        
//        do {
//            guard let url = self.url(forResource: file, withExtension: nil) else{
//                fatalError("Failed to locate\(file) in bundle.")
//            }
////               let fileURL = try FileManager.default
////                   .url(for: .applicationSupportDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
////                   .appendingPathComponent(named)
//               let encoder = try JSONEncoder().encode(json)
//
//               try encoder.write(to: url)
//           } catch {
//               print("JSONSave error of \(error)")
//           }
    }
}
