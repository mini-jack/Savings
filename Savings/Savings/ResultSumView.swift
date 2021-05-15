//
//  ResultSum.swift
//  Savings
//
//  Created by Kat Ou on 16.01.2021.
//

import SwiftUI
import Foundation

struct ResultSumView: View {
   
    @ObservedObject var savings = Savings()

    var currency: Currency = .RUB
    
    @State private var loadingState = NetWork.LoadingState.loading
    @State private var message: Message = Message()


    
    var body: some View {
        GeometryReader{ outter in
            ZStack{
                RoundedRectangle(cornerRadius: 25, style: .continuous)
                    .fill(Color.init(RGB: Design.Colors.midleBlueGreen))
                    .frame(width: outter.size.width * 0.9, height: outter.size.height * 0.5)
                    .shadow(radius: 10)
                    .overlay(
                        RoundedRectangle(cornerRadius: 25)
                            .stroke(Color.init(RGB: Design.Colors.charcoal), lineWidth: 0.5)
                    )
                
                HStack{
                    Text("\(savings.exchange(EUR: message.quotes.USDEUR, USD: message.quotes.USDRUB).description)")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(Color.init(RGB: Design.Colors.spaceCadet))
                    
                    Text("\(currency.rawValue)")
                        .font(.largeTitle)
                        .foregroundColor(Color.init(RGB: Design.Colors.spaceCadet))
                }
            }.onAppear(){
                fetchData()
            }
            .alignmentGuide(VerticalAlignment.center, computeValue: { $0[.top] })
            .position(x: outter.size.width / 2, y: outter.size.height  / 2)
        }
    }
    
    func fetchData() {
        let urlString = "http://api.currencylayer.com/live?access_key=\(NetWork.accessKey)&currencies=EUR,RUB"
        guard let url = URL(string: urlString) else {
            print("Bad URL: \(urlString)")
            return
        }
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data {
                // we got some data back
                let decoder = JSONDecoder()
                
                if let items = try? decoder.decode(Message.self, from: data) {
                    self.message = items
                    print(message)
                    self.loadingState = .loaded
                    return
                }
            }
            self.loadingState = .failed
        }.resume()
    }
    

}

struct ResultSum_Previews: PreviewProvider {
    static var previews: some View {
        ResultSumView()
    }
}



