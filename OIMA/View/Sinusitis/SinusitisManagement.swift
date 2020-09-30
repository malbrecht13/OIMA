//
//  SinusitisManagement.swift
//  OIMA
//
//  Created by Michael Albrecht on 9/30/20.
//  Copyright © 2020 Michael Albrecht. All rights reserved.
//

import SwiftUI

struct SinusitisManagement: View {
    
    @ObservedObject var sinusitis: SinusitisData
    
    var body: some View {
        VStack {
            Text("Management").modifier(ManagementMod(textColor: green))
            
            //acute viral URI
            if !(sinusitis.purulent && (sinusitis.obstruction || sinusitis.faceSymptoms)) {
                Text("Patient may have a viral URI.  Treat symptoms if needed.")
            }
            //acute rhinosinusitis (ARS)
            if (sinusitis.purulent && (sinusitis.obstruction || sinusitis.faceSymptoms)) {
                //viral ARS
                if !(sinusitis.notImproved10Days || sinusitis.worsenIn10Days) {
                    Text("Patient meets criteria for acute viral rhinosinusitis. Treatments can include analgesics (acetaminophen, ibuprofen), nasal saline, oral decongestants for up to 3 to 5 days, intranasal corticosteroids, and cough suppressants.  If patient improves and then worsens within 10 days of symptom onset, or if patient fails to start improving after 10 days have passed, antibiotics could be considered.")
                } else if sinusitis.notImproved10Days || sinusitis.worsenIn10Days {
                    Text("Patient meets criteria for acute bacterial rhinosinusitis.")
                    //complication suspected
                    
                    //complication not suspected
                }
                
                
                //bacterial ARS
            }
        }
    }
}

struct SinusitisManagement_Previews: PreviewProvider {
    static var previews: some View {
        SinusitisManagement(sinusitis: SinusitisData())
    }
}
