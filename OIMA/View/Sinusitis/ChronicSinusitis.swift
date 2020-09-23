//
//  ChronicSinusitis.swift
//  OIMA
//
//  Created by Michael Albrecht on 9/22/20.
//  Copyright © 2020 Michael Albrecht. All rights reserved.
//

import SwiftUI

struct ChronicSinusitis: View {
    
    @ObservedObject var sinusitis: SinusitisData
    
    var body: some View {
        Text("Chronic Sinusitis")
    }
}

struct ChronicSinusitis_Previews: PreviewProvider {
    static var previews: some View {
        ChronicSinusitis(sinusitis: SinusitisData())
    }
}
