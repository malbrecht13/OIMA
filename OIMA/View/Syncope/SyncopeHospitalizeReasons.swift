//
//  SyncopeHospitalizeReasons.swift
//  OIMA
//
//  Created by Michael Albrecht on 12/24/20.
//  Copyright © 2020 Michael Albrecht. All rights reserved.
//

import SwiftUI


struct SyncopeHospitalizeReasons: View {
    
    private let conditions = ["Cardiac arrhythmia", "Pacemaker/ICD malfunction", "Cardiac ischemia", "Severe aortic stenosis", "Cardiac tamponade", "Hypertrophic cardiomyopathy", "Pulmonary embolism", "Aortic dissection", "Acute heart failure", "Severe anemia or GI bleeding", "Major traumatic injury due to syncope", "Persistent vital sign abnormalities"]
    var body: some View {
        VStack {
            Text("Examples of serious medical conditions that might warrant hospitalization after a syncopal episode").modifier(TitleModifier(fillColor: red))
                .lineLimit(5)
                .multilineTextAlignment(.leading)
            VStack(alignment: .leading) {
                ForEach(conditions, id: \.self) { condition in
                    HStack {
                        Text("•")
                        Text("\(condition)").font(.caption).fontWeight(.medium)
                    }
                }
            }.padding()
            
        }
        
    }
}

struct SyncopeHospitalizeReasons_Previews: PreviewProvider {
    static var previews: some View {
        
            SyncopeHospitalizeReasons()
            
        
    }
}
