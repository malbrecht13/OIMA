//
//  CoughCommonCauses.swift
//  OIMA
//
//  Created by Michael Albrecht on 12/7/20.
//  Copyright © 2020 Michael Albrecht. All rights reserved.
//

import SwiftUI

struct CoughCommonCauses: View {
    
    @ObservedObject var cough: CoughData
    
    @State private var nextView = false
    @State private var showReferences = false
    
    private let answer = ["Yes", "No"]
    private let commonCauses = ["Upper Airway Cough Syndrome (UACS)", "Asthma", "Non-asthmatic Eosinophilic Bronchitis (NAEB)", "GERD"]
    
    var body: some View {
        VStack {
            Form {
                Section(header: Text("Have these top 4 causes of chronic cough been ruled out?").font(.headline).foregroundColor(pink).padding(), content: {
                    ForEach(commonCauses, id: \.self) { cause in
                        HStack {
                            Text("•")
                            Text("\(cause)").font(.caption).fontWeight(.medium)
                        }
                    }
                })
            }
            ShowPicker(parentBinding: $cough.commonCausesRO, text: "", parentArray: answer)
            Button(action: {
                self.nextView = true
            }) {
                Text("Next")
            }.buttonStyle(NextButtonStyle(fillColor: pink))
            NavigationLink(destination: CoughManagement(cough: cough), isActive: $nextView) { EmptyView() }
        } .navigationBarTitle("Cough common causes", displayMode: .inline)
        .navigationBarItems(trailing: Button(action: {
            self.showReferences.toggle()
        }) {
            Image(systemName: "r.square")
        }).sheet(isPresented: $showReferences) {
            CoughReference()
        }
    }
}

struct CoughCommonCauses_Previews: PreviewProvider {
    static var previews: some View {
        CoughCommonCauses(cough: CoughData())
    }
}
