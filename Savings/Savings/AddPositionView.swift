//
//  AddPosition.swift
//  Savings
//
//  Created by Kat Ou on 24.01.2021.
//

import SwiftUI

struct AddPositionView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    
    var savings = Savings()
    @State var position: Saving = Saving()
    @State var amountNumber: String = ""
    @State var isWrong: Bool = false
    
    var body: some View {
        
        NavigationView{
            ZStack{
                LinearGradient(gradient: Gradient(colors: [Color.init(RGB: Design.Colors.beauBlue), Color.init(RGB: Design.Colors.pinkLavander)]), startPoint: .bottom, endPoint: .top)
                    .edgesIgnoringSafeArea(.all)
                VStack{
                    HStack{
                        Text("Name it:")
                            .padding()
                        TextField("Name the saving", text: $position.name)
                    }.foregroundColor(Color.init(RGB:Design.Colors.spaceCadet))
                    HStack{
                        Text("Amount:")
                            .padding()
                        TextField("Enter amount", text: $amountNumber).accentColor(.secondary)
                            
                        Picker(selection: $position.currency, label: Text("")){
                            ForEach(Currency.allCases, id: \.self) { value in
                                Text(value.rawValue)
                            }
                        }
                        .frame(width: 50)
                        .labelsHidden()
                    }.foregroundColor(Color.init(RGB:Design.Colors.spaceCadet))
                    ZStack{
                        
                        Button(action: {
                            addPosition()
                        }){
                            ZStack{
                                RoundedRectangle(cornerRadius: 10, style: .continuous)
                                    .fill(LinearGradient(gradient: Gradient(colors: [Color.init(RGB: Design.Colors.powderBlue), Color.init(RGB: Design.Colors.canary)]), startPoint: .topLeading, endPoint: .bottomTrailing))
                                    .frame(width: 200, height: 50, alignment: .center)
                                    .shadow(radius: 5)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 10)
                                            .stroke(Color.init(RGB: Design.Colors.charcoal), lineWidth: 0.5)
                                    )
                                Text("Save")

                            }
                        }
                    }.foregroundColor(Color.init(RGB:Design.Colors.spaceCadet))
                    
                }.navigationBarTitle(Text("Tell me what you have 🙃"))
                
                
            }
        }.alert(isPresented: $isWrong) {
            Alert(title: Text("Amount is not Digital"), message: Text("Please enter rght data"), dismissButton: .default(Text("Got it!")))
        }
    }
    func addPosition(){
        guard let amount = Double(amountNumber) else {
            isWrong = true
            return
        }
        position.amount = amount
        position.id = UUID()
        position.date = Date()
        presentationMode.wrappedValue.dismiss()
        savings.addPosition(position)
    }
}

struct AddPosition_Previews: PreviewProvider {
    static var previews: some View {
        AddPositionView()
    }
}
