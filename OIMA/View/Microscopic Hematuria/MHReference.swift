//
//  MHReference.swift
//  OIMA
//
//  Created by Michael Albrecht on 12/23/20.
//  Copyright © 2020 Michael Albrecht. All rights reserved.
//

import SwiftUI

fileprivate let topic = "Microscopic Hematuria"
fileprivate let fillColor = blue

fileprivate let citations : [Citation] =  [
    Citation(first: "Barocas et al.  Microhematuria: AUA/SUFU guidelines ", italicized: "", last: "2020.  https://www.auanet.org/guidelines/microhematuria#x14850."),
    
]

fileprivate let sortedCitations = citations.sorted { $0.first < $1.first }

struct MHReference: View {
    var body: some View {
        ReferenceView(sortedCitationArray: sortedCitations, topic: topic, fillColor: fillColor)
    }
}

struct MHReference_Previews: PreviewProvider {
    static var previews: some View {
        MHReference()
    }
}
