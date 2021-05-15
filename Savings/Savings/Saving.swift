//
//  Saveing.swift
//  Savings
//
//  Created by Kat Ou on 17.01.2021.
//

import Foundation
import Combine


struct Saving: Codable, Identifiable {
    var id: UUID = UUID()
    var name: String = ""
    var amount: Double = 9.0
    var currency: Currency = .EUR
    var date: Date = Date()
    
}

class Savings: ObservableObject {
    @Published var savings: [Saving]
    {
//        didSet{
//            
//        
//        }
        willSet{
            objectWillChange.send()
        }
    }
    let objectWillChange = ObservableObjectPublisher()
    
    init(){
        self.savings = []
        loadData()
    }
    
    func getDocumentDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        
        return paths[0]
    }
    
    func loadData(){
        
        do{
            let filename = getDocumentDirectory().appendingPathComponent(Constants.fileName)
            let data = try Data(contentsOf: filename)
            self.savings = try JSONDecoder().decode([Saving].self, from: data)
        }catch{
            print("Unable to load saved data")
        }

    }
    
    func saveData(){
        objectWillChange.send()
        do{
            let filename = getDocumentDirectory().appendingPathComponent(Constants.fileName)
            let data = try JSONEncoder().encode(self.savings)
            try data.write(to: filename, options: [.atomicWrite, .completeFileProtection])
        }catch{
            print("Unable to save data")
        }
    }
    
    func addPosition(_ item: Saving){
        objectWillChange.send()
        savings.append(item)
        saveData()
        loadData()
    }
    
    func exchange(EUR: Double, USD: Double) -> Double {
        var proccess: Double = 0.0
        
        for item in savings {
            switch item.currency{
            case .RUB : proccess += item.amount
            case .EUR : proccess +=  item.amount / EUR * USD
            case .USD : proccess +=  item.amount * USD
            }
        }
        return proccess
    }
    


    
}



