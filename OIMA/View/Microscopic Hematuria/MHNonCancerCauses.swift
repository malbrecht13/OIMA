//
//  MHNonCancerCauses.swift
//  OIMA
//
//  Created by Michael Albrecht on 12/24/20.
//  Copyright © 2020 Michael Albrecht. All rights reserved.
//

import SwiftUI

struct MHNonCancerCauses: View {
    
    @ObservedObject var mh: MHData = MHData()
    
    @State private var nextView: String? = nil
    @State private var showReferences = false
    
    private let causes = ["UTI", "Nephrolithiasis", "Menstrual period", "Recent urinary tract trauma", "Urethral stricture or diverticulum", "Recent urological procedure or catheterization", "A glomerular kidney disorder (e.g., lupus, many others)"]
    
    private let answer = ["Yes", "No"]
    
    var body: some View {
        VStack {
            Form {
                Section(header: Text("Do you believe any of these are the potential cause of the microscopic hematuria?").font(.headline).foregroundColor(blue).padding(), content: {
                    ForEach(causes, id: \.self) { item in
                        HStack {
                            Text("•")
                            Text("\(item)").font(.caption).fontWeight(.medium)
                        }
                    }
                })
            }
            ShowPicker(parentBinding: $mh.nonCancerCause, text: "", parentArray: answer)
            
            Button(action: {
                if self.mh.nonCancerCause == 0 {
                    self.nextView = "management"
                } else if mh.nonCancerCause == 1 {
                    self.nextView = "ruleOutCancer"
                }
            }) {
                Text("Next")
            }.buttonStyle(NextButtonStyle(fillColor: blue))
            NavigationLink(destination: MHManagement(mh: mh), tag: "management", selection: $nextView) {
                EmptyView()
            }
            NavigationLink(destination: HighRiskMH(mh: mh), tag: "ruleOutCancer", selection: $nextView) {
                EmptyView()
            }
        }.navigationBarTitle("Non-malignant causes", displayMode: .inline)
        .navigationBarItems(trailing: Button(action: {
            self.showReferences.toggle()
        }) {
            Image(systemName: "r.square")
        }).sheet(isPresented: $showReferences) {
            MHReference()
        }
    }
}

struct MHNonCancerCauses_Previews: PreviewProvider {
    static var previews: some View {
        MHNonCancerCauses(mh: MHData())
    }
}
