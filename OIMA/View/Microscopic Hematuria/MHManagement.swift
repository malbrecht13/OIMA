//
//  MHManagement.swift
//  OIMA
//
//  Created by Michael Albrecht on 12/24/20.
//  Copyright © 2020 Michael Albrecht. All rights reserved.
//

import SwiftUI

//repeat a UA 3 weeks later after treatment of a gynecologic or non-malignant cause
//refer patients to nephrology if suspected medical renal disease.  However, a risk-based urologic eval should still be performed

struct MHManagement: View {
    
    @ObservedObject var mh: MHData
    
    @State private var showReferences = false
    
    private let management: [String: String] = [
        "nonMalignant": "The patient may have a gynecologic or non-malignant cause for the hematuria.  Treat the suspected underlying condition.  Recheck of a microscopic urinalysis is indicated after treatment/resolution, which can be performed 3 weeks later.  If a medical-renal disease is suspected, refer to nephrology.  If it is unclear whether patient actually has one of these non-malignant sources of hematuria, repeat this algorithm and select \"No\" on the Non-malignant causes screen.",
        "lowRisk": "The patient is classified as low risk for malignancy.  Engage in shared decision-making with the patient.  Options are to repeat a urinalysis within 6 months OR perform a cystoscopy and renal ultrasound now.  Refer to urology if cystoscopy is to be performed.  If the patient decides to simply repeat a UA, if the subsequent UA shows microscopic hematuria the patient should now be reclassified as either intermediate or high risk.",
        "intRisk": "The patient is as intermediate risk for malignancy.  Cystoscopy and renal ultrasound should be performed.  Refer to urology.",
        "highRisk": "The patient is classified as high risk for malignancy.  Cystoscopy and CT urography should be performed.  If CT urography is contraindicated, MR urography is an option.  If both CT and MR urography are contraindicated, consider retrograde pyelogram with either noncontrast CT/noncontrast MR or renal ultrasound.  Refer to urology."
    ]
    
    var body: some View {
        ScrollView {
            VStack {
                Text("Management")
                    .fontWeight(.black)
                    .modifier(ManagementMod(textColor: blue))
                Group {
                    //if gyn or non-malignant cause likely
                    if mh.nonCancerCause == 0 {
                        Text(management["nonMalignant"]!)
                    //low/int/high risk
                    } else if mh.nonCancerCause == 1 {
                        //high risk
                        if mh.highRFs == 0 {
                            Text(management["highRisk"]!)
                        } else if mh.highRFs == 1 {
                            //intermediate risk
                            if mh.intRFs == 0 {
                                Text(management["intRisk"]!)
                              //low risk
                            } else if mh.intRFs == 1 {
                                Text(management["lowRisk"]!)
                            }
                        }
                    }
                    
                }
            }.font(.footnote).padding(.horizontal)
            .navigationBarTitle("MH Management", displayMode: .inline)
            .navigationBarItems(trailing: Button(action: {
                self.showReferences.toggle()
            }) {
                Image(systemName: "r.square")
            }).sheet(isPresented: $showReferences) {
                MHReference()
            }
        }
    }
}

struct MHManagement_Previews: PreviewProvider {
    static var previews: some View {
        MHManagement(mh: MHData())
    }
}
