//
//  CAPFirst.swift
//  OIMA
//
//  Created by Michael Albrecht on 8/24/20.
//  Copyright © 2020 Michael Albrecht. All rights reserved.
//

import SwiftUI

struct CAPFirst: View {
    
    @ObservedObject var capToggle: CAPToggle = CAPToggle()
    
    private let rfs = ["Prior respiratory isolation of MRSA", "Prior respiratory isolation of Pseudmonas", "Chronic heart disease", "Chronic lung disease", "Chronic liver disease", "Chronic renal disease", "Diabetes mellitus", "Alcoholism", "Malignancy", "Asplenia"]
    
    private let answer = ["Yes", "No"]
    
    private let fillColor = Color.pink
    
    var body: some View {
        VStack {
            Form {
                Section(header: Text("Does the patient have any of these risk factors?").foregroundColor(fillColor).font(.callout).fontWeight(.black).padding(.top, -50)) {
                    ForEach(rfs, id: \.self) { rf in
                        HStack {
                            Text("•")
                            Text("\(rf)").font(.body).fontWeight(.medium)
                        }
                    }
                    ShowPicker(parentBinding: $capToggle.selection, text: "", parentArray: answer)
                        .padding()
                    HStack {
                        Spacer()
                        Button("Next") {
                            self.capToggle.nextView = true
                        }.buttonStyle(NextButtonStyle(fillColor: fillColor)).padding()
                        Spacer()
                    }
                    
                }
                
            }
            
            
            NavigationLink(destination: OutCAPManagement(capToggle: capToggle), isActive: $capToggle.nextView) {
                EmptyView()
            }
            
        }
    }
}

struct CAPFirst_Previews: PreviewProvider {
    static var previews: some View {
        CAPFirst()
    }
}
