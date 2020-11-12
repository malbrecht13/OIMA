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


// TODO: - Navigation Link, References, Create Views, nextView should be optional string not boolean

import SwiftUI

struct LBPTxFirst: View {
    
    @ObservedObject var mlbpt: MLBPT = MLBPT()
    
    @State private var duration = ["< 12 weeks", "> 12 weeks"]
    @State private var nextView = false
    
    var body: some View {
        VStack {
            Spacer()
            
            ShowPicker(parentBinding: $mlbpt.duration, text: "What is the duration of the back pain?", parentArray: duration)
            
            Button(action: {
                self.nextView = true
            }) {
                Text("Next")
            }.buttonStyle(NextButtonStyle(fillColor: orange))
            
            .navigationBarTitle("Duration", displayMode: .inline)
            
            Spacer()
        }
    }
}

struct LBPTxFirst_Previews: PreviewProvider {
    static var previews: some View {
        LBPTxFirst()
    }
}
