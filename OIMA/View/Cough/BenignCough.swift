//
//  BenignCough.swift
//  OIMA
//
//  Created by Michael Albrecht on 12/7/20.
//  Copyright © 2020 Michael Albrecht. All rights reserved.
//

import SwiftUI

struct BenignCough: View {
    
    @ObservedObject var cough: CoughData
    
    @State private var nextView: String? = nil
    @State private var showReferences = false
    
    private let stopFirst = ["Cigarettes/Smoking", "ACE-inhibitor", "Sitagliptin"]
    private let answer = ["Yes", "No"]
    
    var body: some View {
        VStack {
            Form {
                Section(header: Text("Is the patient using any of these?").font(.headline).foregroundColor(pink).padding(), content: {
                    ForEach(stopFirst, id: \.self) { item in
                        HStack {
                            Text("•")
                            Text("\(item)").font(.caption).fontWeight(.medium)
                        }
                    }
                
                })
            }
            ShowPicker(parentBinding: $cough.coughEasyFixes, text: "", parentArray: answer)
            Button(action: {
                if self.cough.coughEasyFixes == 0 {
                    self.nextView = "management"
                } else if self.cough.coughEasyFixes == 1 {
                    self.nextView = "commonCauses"
                }
            }) {
                Text("Next")
            }.buttonStyle(NextButtonStyle(fillColor: pink))
            
            NavigationLink(destination: CoughManagement(cough: cough), tag: "management", selection: $nextView) {
                EmptyView()
            }
            NavigationLink(destination: CoughCommonCauses(cough: cough), tag: "commonCauses", selection: $nextView) {
                EmptyView()
            }
        }.navigationBarTitle("Quick fixes", displayMode: .inline)
        .navigationBarItems(trailing: Button(action: {
            self.showReferences.toggle()
        }){
            Image(systemName: "r.square")
        }.sheet(isPresented: $showReferences)
            {
            CoughReference()
        })
    }
}

struct BenignCough_Previews: PreviewProvider {
    static var previews: some View {
        BenignCough(cough: CoughData())
    }
}
