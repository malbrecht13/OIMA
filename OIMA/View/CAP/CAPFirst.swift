//
//  CAPFirst.swift
//  OIMA
//
//  Created by Michael Albrecht on 8/24/20.
//  Copyright © 2020 Michael Albrecht. All rights reserved.
//

import SwiftUI

struct CAPFirst: View {
    
    @ObservedObject var capToggle: CAPData = CAPData()
    
    @State private var nextView = false
    @State private var showReferences = false
    
    private let rfs = ["Prior respiratory isolation of MRSA", "Prior respiratory isolation of Pseudmonas", "Chronic heart disease", "Chronic lung disease", "Chronic liver disease", "Chronic renal disease", "Diabetes mellitus", "Alcoholism", "Malignancy", "Asplenia"]
    
    private let answer = ["Yes", "No"]
    
    private let fillColor = Color.pink
    
    var body: some View {
        VStack  {
            
            VStack (alignment: .leading) {
                Text("Does the patient have any of these risk factors?").foregroundColor(fillColor).font(.callout).fontWeight(.black).padding()
                
                ForEach(rfs, id: \.self) { rf in
                    HStack {
                        Text("•")
                        Text("\(rf)").font(.caption).fontWeight(.medium)
                    }
                }
            }
            
            ShowPicker(parentBinding: $capToggle.selection, text: "", parentArray: answer)
            
            HStack {
                Spacer()
                Button("Next") {
                    self.nextView = true
                }.buttonStyle(NextButtonStyle(fillColor: fillColor)).padding()
                Spacer()
            }
            
            
            NavigationLink(destination: OutCAPManagement(capToggle: capToggle), isActive: $nextView) {
                EmptyView()
            }.navigationBarTitle("Risk factors", displayMode: .inline)
            .navigationBarItems(trailing: Button(action: {
                self.showReferences.toggle()
            }) {
                Image(systemName: "r.square")
            }.sheet(isPresented: $showReferences) {
                CAPReference()
            })
            
            Spacer()
            
            
        }.padding()
    }
}

struct CAPFirst_Previews: PreviewProvider {
    static var previews: some View {
        CAPFirst()
    }
}
