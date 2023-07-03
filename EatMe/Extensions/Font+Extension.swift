//
//  Font+Extension.swift
//  EatMe
//
//  Created by Юрий Альт on 28.06.2023.
//

import SwiftUI

extension Font {
    enum SFProDisplay {
        enum Medium {
            static func size(of size: CGFloat) -> Font {
                return .custom(Constants.SFProDisplay.medium, size: size)
            }
        }
        
        enum Regular {
            static func size(of size: CGFloat) -> Font {
                return .custom(Constants.SFProDisplay.regular, size: size)
            }
        }
        
        enum Semibold {
            static func size(of size: CGFloat) -> Font {
                return .custom(Constants.SFProDisplay.semibold, size: size)
            }
        }
    }
}

private extension Font {
    enum Constants {
        enum SFProDisplay {
            static let medium = "SFProDisplay-Medium"
            static let regular = "SFProDisplay-Regular"
            static let semibold = "SFProDisplay-Semibold"
        }
    }
}
