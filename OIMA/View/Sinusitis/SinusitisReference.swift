//
//  SinusitisReference.swift
//  OIMA
//
//  Created by Michael Albrecht on 10/7/20.
//  Copyright © 2020 Michael Albrecht. All rights reserved.
//

import SwiftUI

fileprivate let topic = "Sinusitis"
fileprivate let fillColor = green

fileprivate let citations : [Citation] =  [
    Citation(first: "Rosenfeld et al. Clinical practice guideline (update): Adult sinusitis. ", italicized: "Otolaryngology-Head and Neck Surgery. ", last: "2015;152(2S):S1-S39.")]

fileprivate let sortedCitations = citations.sorted { $0.first < $1.first }

struct SinusitisReference: View {
    
    
    var body: some View {
        ReferenceView(sortedCitationArray: sortedCitations, topic: topic, fillColor: fillColor)
    }
}

struct SinusitisReference_Previews: PreviewProvider {
    static var previews: some View {
        SinusitisReference()
    }
}
