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
    @State private var nextView = false
    
    var body: some View {
        ScrollView {
            Spacer()
            Text("A quick note").fontWeight(.black).padding().foregroundColor(.blue)

            Text("This algorithm is designed to rule out a urinary tract cancer in the setting of microscopic hematuria.  Gross (visible) hematuria should be automatically evaluated via cystoscopy, upper urinary tract imaging such as CT urography, as well as urine cytology.  This algorithm should not be used for gross hematuria.  Urology referral is appropriate.  \n\nThe algorithm assumes a properly collected urine sample.  For instance, in those with no voiding difficulties, a random midstream clean-catch sample is needed.\n\nIf a urine dipstick is positive (trace blood or greater), then microscopic examination is warranted.  Remember that ≥ 3 RBCs/hpf are needed for the diagnosis of microscopic hematuria.\n\nFinally, if the patient has microhematuria in setting of known non-malignant condition, including UTI, nephrolithiasis, menstruation, a followup UA should still be obtained to ensure the microscopic hematuria has resolved.  If it is not, further investigation using this algorithm may be indicated. ")
            Spacer()
                .frame(height: 50)
            NextButton1(nextView: $nextView, fillColor: blue)
            NavigationLink(destination: MHNonCancerCauses(mh: MHData()), isActive: $nextView) { EmptyView() }
        
        }.padding()
        .navigationBarTitle("Quick note", displayMode: .inline)
        .navigationBarItems(trailing: Button(action: {
            self.showReferences.toggle()
        }) {
            Image(systemName: "r.square")
        }).sheet(isPresented: $showReferences) {
            MHReference()
        }
        
        
    }
}

struct IntroMH_Previews: PreviewProvider {
    static var previews: some View {
        IntroMH()
    }
}
