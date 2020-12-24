//
//  IntroMH.swift
//  OIMA
//
//  Created by Michael Albrecht on 12/23/20.
//  Copyright © 2020 Michael Albrecht. All rights reserved.
//

import SwiftUI

struct IntroMH: View {
    
    @State private var showReferences = false
    
    var body: some View {
        VStack {
            Spacer()
            Text("A quick note").fontWeight(.black).padding().foregroundColor(.blue)

            Text("This algorithm is for microscopic hematuria, defined as at least 3 red blood cells per high power field on microscopic examination of the urine.  Gross (visible) hematuria should be automatically evaluated via cystoscopy, upper urinary tract imaging such as CT urography, as well as urine cytology.  This algorithm should not be used for gross hematuria.  Urology referral is appropriate.  \n\nThe algorithm assumes a properly collected urine sample.  For instance, in those with no voiding difficulties, a random midstream clean-catch sample is needed.\n\nIf a urine dipstick is positive (trace blood or greater), then microscopic examination is warranted.  Remember that ≥ 3 RBCs/hpf are needed for the diagnosis of microscopic hematuria.")
            Spacer()
        }.padding()
        .navigationBarTitle("Quick note", displayMode: .inline)
        .navigationBarItems(trailing: Button(action: {
            self.showReferences.toggle()
        }) {
            Image(systemName: "r.square")
        }).sheet(isPresented: $showReferences) {
            CoughReference()
        }
    }
}

struct IntroMH_Previews: PreviewProvider {
    static var previews: some View {
        IntroMH()
    }
}
