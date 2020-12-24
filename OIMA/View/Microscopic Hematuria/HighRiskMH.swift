//
//  HighRiskMH.swift
//  OIMA
//
//  Created by Michael Albrecht on 12/23/20.
//  Copyright © 2020 Michael Albrecht. All rights reserved.
//

import SwiftUI

struct HighRiskMH: View {
    
    @ObservedObject var mh: MHData
    
    @State private var nextView: String? = nil
    @State private var showReferences = false
    
    private let highRiskFactors = ["Age ≥ 60", "> 30 pack-years smoking", "> 25 RBC/hpf on one UA", "History of gross hematuria", "Previously classified as low risk, no prior evaluation and > 25 RBC/hpf on repeat UA"]
    
    private let answer = ["Yes", "No"]
    
    var body: some View {
        VStack {
            Form {
                Section(header: Text("Are any of these high-risk risk factors present for this patient?").font(.headline).foregroundColor(blue).padding(), content: {
                    ForEach(highRiskFactors, id: \.self) { item in
                        HStack {
                            Text("•")
                            Text("\(item)").font(.caption).fontWeight(.medium)
                        }
                        
                    }
                })
            }
            ShowPicker(parentBinding: $mh.highRFs, text: "", parentArray: answer)
            
            Button(action: {
                if self.mh.highRFs == 0 {
                    self.nextView = "management"
                } else if mh.highRFs == 1 {
                    self.nextView = "intermediate"
                }
            }) {
                Text("Next")
            }.buttonStyle(NextButtonStyle(fillColor: blue))
            NavigationLink(
                destination: MHManagement(mh: mh),
                tag: "management",
                selection: $nextView,
                label: {EmptyView()})
            NavigationLink(
                destination: IntRiskMH(mh: mh),
                tag: "intermediate",
                selection: $nextView,
                label: {EmptyView()})
        }.navigationBarTitle("High risk?", displayMode: .inline)
        .navigationBarItems(trailing: Button(action: {
            self.showReferences.toggle()
        }) {
            Image(systemName: "r.square")
        }).sheet(isPresented: $showReferences) {
            MHReference()
        }
    }
}

struct HighRiskMH_Previews: PreviewProvider {
    static var previews: some View {
        HighRiskMH(mh: MHData())
    }
}
