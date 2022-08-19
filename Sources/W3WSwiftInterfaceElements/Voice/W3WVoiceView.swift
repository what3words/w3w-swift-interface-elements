//
//  File.swift
//  
//
//  Created by Dave Duprey on 04/07/2022.
//

import Foundation
import UIKit
import W3WSwiftApi
import W3WSwiftDesign
import W3WSwiftInterfaceCommon


/// A microphone view 
open class W3WMicWithHaloView: UIView { //}, W3WOptionAcceptorProtocol {
    
  // MARK: Vars
  
  /// microphone colours
  var micColors = W3WColorSet.microphoneRedWhiteLogo
  
  /// halo colours
  var haloColors = W3WColorSet.halo
  
  /// state
  var state = W3WVoiceViewState.idle

  /// current volume shown in size of halo
  var volume:CGFloat        = 0.0
  
  /// target volume for animation to aim for
  var targetVolume:CGFloat  = 0.0
  
  /// the icon in the middle
  var icon: W3WIconButton!
  
  /// the halo around the icon
  var halo: W3WIcon!
  
    
  // MARK: Init
  
  /// the API and language (defaulst to english) to be used for voice recignition
  public override init(frame: CGRect) {
    super.init(frame: .w3wWhatever)

    halo = W3WIcon(drawing: .halo(radius: 0.0), colors: haloColors, frame: .w3wWhatever, padding: .bold)
    addSubview(halo)

    icon = W3WIconButton(drawing: .micFilledWithSlashes, colors: micColors, frame: .w3wWhatever, padding: .none, onTap: { [weak self] in self?.onTap() })
    //W3WIcon(drawing: .micFilledWithSlashes, colors: micColors, frame: .w3wWhatever, padding: .none)
    addSubview(icon)
  }

  
  public required init?(coder: NSCoder) {
    assertionFailure("IB version not supported yet")
    super.init(coder: coder)
  }
  

  // MARK: Accessors

  
  open func set(state: W3WVoiceViewState) {
    self.state = state
    
    switch state {
      case .error:
        set(micColors: .microphoneWhiteOutline, haloColors: .halo)
        set(volume: 0.0)
        
      case .idle:
        set(micColors: .microphoneWhiteOutline, haloColors: .halo)
        set(volume: 0.0)

      case .listening:
        set(micColors: .microphoneRedWhiteLogo, haloColors: .halo)

      case .sending:
        set(micColors: .microphoneOn, haloColors: .halo)
        set(volume: 0.0)
    }
    
    redraw()
  }
  
  
  /// sets the volume level to display, you can send in values from 0 -> 1
  /// - Parameters:
  ///     - volume: the volume to show, between 0.0 and 1.0
  open func set(volume: CGFloat) {
    self.targetVolume = min(1.0, max(0.0, volume)) / 2.0
    
    // this is an odd construct, but it calls the animaiton 4 times in rapid succession 1/60 sec apart
    // a function to do this should be added to W3WThread, but that lives in W3WSwiftComponents now
    // but when it's moved to a library, then add something like W3WThread.repeat(count:interval:closure)
    updateAnitation()
    DispatchQueue.main.asyncAfter(deadline: .now() + 0.017) {
      self.updateAnitation()
      DispatchQueue.main.asyncAfter(deadline: .now() + 0.017) {
        self.updateAnitation()
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.017) {
          self.updateAnitation()
        }
      }
    }
  }

  
  func set(micColors: W3WColorSet = .microphoneRedWhiteLogo, haloColors: W3WColorSet = .halo) {
    self.micColors  = micColors
    self.haloColors = haloColors
    self.redraw()
  }
  
  
  // MARK: Util
  
  
  func updateAnitation() {
    let delta = (targetVolume - volume) / 5.0
    volume += delta
    self.redraw()
  }
  
  
  // MARK: Events
  
  
  open func onTap() {
  }
  
  
  // MARK: Layout


  /// redraw, usually called because of a color or volume change
  func redraw() {
    DispatchQueue.main.async {
      
      if self.state == .error || self.state == .idle || self.state == .sending {
        self.halo.set(drawing: .micCircle, colors: self.micColors)
        self.icon.set(drawing: .micWithSlashes, colors: self.micColors)
      } else {
        self.halo.set(drawing: .halo(radius: self.volume), colors: self.haloColors)
        self.icon.set(drawing: .micFilledWithSlashes, colors: self.micColors)
      }
      
      self.setNeedsDisplay()
    }
  }
  
  
  public override func layoutSubviews() {
    super.layoutSubviews()

    let iconFactor = 0.25
    let size = min(frame.width, frame.height)
    
    halo.frame = bounds
    icon.frame = CGRect(x: size * (1.0 - iconFactor) / 2.0, y: size * (1.0 - iconFactor) / 2.0, width: size * iconFactor, height: size * iconFactor)
  }


}



