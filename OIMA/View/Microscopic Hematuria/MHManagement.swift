//
//  MHManagement.swift
//  OIMA
//
//  Created by Michael Albrecht on 12/24/20.
//  Copyright © 2020 Michael Albrecht. All rights reserved.
//

import SwiftUI

struct MHManagement: View {
    
    @ObservedObject var mh: MHData
    
    @State private var showReferences = false
    
    var body: some View {
        Text("MH Management")
    }
}

struct MHManagement_Previews: PreviewProvider {
    static var previews: some View {
        MHManagement(mh: MHData())
    }
}
