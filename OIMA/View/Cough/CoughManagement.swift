//
//  CoughManagement.swift
//  OIMA
//
//  Created by Michael Albrecht on 12/7/20.
//  Copyright © 2020 Michael Albrecht. All rights reserved.
//

import SwiftUI

struct CoughManagement: View {
    
    @ObservedObject var cough: CoughData
    
    @State private var showReferences = false
    
    var body: some View {
        ScrollView {
            VStack {
                Text("Management")
                    .fontWeight(.black)
                    .modifier(ManagementMod(textColor: pink))
                Group {
                    //if there are red flags
                    if cough.coughRedFlags == 0 {
                        Text("The patient has red flags.  Provide appropriate workup and treatment using clinical judgment.  For example, consider CT chest imaging, echocardiogram, specialty referral, swallow study, EGD, rule out of tuberculosis, or other testing as deemed appropriate for the specific clinical setting.  If no life-threatening cause is identified, perform this algorithm again and select the option stating that no red flags are present.")
                    //if there are no red flags
                    } else if cough.coughRedFlags == 1 {
                        //if there are easy fixes present
                        if cough.coughEasyFixes == 0 {
                            Text("The patient has no red flags but may have any easy fix.  You've selected that the patient either smokes, is on an ACE inhibitor, or is on sitagliptin.  Consider discontinuation of these for at least 4 weeks.  If this is not the culprit, proceed to ruling out other causes such as upper airway cough syndrome, asthma, non-asthmatic eosinophilic bronchitis, and GERD.")
                        //if there are no easy fixes present
                        } else if cough.coughEasyFixes == 1 {
                            if cough.commonCausesRO == 1 {
                                Text("The top four common causes of chronic cough have not yet been ruled out.  Multiple diagnoses may need to be ruled out prior to coming up with the correct solution for the cough.  Note that all of these conditions may present with cough alone without any other clinical clues as to the diagnosis.\n\n\nUpper Airway Cough Syndrome (UACS)\n\nFor upper airway cough syndrome (UACS), empiric therapy with a first-generation antihistamine/decongestant combination should first be attempted.  If the syndrome is suspected but patient does not respond, the patient should undergo sinus imaging to rule out chronic sinusitis.  Nasopharyngoscopy could also be considered.\n\n\nAsthma\n\nAsthma evaluation may include spirometry with bronchodilator reversibility testing, bronchoprovocation challenge, and allergy evaluation/empiric treatment.  Treatment for asthma may include inhaled corticosteroids (ICS), bronchodilators, leukotriene receptor antagonists, and trigger avoidance.\n\n\nNon-Asthmatic Eosinophilic Bronchitis (NAEB)\n\nNon-asthmatic eosinpholic bronchitis (NAEB) can be considered after ruling out asthma.  Diagnosis is by demonstration of sputum eosinophilia, either with an expectorated sample or via a sample obtained via bronchoscopy.  Treatment includes inhaled corticosteroids and trigger avoidance.\n\n\nGERD\n\nGERD can be empirically treated with a proton-pump inhibitor.  However, since not all reflux disease is caused by gastric acid, treatment must include lifestyle changes.  Such lifestyle changes include a low-fat diet, avoidance of caffeine, citrus products, tomatoes, alcohol, smoking, limiting vigorous exercise that increases intraabdominal pressure.  If it is unclear if GERD is the cause of cough, 24 hour esophageal pH monitoring/impedence monitoring may be considered.  If none of the above treatments are effective and pH monitoring indicates reflux, antireflux surgery may need to be considered.\n\nConsider referral to either Pulmonology, ENT, GI, and/or Allergy as appropriate.")
                            //no red flags and common causes ruled out
                            } else if cough.commonCausesRO == 0 {
                                Text("The patient has no red flags and the four most common causes have been ruled out.\n\nFurther investigations that can be considered for this patient if not already performed include 24 hour esophageal pH/impedance monitoring, swallow evaluation, barium esophagram/modified barium swallow, sinus imaging, high-resolution CT of the chest (HRCT), bronchoscopy, cardiac workup such as with echo/EKG/holter monitoring, and/or environment/occupation assessment.\n\nThis patient should be considered for referral to a cough specialist, or a specialist such as Pulmonology, ENT, GI, and/or Allergy as clinically appropriate.")
                            }
                            
                        }
                    }
                }.font(.footnote).padding(.horizontal)
                .navigationBarTitle("Cough Management", displayMode: .inline)
                .navigationBarItems(trailing: Button(action: {
                    self.showReferences.toggle()
                }) {
                    Image(systemName: "r.square")
                }.sheet(isPresented: $showReferences) {
                    CoughReference()
                }
                )
            }
        }
    }
}

struct CoughManagement_Previews: PreviewProvider {
    static var previews: some View {
        CoughManagement(cough: CoughData())
    }
}
