//
//  Constants.swift
//  The Movie DB
//
//  Created by Anton Hoang on 25.02.2021.
//

import Foundation
import UIKit

struct Constants {
  
  enum APICreditials: String {
    case api_key = "a1e6469b9c841dbf821f4ef57f4d74f0"
    case bearer = "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJhMWU2NDY5YjljODQxZGJmODIxZjRlZjU3ZjRkNzRmMCIsInN1YiI6IjYwMzM1OGY5OWFmMTcxMDAzZjQ1YjNiNyIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.H-f-0iZNchiOoPmJc42k5p7vszMqsvOqd9K-6p1JiL0"
  }
  
  enum CellIdentifiers: String, RawRepresentable {
    case homeCellId = "homeCellId"
    case menuCellId = "menuCellId"
  }
  
  enum ScreenTitles: String, RawRepresentable {
    case home = "Home"
    case details = "Details"
    case favorite = "Favorite"
  }
  
  enum Images {
    static let popcorn = "popcorn"
    static let leftArrow = "left-arrow"
    static let leftArrow2 = "left-arrow2"
  }
  
  enum Colors {
    static let dark = UIColor(red: 28/255, green: 28/255, blue: 30/255, alpha: 1)
  }
  
  struct Icons {
    static let appleIcon = UIImageView(image: UIImage(named: "apple_icon"))
  }
  
  struct CellIdentifier {
    public static let buyCellID = "buyCellID"
    public static let presentViewCellID = "presentViewCellID"
    public static let likeCellID = "likeCellID"
    public static let feedCellID = "feedCellID"
    public static let feedNewsCellID = "feedNewsCellID"
    public static let feedNewsCellID2 = "feedNewsCellID2"
    public static let feedNewsContainerCellID = "feedNewsContainerCellID"
    public static let profileHeadCellID = "profileHeadCellID"
    public static let profileListCellID = "profileListCellID"
    public static let menuCellID = "MenuController"
  }
  
  struct HeaderIdentifier {
    public static let cardHeaderId = "cardHeaderId"
  }
  
  struct TabBar {
    public static let feed = UIImageView(image: UIImage(named: "tabbar1"))
    public static let buy = UIImageView(image: UIImage(named: "tabbar2"))
    public static let post = UIImageView(image: UIImage(named: "tabbar9"))
    public static let likes = UIImageView(image: UIImage(named: "tabbar6")?.withRenderingMode(.alwaysOriginal))
    public static let settings = UIImageView(image: UIImage(named: "tabbar4"))
    public static let profile = UIImageView(image: UIImage(named: "tabbar10")?.withRenderingMode(.alwaysOriginal))
  }
  
  struct AuthImages {
    public static let fingers_5 = UIImageView(image: UIImage(named: "1"))
    //    public static let fingers_0 = UIImageView(image: UIImage(named: "2"))
    public static let fingers_1 = UIImageView(image: UIImage(named: "3"))
    public static let fingers_1_mid = UIImageView(image: UIImage(named: "4"))
    public static let fingers_0 = UIImageView(image: UIImage(named: "5"))
    public static let fingers_2 = UIImageView(image: UIImage(named: "7"))
  }
  
  struct BackgroundImage {
    public static let gradient_1 = UIImageView(image: UIImage(named: "diia_gradient_01"))
    public static let gradient_2 = UIImageView(image: UIImage(named: "diia_gradient_02"))
    public static let gradient_3 = UIImageView(image: UIImage(named: "diia_gradient_03"))
    public static let gradient_4 = UIImageView(image: UIImage(named: "diia_gradient_04"))
    public static let gradient_5 = UIImageView(image: UIImage(named: "diia_gradient_05"))
    
    static func gradient1() -> UIImageView {
      .init(image: gradient_1.image)
    }
    
    static func gradient2() -> UIImageView {
      .init(image: gradient_2.image)
    }
    static func gradient3() -> UIImageView {
      .init(image: gradient_3.image)
    }
    
