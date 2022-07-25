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



//    // remember the min and max values
//    if volume > maxVolume { maxVolume = volume }
//    if volume < minVolume { minVolume = volume }
//
//    maxVolume = maxVolume * 0.95
//    if maxVolume < 0.1 {
//      maxVolume = 0.1
//    }
//
//    if maxVolume == minVolume { maxVolume += 0.1 } // never end up with devide by zero (see next line)
//
//    // figure out a good number between zero and one to represent the current volume, given the max values
//    let range = maxVolume - minVolume
//    let normalizedVolume = (volume - minVolume) / (range - minVolume)
//
//    // the targetVolume it where the animation will try to get to (by incrementing 'self.volume'
//    targetVolume = state == .listening ? normalizedVolume : 0.0
//
//    // update the halo
//    halo.view.set(drawing: .halo(radius: normalizedVolume), colors: .halo)
//    setNeedsDisplay()

  
  // MARK: Graphics
  
  
//  /// draw the microphone
//  public override func draw(_ rect: CGRect) {
//
//    // gets a radius for the innermost circle
//    let radius = chooseRadius()
//
//    // find the centre
//    let centre = CGPoint(x:rect.size.width / 2.0, y:rect.size.height / 2.0)
//
//    // figure out how much room there is for the halo
//    var maxRadius = min(frame.size.width, frame.size.height) / 2.0
//    if maxRadius > 216.0 {
//      maxRadius = 216.0
//    }
//    let fanRoom = maxRadius - radius
//
//    let fanSpread = volumeToFanSpread()
//
//    // draw the four circles and the icon on top
//    //circle(centre: centre, radius: radius + fanRoom * fanSpread * 0.9, colour: engaged ? W3WSettings.color(named: "MicOnColor").withAlphaComponent(0.2) : W3WSettings.color(named: "MicOffColor"))
//    //circle(centre: centre, radius: radius + fanRoom * fanSpread * 0.6, colour: engaged ? W3WSettings.color(named: "MicOnColor").withAlphaComponent(0.3) : W3WSettings.color(named: "MicOffColor"))
//    //circle(centre: centre, radius: radius + fanRoom * fanSpread * 0.3, colour: engaged ? W3WSettings.color(named: "MicOnColor").withAlphaComponent(0.4) : W3WSettings.color(named: "MicOffColor"))
//    //circle(centre: centre, radius: radius, colour: engaged ? W3WSettings.color(named: "MicOnColor") : W3WSettings.color(named: "MicOffColor"))
//    //voiceIcon(centre: centre, radius: radius / 2.2, colour: engaged ? W3WSettings.color(named: "MicOffColor") : W3WSettings.color(named: "MicOnColor"))
//  }
//
//
//  /// gets a radius for the innermost circle, ideally at the set size, but smaller if that doesn't fit
//  func chooseRadius() -> CGFloat {
//    var radius = idealRadius
//
//    // if ideaRadius is too small, use a quarter of the smallest view size
//    if idealRadius > min(frame.size.width, frame.size.height) / 4.0 {
//      radius = min(frame.size.width, frame.size.height) / 4.0
//    }
//
//    return radius
//  }
//
//
//  func volumeToFanSpread() -> CGFloat {
//    let ex = -5.0 * (volume * 2.0 - 1.0)
//    let denominator = 1.0 + exp(ex)
//    return 1.0 / denominator
//  }
  

///// sets all the options to use in voice recognition
///// - Parameters:
/////     - options: an array of W3WOption
//public func set(options: [W3WOption]) {
//  self.options = options
//}
//
//
///// sets all the options to use in voice recognition
///// TODO: move W3WOptionAcceptorProtocol into Api, and use it and remove this
///// - Parameters:
/////     - options: a W3WOptions object
//public func set(options: W3WOptions) {
//  self.options = options.options
//}
//
//
///// assigns an array of options to use on autosuggest calls
///// TODO: move W3WOptionAcceptorProtocol into Api, and use it and remove this
///// - Parameters:
/////     - options: a single W3WOption
//public func set(options: W3WOption) {
//  set(options: [options])
//}
//
//
