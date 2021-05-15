//
//  SavingListing.swift
//  Savings
//
//  Created by Kat Ou on 16.01.2021.
//

import SwiftUI

struct SavingListingView: View {
    
    @ObservedObject var savings = Savings()
    
    var body: some View {
            ScrollView{
            ForEach(savings.savings, id: \.id){item in
                RowView(saving: item)
            }
            .onDelete(perform: deletion)
            }
    }
    func deletion(at offsets: IndexSet) {
        savings.savings.remove(atOffsets: offsets)
        savings.saveData()
    }
}

struct SavingListing_Previews: PreviewProvider {
    static var previews: some View {
        SavingListingView()
    }
}
