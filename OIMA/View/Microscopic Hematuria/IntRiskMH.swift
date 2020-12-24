//
//  IntRiskMH.swift
//  OIMA
//
//  Created by Michael Albrecht on 12/24/20.
//  Copyright © 2020 Michael Albrecht. All rights reserved.
//

import SwiftUI

struct IntRiskMH: View {
    
    @ObservedObject var mh: MHData
    
    @State private var nextView = false
    @State private var showReferences = false
    
    private let answer = ["Yes", "No"]
    private let intRiskFactors = ["Woman aged 50-59", "Man aged 40-59", "10-30 pack-years smoking", "11-25 RBCs/hpf on one UA", "Any of these: lower urinary tract voiding symptoms, history of cyclophosphamide or ifosfamidine chemotherapy, family history urothelial carcinoma or Lynch syndrome, exposure to benzene chemicals or aromatic amines, history chronic indwelling foreign body in urinary tract", "Previously low risk, no prior evaluation and 3-25 RBCs/hpf on repeat UA"]
    
    var body: some View {
        VStack {
            Form {
                Section(header: Text("Are any of these intermediate-risk risk factors present for this patient?").font(.headline).foregroundColor(blue).padding(), content: {
                    ForEach(intRiskFactors, id: \.self) { item in
                        HStack {
                            Text("•")
                            Text("\(item)").font(.caption).fontWeight(.medium)
                        }
                        
                    }
                })
            }
            ShowPicker(parentBinding: $mh.intRFs, text: "", parentArray: answer)
            
            NextButton1(nextView: $nextView, fillColor: blue)
            NavigationLink(
                destination: MHManagement(mh: mh),
                isActive: $nextView,
                label: {
                    EmptyView()
                })
        }.navigationBarTitle("Intermediate risk?", displayMode: .inline)
        .navigationBarItems(trailing: Button(action: {
            self.showReferences.toggle()
        }) {
            Image(systemName: "r.square")
        }).sheet(isPresented: $showReferences) {
            MHReference()
        }
    }
}

struct IntRiskMH_Previews: PreviewProvider {
    static var previews: some View {
        IntRiskMH(mh: MHData())
    }
}
