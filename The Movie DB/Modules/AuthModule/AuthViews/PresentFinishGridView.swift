//
//  PresentFinishGridView.swift
//  The Movie DB
//
//  Created by Anton Hoang on 09.03.2021.
//  Copyright © 2021 Anton Hoang. All rights reserved.
//

import Foundation
import UIKit
import AuthenticationServices

final class PresentFinishGridView: CommonInitView {
  
  //MARK: - Properties
//  weak var finishButton: CommonButton!
  weak var appleButton: ASAuthorizationAppleIDButton!
  weak var finishButton: CommonButton! 

  //MARK: - Setup views
  
  override func сommonInit() {
    setupBackground()
    setupFinishButton()
//    setupAppleButton()
  }
  
  fileprivate func setupBackground() {
    backgroundColor = .clear
    let titleLabel = UILabel()
    addSubview(titleLabel)
//    titleLabel.setupLabelWith(text: "Buy my attention", textColor: .white, font: .boldSystemFont(ofSize: 35))
//    titleLabel.topLeft(to: self, topSpace: BMA.Margin.marginForShape20Percent, leftSpace: BMA.Margin.marginForShape5Percent)
//    titleLabel.drawShadow(offset: CGSize(width: 1, height: 1), opacity: 1, color: .black, radius: 1)
  }
  
  fileprivate func setupAppleButton() {
    let appleButton = ASAuthorizationAppleIDButton()
    addSubview(appleButton)
    self.appleButton = appleButton
//    appleButton.center(to: self)
    appleButton.addTarget(self, action: #selector(signInWithApple), for: .touchUpInside)
  }
  
  @objc fileprivate func signInWithApple() {
    let provider = ASAuthorizationAppleIDProvider()
    let request = provider.createRequest()
    request.requestedScopes = [.fullName, .email]
    
    let controller = ASAuthorizationController(authorizationRequests: [request])
    controller.delegate = self
    controller.presentationContextProvider = self
    controller.performRequests()
  }
  
  fileprivate func setupFinishButton() {
    let finishButton = CommonButton()
    addSubview(finishButton)
    self.finishButton = finishButton
    finishButton.setTitle("Share your opinion with us", for: .normal)
    finishButton.titleLabel?.numberOfLines = 0
    finishButton.titleLabel?.textAlignment = .center
    finishButton.titleLabel?.font = .preferredFont(forTextStyle: .largeTitle)
    finishButton.titleLabel?.textColor = .white
    finishButton.titleLabel?.drawShadow(offset: CGSize(width: 1, height: 1), opacity: 1, color: .black, radius: 1)

    finishButton.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      finishButton.centerXAnchor.constraint(equalTo: centerXAnchor),
      finishButton.centerYAnchor.constraint(equalTo: centerYAnchor),
      finishButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
      finishButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20)
    ])
  }
}

extension PresentFinishGridView: ASAuthorizationControllerDelegate {
  func authorizationController(controller: ASAuthorizationController, didCompleteWithAuthorization authorization: ASAuthorization) {
    
    switch authorization.credential {
    case let credentionals as ASAuthorizationAppleIDCredential:
      break
    default: break
    }
  }
  
  func authorizationController(controller: ASAuthorizationController, didCompleteWithError error: Error) {
    
  }
}

extension PresentFinishGridView: ASAuthorizationControllerPresentationContextProviding {
  func presentationAnchor(for controller: ASAuthorizationController) -> ASPresentationAnchor {
    guard let window = window else { return ASPresentationAnchor() }
    return window
  }
}
