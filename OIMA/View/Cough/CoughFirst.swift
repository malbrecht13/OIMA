//
//  CoughFirst.swift
//  OIMA
//
//  Created by Michael Albrecht on 11/16/20.
//  Copyright © 2020 Michael Albrecht. All rights reserved.
//

import SwiftUI

struct CoughFirst: View {
    
    @ObservedObject var cough: CoughData = CoughData()
    
    @State private var nextView = false
    @State private var showReferences = false
    
    private let coughDuration = ["< 3 weeks", "3-8 weeks", "> 8 weeks"]
    
    var body: some View {
        
        
        VStack {
            Spacer()
            ShowPicker(parentBinding: $cough.acuity, text: "Select cough duration", parentArray: coughDuration)
            Button(action: {
                self.nextView = true
            }) {
                Text("Next")
            }.buttonStyle(NextButtonStyle(fillColor: pink))
            
            NavigationLink(destination: CoughRedFlags(cough: cough), isActive: $nextView) {
                EmptyView()
            }
            .navigationBarTitle("Cough duration", displayMode: .inline)
            .navigationBarItems(trailing:
                HStack {
                    Button(action: {
                        self.showReferences.toggle()
                    }) {
                        Image(systemName: "r.square")
                    }.sheet(isPresented: $showReferences) {
                        CoughReference()
                    }
                }
            )
            Spacer()
        }
        
        
        
    }
}

struct CoughFirst_Previews: PreviewProvider {
    static var previews: some View {
        CoughFirst()
    }
}
