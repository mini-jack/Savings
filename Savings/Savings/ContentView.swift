//
//  ContentView.swift
//  Savings
//
//  Created by Kat Ou on 16.01.2021.
//


import Foundation
import SwiftUI

struct ContentView: View {
    
    @State var addItem: Bool = false
    @ObservedObject var savings = Savings()
    
    var body: some View {
        NavigationView{
            GeometryReader{ outter in
                ZStack {
                    LinearGradient(gradient: Gradient(colors: [Color.init(RGB: Design.Colors.beauBlue), Color.init(RGB: Design.Colors.pinkLavander)]), startPoint: .top, endPoint: .bottom)
                        .edgesIgnoringSafeArea(.all)

                    VStack{
                        ResultSumView(savings: self.savings)
                            .frame(width: outter.size.width , height: outter.size.height * 0.3, alignment: .top)
                        
                        SavingListingView(savings: self.savings)
                            .frame(width: outter.size.width , height: outter.size.height * 0.7, alignment: .bottomTrailing)
                    }
                }
            }
            .navigationBarTitle(Text("Sum of money is"))
            .navigationBarItems(trailing: Button(action: {
                self.addItem = true
            }) {
                    Image(systemName: "plus")
                        .resizable()
            })
            .sheet(isPresented: $addItem, onDismiss: {}) {
                AddPositionView(savings: self.savings)
            }
           
        }
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

extension Color {
    init(RGB: (Int, Int, Int)){
        self.init(red: Double(RGB.0) / 255.0 , green: Double(RGB.1) / 255.0, blue: Double(RGB.2) / 255.0)
    } 
}
