//
//  ContentView.swift
//  OIMA
//
//  Created by Michael Albrecht on 8/23/20.
//  Copyright © 2020 Michael Albrecht. All rights reserved.
//

import SwiftUI

fileprivate let conditions: [Condition] = [
    Condition(name: "Community-acquired pneumonia (CAP)", field: .ID, nextView: AnyView(CAPFirst())),
    Condition(name: "Low back pain", field: .sportsMed, nextView: AnyView(CAPFirst()))
    
]



fileprivate let sortedByField = conditions.sorted{$0.field.rawValue < $1.field.rawValue}

fileprivate let sortedConditions = conditions.sorted{$0.name < $1.name}

struct ListView: View {
    
    @State private var searchText = ""

    var body: some View {
            NavigationView {
                VStack {
                    SearchBar(text: $searchText).padding(.top, 5)
                    List(sortedConditions.filter({ searchText.isEmpty ? true : $0.name.contains(searchText) })) { condition in
                        NavigationLink(destination: condition.nextView) {
                            Text(condition.name)
                        }
                                
                            
                        }
                        
                }
                .navigationBarTitle("Algorithms")
        }
            
        }
    }


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
    }
}
