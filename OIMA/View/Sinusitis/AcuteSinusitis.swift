//
//  AcuteSinusitis.swift
//  OIMA
//
//  Created by Michael Albrecht on 9/22/20.
//  Copyright © 2020 Michael Albrecht. All rights reserved.
//

/*
Rosenfeld et al. Clinical practice guideline (update): adult sinusitis.  Otolaryngoloy-Head and Neck Surgery 2015;152(2S):S1-S39.
 
 This article has a fantastic algorithm in flow-chart form on page S8.  Additional info from the article:

Page S6
If a patient has up to 4 weeks of purulent drainage accompanied by nasal obstruction or facial pain-pressure-fullness, or both, they have Acute rhinosinusitis (ARS).  If there is no purulent drainage, there is no rhinosinusitis.  If a patient has ARS then the clinician should distinguish between viral (AVS) and bacterial rhinosinusitis (ABRS).

Page S9
Additional symptoms of ABRS include fever, cough, fatigue, reduced sense of smell (hyposmia), lack of sense of smell (anosmia), maxillary dental pain, and ear fullness or pressure

If a patient has facial pain/pressure/fullness but not purulent drainage, migraine, tension headache, or dental abscess could be considered
 
Initial diagnostic eval of ARS: vital signs, exam of head/neck, exam for hyponasal speech, edema over cheek bone or periorbital area, palpable cheek tenderness, percussion tenderness over upper teeth, purulent drainage in nose or posterior pharynx, extra-sinus involvement signs: orbital/facial cellulitis, orbital protrusions, abnormalities of eye movement, neck stiffness.  However, purulent drainage is only finding shown to have diagnostic value.
 */

import SwiftUI

struct AcuteSinusitis: View {
    
    @ObservedObject var sinusitis: SinusitisData
    
    var body: some View {
        
        VStack {
            Form {
                Section(header: Text("Select if the patient has any of the following").modifier(SectionHeaderModifier(textColor: green)), content: {
                    ShowToggle(binding: $sinusitis.purulent, text: "Purulent (not clear) nasal drainage in nasal cavity or posterior oropharynx")
                    ShowToggle(binding: $sinusitis.obstruction, text: "Nasal obstruction")
                    ShowToggle(binding: $sinusitis.faceSymptoms, text: "Facial pain, pressure, or fullness")
                })
            }
        }
    }
}

struct AcuteSinusitis_Previews: PreviewProvider {
    static var previews: some View {
        AcuteSinusitis(sinusitis: SinusitisData())
    }
}
