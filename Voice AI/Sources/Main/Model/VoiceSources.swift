//
//  VoiceSources.swift
//  Voice AI
//
//  Created by Dinmukhammed Begaly on 24.03.2024.
//

import UIKit

struct Voices: Hashable {
    var title: String
    var image: UIImage
}

//struct VoiceType {
//    var title: String
//}

extension Voices {
    static var elements: [[Voices]] = [
        [
            Voices(title: "Politician", image: UIImage(named: "") ?? UIImage()),
            Voices(title: "Podcast", image: UIImage(named: "") ?? UIImage()),
            Voices(title: "Singer", image: UIImage(named: "") ?? UIImage()),
            Voices(title: "Rapper", image: UIImage(named: "") ?? UIImage()),
            Voices(title: "Pop Star", image: UIImage(named: "") ?? UIImage()),
            Voices(title: "Press", image: UIImage(named: "") ?? UIImage()),
            Voices(title: "Singer", image: UIImage(named: "") ?? UIImage())
        ]
    ]
}


