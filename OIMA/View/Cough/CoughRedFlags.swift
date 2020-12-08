//
//  CoughRedFlags.swift
//  OIMA
//
//  Created by Michael Albrecht on 11/16/20.
//  Copyright © 2020 Michael Albrecht. All rights reserved.
//

import SwiftUI

struct CoughRedFlags: View {
    
    @ObservedObject var cough: CoughData = CoughData()
    
    @State private var nextView: String? = nil
    @State private var showReferences = false
    
    private let redFlags = ["Hemoptysis", "Smoker > 45 years of age with a new cough, change in cough, or coexisting voice disturbance", "Adults aged 55-80 years who have a 30 pack-year smoking history and currently smoke or who have quit within the past 15 years", "Prominent dyspnea, especially at rest or at night", "Hoarseness", "Systemic symptoms such as fever, weight loss, or peripheral edema with weight gain", "Trouble swallowing when eating or drinking", "Vomiting", "Recurrent pneumonia", "Abnormal respiratory exam and/or abnormal chest radiograph coinciding with duration of cough"]
    
    private let answer = ["Yes", "No"]
    
    var body: some View {
        VStack {
            Form {
                Section(header: Text("Are any of these red flags present?").font(.headline).foregroundColor(pink).padding(), content: {
                    ForEach(redFlags, id: \.self) { flag in
                        HStack {
                            Text("•")
                            Text("\(flag)").font(.caption).fontWeight(.medium)
                        }
                        
                    }
                })
            }
            ShowPicker(parentBinding: $cough.coughRedFlags, text: "", parentArray: answer)
            Button(action: {
                if self.cough.coughRedFlags == 0 {
                    self.nextView = "redFlags"
                } else if cough.coughRedFlags == 1 {
                    self.nextView = "noRedFlags"
                }
            }) {
                Text("Next")
            }.buttonStyle(NextButtonStyle(fillColor: pink))
            
            NavigationLink(destination: CoughManagement(cough: cough), tag: "redFlags", selection: $nextView) {
                EmptyView()
            }
            NavigationLink(destination: BenignCough(cough: cough), tag: "noRedFlags", selection: $nextView) {
                EmptyView()
            }
            
        }
        .navigationBarTitle("Red Flags", displayMode: .inline)
        .navigationBarItems(trailing: Button(action: {
            self.showReferences.toggle()
        }) {
            Image(systemName: "r.square")
        }).sheet(isPresented: $showReferences) {
            CoughReference()
        }
    }
}

struct CoughRedFlags_Previews: PreviewProvider {
    static var previews: some View {
        CoughRedFlags(cough: CoughData())
    }
}
