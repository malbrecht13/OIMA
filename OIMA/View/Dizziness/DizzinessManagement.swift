//
//  DizzinessManagement.swift
//  OIMA
//
//  Created by Michael Albrecht on 9/9/20.
//  Copyright © 2020 Michael Albrecht. All rights reserved.
//

import SwiftUI

struct DizzinessManagement: View {
    
    @ObservedObject var dizzy: DizzinessData
    
    @State private var epleyView = false
    
    var body: some View {
        VStack{
            Text("Management").fontWeight(.black).modifier(ManagementMod(textColor: green))
            VStack(alignment: .leading) {
                //if Dix-Hallpike is abnormal
                if dizzy.dh == 0 {
                    Text("Patient likely has benign paroxysmal positional vertigo (BPPV)")
                    Text("Treatment is canalith repositioning maneuver, such as the Epley maneuver")
                    
                    Button(action: {
                        self.epleyView.toggle()
                    }) {
                        Text("Epley maneuver instructions")
                    }.sheet(isPresented: $epleyView) {
                        EpleyManeuverSheet()
                        }.buttonStyle(NextButtonStyle(fillColor: green)).padding()
                }
            }.font(.footnote)
            
        }.padding(.horizontal)
    }
}

struct DizzinessManagement_Previews: PreviewProvider {
    static var previews: some View {
        DizzinessManagement(dizzy: DizzinessData())
    }
}