    static func gradient4() -> UIImageView {
      .init(image: gradient_4.image)
    }
    
    static func gradient5() -> UIImageView {
      .init(image: gradient_5.image)
    }
  }
  
  struct Color {
    public static let blue_18A0FF = UIColor(named: "18A0FF")
  }
  
  struct Spacing {
    public static let stackViewIntherium: CGFloat = 20.0
    public static let intheriumLeft: CGFloat = 10.0
    public static let intheriumRight: CGFloat = 10.0
  }
  
  struct Margin {
    public static let marginForShape5Percent  = UIScreen.main.bounds.width * 0.05
    public static let marginForShape10Percent = UIScreen.main.bounds.width * 0.1
    public static let marginForShape20Percent = UIScreen.main.bounds.width * 0.2
    public static let marginForShape30Percent = UIScreen.main.bounds.width * 0.3
    public static let marginForShape40Percent = UIScreen.main.bounds.width * 0.4
    public static let marginForShape50Percent = UIScreen.main.bounds.width * 0.5
    public static let marginForShape60Percent = UIScreen.main.bounds.width * 0.6
  }
  
  struct Shape {
    struct Square {
      let width: CGFloat
      let height: CGFloat
      
      static func square50x(multiply: CGFloat) -> Self {
        return .init(width: 50 * multiply, height: 50 * multiply)
      }
    }
  }
  
  struct ButtonSize {
    public static let signInWithAppleWidth: CGFloat = 140.0
    public static let signInWithAppleHeight: CGFloat = 44.0 //Font size 19
    public static let signInWithAppleWidthBig: CGFloat = 280.0
    public static let signInWithAppleHeightBig: CGFloat = 56.0 //Font size 24
  }
  
  struct UIScreenBounds {
    public static let widthFull     = UIScreen.main.bounds.width
    public static let widthDivided2 = UIScreen.main.bounds.width / 2
    public static let widthDivided3 = UIScreen.main.bounds.width / 3
    public static let widthDivided4 = UIScreen.main.bounds.width / 4
    public static let widthDivided5 = UIScreen.main.bounds.width / 5
    
    public static let heightFull            = UIScreen.main.bounds.height
    public static let heightDivided1_1      = UIScreen.main.bounds.height / 1.1
    public static let heightDivided1_2      = UIScreen.main.bounds.height / 1.2
    public static let heightDivided1_3      = UIScreen.main.bounds.height / 1.3
    public static let heightDivided1_4      = UIScreen.main.bounds.height / 1.4
    public static let heightDivided1_5      = UIScreen.main.bounds.height / 1.5
    public static let heightDivided2        = UIScreen.main.bounds.height / 2
    public static let heightDivided3        = UIScreen.main.bounds.height / 3
    public static let heightDivided4        = UIScreen.main.bounds.height / 4
    public static let heightDivided5        = UIScreen.main.bounds.height / 5
  }
  
  //MARK: - Absolute numbers recomended by Apple for UX design icons and another views
  //  Icon-Small.png    - 29px       - 5.088
  //  Icon.png          - 57px       - 10
  //  Icon-Small@2x.png - 58px       - 10.175
  //  Icon-72.png       - 72px       - 12.632
  //  Icon@2x.png       - 114px      - 20
  //  Icon-72@2x.png    - 144px      - 25.263
  //  Icon512.png       - 512px      - 89.825
  //  Icon1024.png      - 1024px     - 179.649
  
  struct CornerRadius {
    public static let absoluteForSquare = 0.2237 // 57x57
    public static let icon29px          = 5.088
    public static let icon57px          = 10
    public static let icon58px          = 10.175
    public static let icon72px          = 12.632
    public static let icon114px         = 20
    public static let icon144px         = 25.263
    public static let icon512px         = 89.825
    public static let icon1024px        = 179.649
  }
}

