//
//  Font+Extension.swift
//  GIPHY World
//
//  Created by Mikhail Borisov on 24/11/22.
//

import SwiftUI

extension Font {
    static func montserratRegular(size: CGFloat) -> Font {
        Font.custom("Montserrat-Regular", size: size)
    }
    
    static func montserratMedium(size: CGFloat) -> Font {
        Font.custom("Montserrat-Medium", size: size)
    }
    
    static func montserratSemiBold(size: CGFloat) -> Font {
        Font.custom("Montserrat-SemiBold", size: size)
    }
    
    static func montserratBold(size: CGFloat) -> Font {
        Font.custom("Montserrat-Bold", size: size)
    }
    
    static func montserratExtraBold(size: CGFloat) -> Font {
        Font.custom("Montserrat-ExtraBold", size: size)
    }
}
