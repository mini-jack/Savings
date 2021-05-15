//
//  RowView.swift
//  Savings
//
//  Created by Kat Ou on 17.01.2021.
//

import SwiftUI

struct RowView: View {
    
    @State var saving: Saving

    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 10, style: .continuous)
                .fill(LinearGradient(gradient: Gradient(colors: [Color.init(RGB: Design.Colors.powderBlue), Color.init(RGB: Design.Colors.canary)]), startPoint: .topLeading, endPoint: .bottomTrailing))

                .shadow(radius: 5)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.init(RGB: Design.Colors.charcoal), lineWidth: 0.5)
                )
            HStack (alignment: .center){
                VStack(alignment: .leading){
                    Text("\(saving.name)")
                        .font(.headline)
                    Text("\(saving.date.formatedDate)")
                        .font(.subheadline)
                }.padding(.all)
                Spacer()
                Group{
                Text("\(saving.amount.description)")
                    .font(.headline)
                Text("\(saving.currency.rawValue)")
                    .font(.subheadline)
                    .padding()
                }
            }.foregroundColor(Color.init(RGB:Design.Colors.spaceCadet))
        }
    }
}

struct RowView_Previews: PreviewProvider {
    static var previews: some View {
        RowView(saving: Saving())
    }
}
