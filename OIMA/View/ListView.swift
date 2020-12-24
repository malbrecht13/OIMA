//
//  ContentView.swift
//  OIMA
//
//  Created by Michael Albrecht on 8/23/20.
//  Copyright © 2020 Michael Albrecht. All rights reserved.
//

import SwiftUI

fileprivate let conditions: [Condition] = [
    Condition(name: "Community-acquired pneumonia (CAP), treatment", nextView: AnyView(CAPFirst())),
    Condition(name: "VTE Anticoagulation (DVT or PE)", nextView: AnyView(VTEFirst())),
    Condition(name: "Dizziness evaluation", nextView: AnyView(DizzinessFirst())),
    Condition(name: "Sinusitis", nextView: AnyView(SinusitisDuration())),
    Condition(name: "Mechanical low back pain, treatment", nextView: AnyView(LBPTxFirst())),
    Condition(name: "Cough evaluation", nextView: AnyView(CoughRedFlags())),
    Condition(name: "Hematuria evaluation", nextView: AnyView(IntroMH())),
]

fileprivate let sortedConditions = conditions.sorted{$0.name < $1.name}

struct ListView: View {
    
    @State private var searchText = ""

    var body: some View {
        NavigationView {
            VStack {
                SearchBar(text: $searchText).padding(.top, 5)
                List(sortedConditions.filter({ searchText.isEmpty ? true : $0.name.lowercased().contains(searchText.lowercased()) })) { condition in
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
