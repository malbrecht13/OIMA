//
//  LBPTxFirst.swift
//  OIMA
//
//  Created by Michael Albrecht on 11/12/20.
//  Copyright © 2020 Michael Albrecht. All rights reserved.
//

/*
 This low back pain treatment section focuses on treatment of mechanical low back pain, not other more serious forms of pain such as malignant spread to spine, spinal infection, vertebral compression fracture, or inflammatory arthritis of the spine such as the seronegative spondyloarthropathies
 */


// TODO: - References, Create Views, nextView should be optional string not boolean

import SwiftUI

struct LBPTxFirst: View {
    
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    
    @ObservedObject var mlbpt: MLBPT = MLBPT()
    
    private var duration = ["< 12 weeks", "> 12 weeks"]
    @State private var nextView = false
    @State private var showReferences = false
    
    var body: some View {
        VStack {
            Spacer()
            
            ShowPicker(parentBinding: $mlbpt.duration, text: "What is the duration of the back pain?", parentArray: duration)
            
            Button(action: {
                self.nextView = true
            }) {
                Text("Next")
            }.buttonStyle(NextButtonStyle(fillColor: orange))
            
            NavigationLink(destination: LBPTxManagement(mlbpt: mlbpt), isActive: $nextView) {
                EmptyView()
            }
            
            .navigationBarTitle("Duration", displayMode: .inline)
            //Reference button in navbar
            .navigationBarItems(trailing:
                HStack {
                    Button(action: {
                        self.showReferences.toggle()
                    }) {
                        Image(systemName: "r.square")
                    }.sheet(isPresented: $showReferences) {
                        LBPTxReference()
                    }
                    Button(action: {
                        self.mode.wrappedValue.dismiss()
                    
                    }) {
                        Image(systemName: "house")
                    }
                }
            )
            
            Spacer()
        }
    }
}



struct LBPTxFirst_Previews: PreviewProvider {
    static var previews: some View {
        LBPTxFirst()
    }
}
