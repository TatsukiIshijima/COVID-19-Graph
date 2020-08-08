//
//  Kanto.swift
//  ProjectName
//
//  Created by AuthorName on 2020/08/08.
//  Copyright © 2020 CompanyName. All rights reserved.
//
//  Generated by PaintCode
//  http://www.paintcodeapp.com
//
//  This code was generated by Trial version of PaintCode, therefore cannot be used for commercial purposes.
//

import UIKit

public class Kanto: NSObject {
    //// Drawing Methods
    
    @objc public dynamic class func drawCanvas1(frame targetFrame: CGRect = CGRect(x: 0, y: 0, width: 225, height: 225), resizing: ResizingBehavior = .aspectFit) {
        //// General Declarations
        let context = UIGraphicsGetCurrentContext()!
        
        //// Resize to Target Frame
        context.saveGState()
        let resizedFrame: CGRect = resizing.apply(rect: CGRect(x: 0, y: 0, width: 225, height: 225), target: targetFrame)
        context.translateBy(x: resizedFrame.minX, y: resizedFrame.minY)
        context.scaleBy(x: resizedFrame.width / 225, y: resizedFrame.height / 225)
        
        //// Color Declarations
        let strokeColor = UIColor(red: 0.000, green: 0.000, blue: 0.000, alpha: 1.000)
        
        //// A Blank Map of Japan Group
        context.saveGState()
        context.translateBy(x: -531.38, y: -554.69)
        context.scaleBy(x: 2, y: 2)
        
        //// KANAGAWA Drawing
        let kANAGAWAPath = UIBezierPath()
        kANAGAWAPath.move(to: CGPoint(x: 306.66, y: 348.33))
        kANAGAWAPath.addLine(to: CGPoint(x: 308.03, y: 348.94))
        kANAGAWAPath.addLine(to: CGPoint(x: 308.69, y: 350.52))
        kANAGAWAPath.addLine(to: CGPoint(x: 311.54, y: 350.52))
        kANAGAWAPath.addLine(to: CGPoint(x: 313.18, y: 351.06))
        kANAGAWAPath.addLine(to: CGPoint(x: 315.42, y: 353.91))
        kANAGAWAPath.addLine(to: CGPoint(x: 315.85, y: 351.06))
        kANAGAWAPath.addLine(to: CGPoint(x: 314.76, y: 350.15))
        kANAGAWAPath.addLine(to: CGPoint(x: 315.3, y: 349.67))
        kANAGAWAPath.addLine(to: CGPoint(x: 315.91, y: 350.15))
        kANAGAWAPath.addLine(to: CGPoint(x: 316.94, y: 349.06))
        kANAGAWAPath.addLine(to: CGPoint(x: 319.54, y: 350.03))
        kANAGAWAPath.addLine(to: CGPoint(x: 321.91, y: 352.64))
        kANAGAWAPath.addLine(to: CGPoint(x: 324.39, y: 353.11))
        kANAGAWAPath.addLine(to: CGPoint(x: 324.45, y: 353.91))
        kANAGAWAPath.addLine(to: CGPoint(x: 323, y: 354.7))
        kANAGAWAPath.addLine(to: CGPoint(x: 322.27, y: 355.37))
        kANAGAWAPath.addLine(to: CGPoint(x: 321.85, y: 354.64))
        kANAGAWAPath.addLine(to: CGPoint(x: 321.63, y: 355.47))
        kANAGAWAPath.addCurve(to: CGPoint(x: 321.24, y: 356.33), controlPoint1: CGPoint(x: 319.6, y: 354.74), controlPoint2: CGPoint(x: 320.95, y: 356.71))
        kANAGAWAPath.addLine(to: CGPoint(x: 321, y: 357.49))
        kANAGAWAPath.addCurve(to: CGPoint(x: 320.45, y: 358.4), controlPoint1: CGPoint(x: 319.88, y: 356.86), controlPoint2: CGPoint(x: 319.85, y: 358.63))
        kANAGAWAPath.addLine(to: CGPoint(x: 320.58, y: 359.79))
        kANAGAWAPath.addCurve(to: CGPoint(x: 319.91, y: 360.15), controlPoint1: CGPoint(x: 320.58, y: 359.79), controlPoint2: CGPoint(x: 319.85, y: 360.09))
        kANAGAWAPath.addCurve(to: CGPoint(x: 320.64, y: 360.64), controlPoint1: CGPoint(x: 319.97, y: 360.21), controlPoint2: CGPoint(x: 320.64, y: 360.64))
        kANAGAWAPath.addLine(to: CGPoint(x: 320.15, y: 360.88))
        kANAGAWAPath.addLine(to: CGPoint(x: 320.15, y: 361.37))
        kANAGAWAPath.addLine(to: CGPoint(x: 321.12, y: 361.61))
        kANAGAWAPath.addLine(to: CGPoint(x: 321.73, y: 362.28))
        kANAGAWAPath.addLine(to: CGPoint(x: 322.82, y: 362.46))
        kANAGAWAPath.addLine(to: CGPoint(x: 323.18, y: 362.82))
        kANAGAWAPath.addLine(to: CGPoint(x: 322.09, y: 364.4))
        kANAGAWAPath.addCurve(to: CGPoint(x: 320.64, y: 366.16), controlPoint1: CGPoint(x: 320.09, y: 364.46), controlPoint2: CGPoint(x: 320.64, y: 366.16))
        kANAGAWAPath.addLine(to: CGPoint(x: 321.3, y: 366.4))
        kANAGAWAPath.addCurve(to: CGPoint(x: 321.12, y: 366.88), controlPoint1: CGPoint(x: 321.3, y: 366.4), controlPoint2: CGPoint(x: 321.12, y: 366.82))
        kANAGAWAPath.addCurve(to: CGPoint(x: 319.3, y: 366.94), controlPoint1: CGPoint(x: 321.12, y: 366.94), controlPoint2: CGPoint(x: 319.3, y: 366.94))
        kANAGAWAPath.addLine(to: CGPoint(x: 319.24, y: 366.28))
        kANAGAWAPath.addLine(to: CGPoint(x: 319.61, y: 365.85))
        kANAGAWAPath.addLine(to: CGPoint(x: 319.54, y: 365.19))
        kANAGAWAPath.addLine(to: CGPoint(x: 319.12, y: 365))
        kANAGAWAPath.addLine(to: CGPoint(x: 319.12, y: 364.52))
        kANAGAWAPath.addLine(to: CGPoint(x: 319.67, y: 364.58))
        kANAGAWAPath.addLine(to: CGPoint(x: 319.67, y: 363.91))
        kANAGAWAPath.addLine(to: CGPoint(x: 319, y: 363.73))
        kANAGAWAPath.addLine(to: CGPoint(x: 318.03, y: 362.4))
        kANAGAWAPath.addLine(to: CGPoint(x: 318.09, y: 361.43))
        kANAGAWAPath.addLine(to: CGPoint(x: 317.24, y: 360.76))
        kANAGAWAPath.addCurve(to: CGPoint(x: 316.76, y: 361.12), controlPoint1: CGPoint(x: 317.24, y: 360.76), controlPoint2: CGPoint(x: 316.7, y: 361.12))
        kANAGAWAPath.addCurve(to: CGPoint(x: 315.66, y: 360.94), controlPoint1: CGPoint(x: 316.82, y: 361.12), controlPoint2: CGPoint(x: 315.66, y: 360.94))
        kANAGAWAPath.addLine(to: CGPoint(x: 314.09, y: 360.46))
        kANAGAWAPath.addCurve(to: CGPoint(x: 305.9, y: 363.43), controlPoint1: CGPoint(x: 307.9, y: 360.64), controlPoint2: CGPoint(x: 305.97, y: 363.43))
        kANAGAWAPath.addCurve(to: CGPoint(x: 305.97, y: 366.4), controlPoint1: CGPoint(x: 305.84, y: 363.43), controlPoint2: CGPoint(x: 305.97, y: 366.4))
        kANAGAWAPath.addLine(to: CGPoint(x: 305.06, y: 366.7))
        kANAGAWAPath.addLine(to: CGPoint(x: 302.81, y: 366.22))
        kANAGAWAPath.addLine(to: CGPoint(x: 302.57, y: 365.25))
        kANAGAWAPath.addLine(to: CGPoint(x: 301.24, y: 363.61))
        kANAGAWAPath.addLine(to: CGPoint(x: 301.42, y: 361.97))
        kANAGAWAPath.addLine(to: CGPoint(x: 302.15, y: 360.88))
        kANAGAWAPath.addLine(to: CGPoint(x: 301.84, y: 357.55))
        kANAGAWAPath.addLine(to: CGPoint(x: 299.42, y: 357.55))
        kANAGAWAPath.addLine(to: CGPoint(x: 300.05, y: 356.18))
        kANAGAWAPath.addLine(to: CGPoint(x: 300.83, y: 355.3))
        kANAGAWAPath.addLine(to: CGPoint(x: 302.91, y: 354.59))
        kANAGAWAPath.addLine(to: CGPoint(x: 305.09, y: 352.9))
        kANAGAWAPath.addLine(to: CGPoint(x: 305.58, y: 351.09))
        kANAGAWAPath.addLine(to: CGPoint(x: 305.43, y: 349.58))
        kANAGAWAPath.addLine(to: CGPoint(x: 305.57, y: 348.06))
        kANAGAWAPath.addLine(to: CGPoint(x: 306.66, y: 348.33))
        kANAGAWAPath.close()
        strokeColor.setStroke()
        kANAGAWAPath.lineWidth = 0.5
        kANAGAWAPath.miterLimit = 4
        kANAGAWAPath.stroke()
        
        //// TOKYO Drawing
        let tOKYOPath = UIBezierPath()
        tOKYOPath.move(to: CGPoint(x: 301.06, y: 340.51))
        tOKYOPath.addLine(to: CGPoint(x: 301.72, y: 340.75))
        tOKYOPath.addLine(to: CGPoint(x: 302.57, y: 340.09))
        tOKYOPath.addLine(to: CGPoint(x: 304.87, y: 341.36))
        tOKYOPath.addLine(to: CGPoint(x: 306.15, y: 341.3))
        tOKYOPath.addLine(to: CGPoint(x: 307.54, y: 342.09))
        tOKYOPath.addLine(to: CGPoint(x: 310.33, y: 342.33))
        tOKYOPath.addLine(to: CGPoint(x: 311.24, y: 343.6))
        tOKYOPath.addLine(to: CGPoint(x: 313.3, y: 344.94))
        tOKYOPath.addLine(to: CGPoint(x: 317.48, y: 343.6))
        tOKYOPath.addLine(to: CGPoint(x: 317.42, y: 344.82))
        tOKYOPath.addLine(to: CGPoint(x: 318.7, y: 344.15))
        tOKYOPath.addLine(to: CGPoint(x: 319.48, y: 344.45))
        tOKYOPath.addLine(to: CGPoint(x: 320.33, y: 343.54))
        tOKYOPath.addLine(to: CGPoint(x: 323.18, y: 343.97))
        tOKYOPath.addLine(to: CGPoint(x: 323.49, y: 343.06))
        tOKYOPath.addLine(to: CGPoint(x: 325.91, y: 343.6))
        tOKYOPath.addLine(to: CGPoint(x: 327.26, y: 344.2))
        tOKYOPath.addLine(to: CGPoint(x: 327.03, y: 344.96))
        tOKYOPath.addLine(to: CGPoint(x: 327.6, y: 345.55))
        tOKYOPath.addLine(to: CGPoint(x: 327.44, y: 346.08))
        tOKYOPath.addLine(to: CGPoint(x: 328.14, y: 347.04))
        tOKYOPath.addLine(to: CGPoint(x: 327.83, y: 347.65))
        tOKYOPath.addLine(to: CGPoint(x: 327.17, y: 347.67))
        tOKYOPath.addLine(to: CGPoint(x: 327.17, y: 348.81))
        tOKYOPath.addLine(to: CGPoint(x: 326.71, y: 349.33))
        tOKYOPath.addLine(to: CGPoint(x: 325.12, y: 350.15))
        tOKYOPath.addLine(to: CGPoint(x: 324.21, y: 351.06))
        tOKYOPath.addLine(to: CGPoint(x: 324.33, y: 351.85))
        tOKYOPath.addLine(to: CGPoint(x: 324.39, y: 353.11))
        tOKYOPath.addLine(to: CGPoint(x: 321.91, y: 352.64))
        tOKYOPath.addLine(to: CGPoint(x: 319.54, y: 350.03))
        tOKYOPath.addLine(to: CGPoint(x: 316.94, y: 349.06))
        tOKYOPath.addLine(to: CGPoint(x: 315.91, y: 350.15))
        tOKYOPath.addLine(to: CGPoint(x: 315.3, y: 349.67))
        tOKYOPath.addLine(to: CGPoint(x: 314.76, y: 350.15))
        tOKYOPath.addLine(to: CGPoint(x: 315.85, y: 351.06))
        tOKYOPath.addLine(to: CGPoint(x: 315.42, y: 353.91))
        tOKYOPath.addLine(to: CGPoint(x: 313.18, y: 351.06))
        tOKYOPath.addLine(to: CGPoint(x: 311.54, y: 350.52))
        tOKYOPath.addLine(to: CGPoint(x: 308.69, y: 350.52))
        tOKYOPath.addLine(to: CGPoint(x: 308.03, y: 348.94))
        tOKYOPath.addLine(to: CGPoint(x: 306.66, y: 348.33))
        tOKYOPath.addLine(to: CGPoint(x: 305.57, y: 348.06))
        tOKYOPath.addLine(to: CGPoint(x: 304.84, y: 347.33))
        tOKYOPath.addLine(to: CGPoint(x: 303.07, y: 346.74))
        tOKYOPath.addLine(to: CGPoint(x: 301.89, y: 345.33))
        tOKYOPath.addLine(to: CGPoint(x: 300.8, y: 342.47))
        tOKYOPath.addLine(to: CGPoint(x: 300.25, y: 341.69))
        tOKYOPath.addLine(to: CGPoint(x: 301.06, y: 340.51))
        tOKYOPath.close()
        strokeColor.setStroke()
        tOKYOPath.lineWidth = 0.5
        tOKYOPath.miterLimit = 4
        tOKYOPath.stroke()
        
        //// SAITAMA Drawing
        let sAITAMAPath = UIBezierPath()
        sAITAMAPath.move(to: CGPoint(x: 294.2, y: 339.56))
        sAITAMAPath.addLine(to: CGPoint(x: 294.48, y: 338.83))
        sAITAMAPath.addLine(to: CGPoint(x: 293.84, y: 337.78))
        sAITAMAPath.addLine(to: CGPoint(x: 293.66, y: 336.87))
        sAITAMAPath.addLine(to: CGPoint(x: 295.05, y: 335.12))
        sAITAMAPath.addLine(to: CGPoint(x: 296.63, y: 335.3))
        sAITAMAPath.addLine(to: CGPoint(x: 297.9, y: 333.78))
        sAITAMAPath.addLine(to: CGPoint(x: 299.54, y: 333.06))
        sAITAMAPath.addLine(to: CGPoint(x: 302.87, y: 331.9))
        sAITAMAPath.addLine(to: CGPoint(x: 303.6, y: 330.93))
        sAITAMAPath.addLine(to: CGPoint(x: 303.54, y: 329.96))
        sAITAMAPath.addLine(to: CGPoint(x: 305.66, y: 326.75))
        sAITAMAPath.addLine(to: CGPoint(x: 311.12, y: 328.27))
        sAITAMAPath.addLine(to: CGPoint(x: 312.09, y: 327.42))
        sAITAMAPath.addLine(to: CGPoint(x: 314.94, y: 329.96))
        sAITAMAPath.addLine(to: CGPoint(x: 318.82, y: 329.18))
        sAITAMAPath.addLine(to: CGPoint(x: 319.42, y: 329.78))
        sAITAMAPath.addLine(to: CGPoint(x: 320.39, y: 329.42))
        sAITAMAPath.addLine(to: CGPoint(x: 320.86, y: 328.73))
        sAITAMAPath.addLine(to: CGPoint(x: 321.56, y: 329.37))
        sAITAMAPath.addLine(to: CGPoint(x: 321.78, y: 330.1))
        sAITAMAPath.addLine(to: CGPoint(x: 321.53, y: 330.21))
        sAITAMAPath.addLine(to: CGPoint(x: 321.58, y: 330.86))
        sAITAMAPath.addLine(to: CGPoint(x: 322.61, y: 332.56))
        sAITAMAPath.addLine(to: CGPoint(x: 322.72, y: 333.55))
        sAITAMAPath.addLine(to: CGPoint(x: 323.99, y: 333.65))
        sAITAMAPath.addLine(to: CGPoint(x: 325.11, y: 335.44))
        sAITAMAPath.addLine(to: CGPoint(x: 325.08, y: 336.6))
        sAITAMAPath.addLine(to: CGPoint(x: 325.59, y: 337.85))
        sAITAMAPath.addLine(to: CGPoint(x: 326.73, y: 339.29))
        sAITAMAPath.addLine(to: CGPoint(x: 327.63, y: 341.19))
        sAITAMAPath.addLine(to: CGPoint(x: 327.18, y: 342.07))
        sAITAMAPath.addLine(to: CGPoint(x: 327.26, y: 344.2))
        sAITAMAPath.addLine(to: CGPoint(x: 325.91, y: 343.6))
        sAITAMAPath.addLine(to: CGPoint(x: 323.49, y: 343.06))
        sAITAMAPath.addLine(to: CGPoint(x: 323.18, y: 343.97))
        sAITAMAPath.addLine(to: CGPoint(x: 320.33, y: 343.54))
        sAITAMAPath.addLine(to: CGPoint(x: 319.48, y: 344.45))
        sAITAMAPath.addLine(to: CGPoint(x: 318.7, y: 344.15))
        sAITAMAPath.addLine(to: CGPoint(x: 317.42, y: 344.82))
        sAITAMAPath.addLine(to: CGPoint(x: 317.48, y: 343.6))
        sAITAMAPath.addLine(to: CGPoint(x: 313.3, y: 344.94))
        sAITAMAPath.addLine(to: CGPoint(x: 311.24, y: 343.6))
        sAITAMAPath.addLine(to: CGPoint(x: 310.33, y: 342.33))
        sAITAMAPath.addLine(to: CGPoint(x: 307.54, y: 342.09))
        sAITAMAPath.addLine(to: CGPoint(x: 306.15, y: 341.3))
        sAITAMAPath.addLine(to: CGPoint(x: 304.87, y: 341.36))
        sAITAMAPath.addLine(to: CGPoint(x: 302.57, y: 340.09))
        sAITAMAPath.addLine(to: CGPoint(x: 301.72, y: 340.75))
        sAITAMAPath.addLine(to: CGPoint(x: 301.06, y: 340.51))
        sAITAMAPath.addLine(to: CGPoint(x: 300.25, y: 341.69))
        sAITAMAPath.addLine(to: CGPoint(x: 298.87, y: 342.21))
        sAITAMAPath.addLine(to: CGPoint(x: 297.6, y: 341.24))
        sAITAMAPath.addLine(to: CGPoint(x: 296.2, y: 341.06))
        sAITAMAPath.addLine(to: CGPoint(x: 295.6, y: 340.03))
        sAITAMAPath.addLine(to: CGPoint(x: 294.2, y: 339.56))
        sAITAMAPath.close()
        strokeColor.setStroke()
        sAITAMAPath.lineWidth = 0.5
        sAITAMAPath.miterLimit = 4
        sAITAMAPath.stroke()
        
        //// GUNMA Drawing
        let gUNMAPath = UIBezierPath()
        gUNMAPath.move(to: CGPoint(x: 311.97, y: 306.38))
        gUNMAPath.addLine(to: CGPoint(x: 313.54, y: 307.29))
        gUNMAPath.addLine(to: CGPoint(x: 312.03, y: 309.41))
        gUNMAPath.addLine(to: CGPoint(x: 312.51, y: 310.56))
        gUNMAPath.addLine(to: CGPoint(x: 311.18, y: 313.72))
        gUNMAPath.addLine(to: CGPoint(x: 312.94, y: 315.11))
        gUNMAPath.addLine(to: CGPoint(x: 315.18, y: 315.11))
        gUNMAPath.addLine(to: CGPoint(x: 315.72, y: 316.08))
        gUNMAPath.addLine(to: CGPoint(x: 314.09, y: 318.45))
        gUNMAPath.addLine(to: CGPoint(x: 313.66, y: 320.38))
        gUNMAPath.addLine(to: CGPoint(x: 312.27, y: 323.11))
        gUNMAPath.addLine(to: CGPoint(x: 313.85, y: 324.69))
        gUNMAPath.addLine(to: CGPoint(x: 313.85, y: 325.42))
        gUNMAPath.addLine(to: CGPoint(x: 315.66, y: 326.93))
        gUNMAPath.addLine(to: CGPoint(x: 320.03, y: 326.99))
        gUNMAPath.addLine(to: CGPoint(x: 320.86, y: 328.73))
        gUNMAPath.addLine(to: CGPoint(x: 320.39, y: 329.42))
        gUNMAPath.addLine(to: CGPoint(x: 319.42, y: 329.78))
        gUNMAPath.addLine(to: CGPoint(x: 318.82, y: 329.18))
        gUNMAPath.addLine(to: CGPoint(x: 314.94, y: 329.96))
        gUNMAPath.addLine(to: CGPoint(x: 312.09, y: 327.42))
        gUNMAPath.addLine(to: CGPoint(x: 311.12, y: 328.27))
        gUNMAPath.addLine(to: CGPoint(x: 305.66, y: 326.75))
        gUNMAPath.addLine(to: CGPoint(x: 303.54, y: 329.96))
        gUNMAPath.addLine(to: CGPoint(x: 303.6, y: 330.93))
        gUNMAPath.addLine(to: CGPoint(x: 302.87, y: 331.9))
        gUNMAPath.addLine(to: CGPoint(x: 299.54, y: 333.06))
        gUNMAPath.addLine(to: CGPoint(x: 297.9, y: 333.78))
        gUNMAPath.addLine(to: CGPoint(x: 296.63, y: 335.3))
        gUNMAPath.addLine(to: CGPoint(x: 295.05, y: 335.12))
        gUNMAPath.addLine(to: CGPoint(x: 293.66, y: 336.87))
        gUNMAPath.addLine(to: CGPoint(x: 291.54, y: 335.42))
        gUNMAPath.addLine(to: CGPoint(x: 291.84, y: 332.75))
        gUNMAPath.addLine(to: CGPoint(x: 291.54, y: 331.96))
        gUNMAPath.addLine(to: CGPoint(x: 290.08, y: 330.75))
        gUNMAPath.addLine(to: CGPoint(x: 291.48, y: 330.21))
        gUNMAPath.addLine(to: CGPoint(x: 291.54, y: 328.99))
        gUNMAPath.addLine(to: CGPoint(x: 290.63, y: 326.57))
        gUNMAPath.addLine(to: CGPoint(x: 292.2, y: 325.78))
        gUNMAPath.addLine(to: CGPoint(x: 291.66, y: 322.02))
        gUNMAPath.addLine(to: CGPoint(x: 289.48, y: 321.6))
        gUNMAPath.addLine(to: CGPoint(x: 287.66, y: 322.14))
        gUNMAPath.addLine(to: CGPoint(x: 284.99, y: 321.11))
        gUNMAPath.addLine(to: CGPoint(x: 284.93, y: 318.75))
        gUNMAPath.addLine(to: CGPoint(x: 285.35, y: 316.26))
        gUNMAPath.addLine(to: CGPoint(x: 286.99, y: 313.84))
        gUNMAPath.addLine(to: CGPoint(x: 288.51, y: 313.05))
        gUNMAPath.addLine(to: CGPoint(x: 288.44, y: 312.02))
        gUNMAPath.addLine(to: CGPoint(x: 290.02, y: 311.72))
        gUNMAPath.addLine(to: CGPoint(x: 291.11, y: 311.29))
        gUNMAPath.addLine(to: CGPoint(x: 293.11, y: 310.5))
        gUNMAPath.addLine(to: CGPoint(x: 293.78, y: 310.44))
        gUNMAPath.addLine(to: CGPoint(x: 293.96, y: 309.65))
        gUNMAPath.addLine(to: CGPoint(x: 295.66, y: 310.2))
        gUNMAPath.addLine(to: CGPoint(x: 296.87, y: 309.53))
        gUNMAPath.addLine(to: CGPoint(x: 296.99, y: 307.72))
        gUNMAPath.addLine(to: CGPoint(x: 299.84, y: 307.11))
        gUNMAPath.addLine(to: CGPoint(x: 299.72, y: 305.53))
        gUNMAPath.addLine(to: CGPoint(x: 300.45, y: 304.87))
        gUNMAPath.addLine(to: CGPoint(x: 301.3, y: 305.23))
        gUNMAPath.addLine(to: CGPoint(x: 300.99, y: 302.02))
        gUNMAPath.addLine(to: CGPoint(x: 303.18, y: 301.71))
        gUNMAPath.addLine(to: CGPoint(x: 304.27, y: 300.68))
        gUNMAPath.addLine(to: CGPoint(x: 304.63, y: 299.17))
        gUNMAPath.addLine(to: CGPoint(x: 306.88, y: 301.35))
        gUNMAPath.addLine(to: CGPoint(x: 306.94, y: 302.38))
        gUNMAPath.addLine(to: CGPoint(x: 308.75, y: 302.99))
        gUNMAPath.addLine(to: CGPoint(x: 308.69, y: 303.65))
        gUNMAPath.addLine(to: CGPoint(x: 309.72, y: 303.41))
        gUNMAPath.addLine(to: CGPoint(x: 313.12, y: 304.38))
        gUNMAPath.addLine(to: CGPoint(x: 311.97, y: 306.38))
        gUNMAPath.close()
        strokeColor.setStroke()
        gUNMAPath.lineWidth = 0.5
        gUNMAPath.miterLimit = 4
        gUNMAPath.stroke()
        
        //// TOCHIGI Drawing
        let tOCHIGIPath = UIBezierPath()
        tOCHIGIPath.move(to: CGPoint(x: 337.61, y: 305.72))
        tOCHIGIPath.addLine(to: CGPoint(x: 337.79, y: 306.99))
        tOCHIGIPath.addLine(to: CGPoint(x: 337.73, y: 309.84))
        tOCHIGIPath.addLine(to: CGPoint(x: 338.64, y: 311.41))
        tOCHIGIPath.addLine(to: CGPoint(x: 336.64, y: 312.2))
        tOCHIGIPath.addLine(to: CGPoint(x: 337.25, y: 314.69))
        tOCHIGIPath.addLine(to: CGPoint(x: 337.43, y: 318.08))
        tOCHIGIPath.addLine(to: CGPoint(x: 336.16, y: 320.63))
        tOCHIGIPath.addLine(to: CGPoint(x: 335.49, y: 322.51))
        tOCHIGIPath.addLine(to: CGPoint(x: 334.28, y: 321.78))
        tOCHIGIPath.addLine(to: CGPoint(x: 333.18, y: 322.45))
        tOCHIGIPath.addLine(to: CGPoint(x: 332.28, y: 322.08))
        tOCHIGIPath.addLine(to: CGPoint(x: 332.09, y: 323.17))
        tOCHIGIPath.addLine(to: CGPoint(x: 329.49, y: 323.29))
        tOCHIGIPath.addLine(to: CGPoint(x: 329.25, y: 324.14))
        tOCHIGIPath.addLine(to: CGPoint(x: 328.09, y: 324.75))
        tOCHIGIPath.addLine(to: CGPoint(x: 327.79, y: 325.78))
        tOCHIGIPath.addLine(to: CGPoint(x: 326.64, y: 325.3))
        tOCHIGIPath.addLine(to: CGPoint(x: 325.79, y: 325.96))
        tOCHIGIPath.addLine(to: CGPoint(x: 325.3, y: 328.09))
        tOCHIGIPath.addLine(to: CGPoint(x: 322.94, y: 329.36))
        tOCHIGIPath.addLine(to: CGPoint(x: 321.56, y: 329.37))
        tOCHIGIPath.addLine(to: CGPoint(x: 320.86, y: 328.73))
        tOCHIGIPath.addLine(to: CGPoint(x: 320.03, y: 326.99))
        tOCHIGIPath.addLine(to: CGPoint(x: 315.66, y: 326.93))
        tOCHIGIPath.addLine(to: CGPoint(x: 313.85, y: 325.42))
        tOCHIGIPath.addLine(to: CGPoint(x: 313.85, y: 324.69))
        tOCHIGIPath.addLine(to: CGPoint(x: 312.27, y: 323.11))
        tOCHIGIPath.addLine(to: CGPoint(x: 313.66, y: 320.38))
        tOCHIGIPath.addLine(to: CGPoint(x: 314.09, y: 318.45))
        tOCHIGIPath.addLine(to: CGPoint(x: 315.72, y: 316.08))
        tOCHIGIPath.addLine(to: CGPoint(x: 315.18, y: 315.11))
        tOCHIGIPath.addLine(to: CGPoint(x: 312.94, y: 315.11))
        tOCHIGIPath.addLine(to: CGPoint(x: 311.18, y: 313.72))
        tOCHIGIPath.addLine(to: CGPoint(x: 312.51, y: 310.56))
        tOCHIGIPath.addLine(to: CGPoint(x: 312.03, y: 309.41))
        tOCHIGIPath.addLine(to: CGPoint(x: 313.54, y: 307.29))
        tOCHIGIPath.addLine(to: CGPoint(x: 311.97, y: 306.38))
        tOCHIGIPath.addLine(to: CGPoint(x: 313.12, y: 304.38))
        tOCHIGIPath.addLine(to: CGPoint(x: 315.12, y: 302.5))
        tOCHIGIPath.addLine(to: CGPoint(x: 319, y: 300.74))
        tOCHIGIPath.addLine(to: CGPoint(x: 324.21, y: 298.01))
        tOCHIGIPath.addLine(to: CGPoint(x: 326.58, y: 296.14))
        tOCHIGIPath.addLine(to: CGPoint(x: 330.27, y: 296.08))
        tOCHIGIPath.addLine(to: CGPoint(x: 334.22, y: 297.41))
        tOCHIGIPath.addLine(to: CGPoint(x: 335.91, y: 299.9))
        tOCHIGIPath.addLine(to: CGPoint(x: 337.55, y: 300.44))
        tOCHIGIPath.addLine(to: CGPoint(x: 337.73, y: 303.59))
        tOCHIGIPath.addLine(to: CGPoint(x: 337.61, y: 305.72))
        tOCHIGIPath.close()
        strokeColor.setStroke()
        tOCHIGIPath.lineWidth = 0.5
        tOCHIGIPath.miterLimit = 4
        tOCHIGIPath.stroke()
        
        //// CHIBA Drawing
        let cHIBAPath = UIBezierPath()
        cHIBAPath.move(to: CGPoint(x: 324.21, y: 332.81))
        cHIBAPath.addLine(to: CGPoint(x: 325.12, y: 334.33))
        cHIBAPath.addLine(to: CGPoint(x: 325.91, y: 335.18))
        cHIBAPath.addLine(to: CGPoint(x: 327.18, y: 337))
        cHIBAPath.addLine(to: CGPoint(x: 328.52, y: 338.45))
        cHIBAPath.addLine(to: CGPoint(x: 330.88, y: 339.66))
        cHIBAPath.addLine(to: CGPoint(x: 334.16, y: 341.06))
        cHIBAPath.addLine(to: CGPoint(x: 334.88, y: 342.03))
        cHIBAPath.addLine(to: CGPoint(x: 336.16, y: 341.24))
        cHIBAPath.addLine(to: CGPoint(x: 337.31, y: 341.48))
        cHIBAPath.addLine(to: CGPoint(x: 338.34, y: 340.75))
        cHIBAPath.addLine(to: CGPoint(x: 339.55, y: 341.06))
        cHIBAPath.addLine(to: CGPoint(x: 340.7, y: 340.03))
        cHIBAPath.addLine(to: CGPoint(x: 342.82, y: 339.66))
        cHIBAPath.addLine(to: CGPoint(x: 343.43, y: 339.3))
        cHIBAPath.addLine(to: CGPoint(x: 344.28, y: 339.72))
        cHIBAPath.addLine(to: CGPoint(x: 345.13, y: 338.09))
        cHIBAPath.addLine(to: CGPoint(x: 346.52, y: 339.24))
        cHIBAPath.addLine(to: CGPoint(x: 348.52, y: 341.48))
        cHIBAPath.addLine(to: CGPoint(x: 350.04, y: 341.91))
        cHIBAPath.addLine(to: CGPoint(x: 350.77, y: 342.39))
        cHIBAPath.addLine(to: CGPoint(x: 351.13, y: 343.85))
        cHIBAPath.addLine(to: CGPoint(x: 353.68, y: 345.65))
        cHIBAPath.addLine(to: CGPoint(x: 354.4, y: 345.47))
        cHIBAPath.addLine(to: CGPoint(x: 355.07, y: 345.85))
        cHIBAPath.addLine(to: CGPoint(x: 354.89, y: 347.24))
        cHIBAPath.addLine(to: CGPoint(x: 354.1, y: 346.51))
        cHIBAPath.addLine(to: CGPoint(x: 351.37, y: 347.24))
        cHIBAPath.addLine(to: CGPoint(x: 350.46, y: 346.88))
        cHIBAPath.addCurve(to: CGPoint(x: 341.61, y: 359.79), controlPoint1: CGPoint(x: 350.46, y: 346.88), controlPoint2: CGPoint(x: 341.31, y: 350.27))
        cHIBAPath.addLine(to: CGPoint(x: 342.04, y: 360.28))
        cHIBAPath.addLine(to: CGPoint(x: 341.61, y: 362.7))
        cHIBAPath.addLine(to: CGPoint(x: 341.98, y: 362.82))
        cHIBAPath.addLine(to: CGPoint(x: 341.19, y: 365.43))
        cHIBAPath.addLine(to: CGPoint(x: 340.46, y: 365.31))
        cHIBAPath.addLine(to: CGPoint(x: 339.61, y: 366.76))
        cHIBAPath.addCurve(to: CGPoint(x: 339.07, y: 366.34), controlPoint1: CGPoint(x: 339.61, y: 366.76), controlPoint2: CGPoint(x: 339, y: 366.34))
        cHIBAPath.addCurve(to: CGPoint(x: 338.58, y: 366.82), controlPoint1: CGPoint(x: 339.13, y: 366.34), controlPoint2: CGPoint(x: 338.58, y: 366.82))
        cHIBAPath.addLine(to: CGPoint(x: 337.43, y: 366.82))
        cHIBAPath.addLine(to: CGPoint(x: 336.7, y: 367.67))
        cHIBAPath.addCurve(to: CGPoint(x: 332.82, y: 369.37), controlPoint1: CGPoint(x: 336.7, y: 367.67), controlPoint2: CGPoint(x: 333.37, y: 366.58))
        cHIBAPath.addCurve(to: CGPoint(x: 329.37, y: 373.13), controlPoint1: CGPoint(x: 332.82, y: 369.37), controlPoint2: CGPoint(x: 329.18, y: 370.1))
        cHIBAPath.addCurve(to: CGPoint(x: 325.36, y: 374.83), controlPoint1: CGPoint(x: 329.37, y: 373.13), controlPoint2: CGPoint(x: 329.43, y: 375.67))
        cHIBAPath.addCurve(to: CGPoint(x: 323.36, y: 372.95), controlPoint1: CGPoint(x: 325.36, y: 374.83), controlPoint2: CGPoint(x: 325.79, y: 373.43))
        cHIBAPath.addLine(to: CGPoint(x: 325.67, y: 372.16))
        cHIBAPath.addLine(to: CGPoint(x: 326.27, y: 372.16))
        cHIBAPath.addLine(to: CGPoint(x: 326.21, y: 370.94))
        cHIBAPath.addLine(to: CGPoint(x: 325.43, y: 370.52))
        cHIBAPath.addLine(to: CGPoint(x: 325.12, y: 369.31))
        cHIBAPath.addLine(to: CGPoint(x: 326.09, y: 368.58))
        cHIBAPath.addLine(to: CGPoint(x: 325.49, y: 368.16))
        cHIBAPath.addLine(to: CGPoint(x: 325.36, y: 367.55))
        cHIBAPath.addCurve(to: CGPoint(x: 325.18, y: 366.1), controlPoint1: CGPoint(x: 325.36, y: 367.55), controlPoint2: CGPoint(x: 326.27, y: 367.01))
        cHIBAPath.addCurve(to: CGPoint(x: 326.7, y: 364.03), controlPoint1: CGPoint(x: 325.18, y: 366.1), controlPoint2: CGPoint(x: 324.76, y: 363.91))
        cHIBAPath.addCurve(to: CGPoint(x: 324.45, y: 360.64), controlPoint1: CGPoint(x: 326.7, y: 364.03), controlPoint2: CGPoint(x: 326.52, y: 361.06))
        cHIBAPath.addCurve(to: CGPoint(x: 325.67, y: 359.79), controlPoint1: CGPoint(x: 324.45, y: 360.64), controlPoint2: CGPoint(x: 325.73, y: 359.79))
        cHIBAPath.addCurve(to: CGPoint(x: 325.79, y: 358.52), controlPoint1: CGPoint(x: 325.61, y: 359.79), controlPoint2: CGPoint(x: 325.79, y: 358.52))
        cHIBAPath.addCurve(to: CGPoint(x: 327.18, y: 358.88), controlPoint1: CGPoint(x: 325.79, y: 358.52), controlPoint2: CGPoint(x: 327.18, y: 358.82))
        cHIBAPath.addCurve(to: CGPoint(x: 327.91, y: 358.21), controlPoint1: CGPoint(x: 327.18, y: 358.94), controlPoint2: CGPoint(x: 327.91, y: 358.21))
        cHIBAPath.addLine(to: CGPoint(x: 327.36, y: 356.76))
        cHIBAPath.addCurve(to: CGPoint(x: 331.91, y: 352.76), controlPoint1: CGPoint(x: 327.36, y: 356.76), controlPoint2: CGPoint(x: 331.49, y: 355.06))
        cHIBAPath.addCurve(to: CGPoint(x: 332.4, y: 350.39), controlPoint1: CGPoint(x: 331.91, y: 352.76), controlPoint2: CGPoint(x: 333.85, y: 352.21))
        cHIBAPath.addCurve(to: CGPoint(x: 330.76, y: 348.57), controlPoint1: CGPoint(x: 332.4, y: 350.39), controlPoint2: CGPoint(x: 330.76, y: 348.51))
        cHIBAPath.addCurve(to: CGPoint(x: 328.82, y: 348.21), controlPoint1: CGPoint(x: 330.76, y: 348.64), controlPoint2: CGPoint(x: 328.82, y: 348.21))
        cHIBAPath.addCurve(to: CGPoint(x: 328.09, y: 348.51), controlPoint1: CGPoint(x: 328.82, y: 348.21), controlPoint2: CGPoint(x: 328.03, y: 348.45))
        cHIBAPath.addCurve(to: CGPoint(x: 328.52, y: 349.18), controlPoint1: CGPoint(x: 328.15, y: 348.57), controlPoint2: CGPoint(x: 328.52, y: 349.18))
        cHIBAPath.addLine(to: CGPoint(x: 327.55, y: 349.91))
        cHIBAPath.addLine(to: CGPoint(x: 326.71, y: 349.33))
        cHIBAPath.addLine(to: CGPoint(x: 327.17, y: 348.81))
        cHIBAPath.addLine(to: CGPoint(x: 327.17, y: 347.67))
        cHIBAPath.addLine(to: CGPoint(x: 327.83, y: 347.65))
        cHIBAPath.addLine(to: CGPoint(x: 328.14, y: 347.04))
        cHIBAPath.addLine(to: CGPoint(x: 327.44, y: 346.08))
        cHIBAPath.addLine(to: CGPoint(x: 327.6, y: 345.55))
        cHIBAPath.addLine(to: CGPoint(x: 327.03, y: 344.96))
        cHIBAPath.addLine(to: CGPoint(x: 327.26, y: 344.2))
        cHIBAPath.addLine(to: CGPoint(x: 327.18, y: 342.07))
        cHIBAPath.addLine(to: CGPoint(x: 327.63, y: 341.19))
        cHIBAPath.addLine(to: CGPoint(x: 326.73, y: 339.29))
        cHIBAPath.addLine(to: CGPoint(x: 325.59, y: 337.85))
        cHIBAPath.addLine(to: CGPoint(x: 325.08, y: 336.6))
        cHIBAPath.addLine(to: CGPoint(x: 325.11, y: 335.44))
        cHIBAPath.addLine(to: CGPoint(x: 323.99, y: 333.65))
        cHIBAPath.addLine(to: CGPoint(x: 324.21, y: 332.81))
        cHIBAPath.close()
        strokeColor.setStroke()
        cHIBAPath.lineWidth = 0.5
        cHIBAPath.miterLimit = 4
        cHIBAPath.stroke()
        
        //// IBARAKI Drawing
        let iBARAKIPath = UIBezierPath()
        iBARAKIPath.move(to: CGPoint(x: 353.25, y: 307.29))
        iBARAKIPath.addLine(to: CGPoint(x: 352.4, y: 307.41))
        iBARAKIPath.addCurve(to: CGPoint(x: 350.64, y: 313.23), controlPoint1: CGPoint(x: 352.4, y: 307.41), controlPoint2: CGPoint(x: 350.64, y: 311.29))
        iBARAKIPath.addCurve(to: CGPoint(x: 348.16, y: 323.29), controlPoint1: CGPoint(x: 350.64, y: 313.23), controlPoint2: CGPoint(x: 346.52, y: 319.78))
        iBARAKIPath.addLine(to: CGPoint(x: 347.07, y: 325.6))
        iBARAKIPath.addLine(to: CGPoint(x: 346.4, y: 325.72))
        iBARAKIPath.addCurve(to: CGPoint(x: 353.55, y: 344.33), controlPoint1: CGPoint(x: 346.4, y: 325.72), controlPoint2: CGPoint(x: 345.37, y: 332.63))
        iBARAKIPath.addLine(to: CGPoint(x: 354.4, y: 345.47))
        iBARAKIPath.addLine(to: CGPoint(x: 353.55, y: 345.6))
        iBARAKIPath.addLine(to: CGPoint(x: 351.13, y: 343.85))
        iBARAKIPath.addLine(to: CGPoint(x: 350.77, y: 342.39))
        iBARAKIPath.addLine(to: CGPoint(x: 350.04, y: 341.91))
        iBARAKIPath.addLine(to: CGPoint(x: 348.52, y: 341.48))
        iBARAKIPath.addLine(to: CGPoint(x: 346.52, y: 339.24))
        iBARAKIPath.addLine(to: CGPoint(x: 345.13, y: 338.09))
        iBARAKIPath.addLine(to: CGPoint(x: 344.28, y: 339.72))
        iBARAKIPath.addLine(to: CGPoint(x: 343.43, y: 339.3))
        iBARAKIPath.addLine(to: CGPoint(x: 342.82, y: 339.66))
        iBARAKIPath.addLine(to: CGPoint(x: 340.7, y: 340.03))
        iBARAKIPath.addLine(to: CGPoint(x: 339.55, y: 341.06))
        iBARAKIPath.addLine(to: CGPoint(x: 338.34, y: 340.75))
        iBARAKIPath.addLine(to: CGPoint(x: 337.31, y: 341.48))
        iBARAKIPath.addLine(to: CGPoint(x: 336.16, y: 341.24))
        iBARAKIPath.addLine(to: CGPoint(x: 334.88, y: 342.03))
        iBARAKIPath.addLine(to: CGPoint(x: 334.16, y: 341.06))
        iBARAKIPath.addLine(to: CGPoint(x: 330.88, y: 339.66))
        iBARAKIPath.addLine(to: CGPoint(x: 328.52, y: 338.45))
        iBARAKIPath.addLine(to: CGPoint(x: 327.18, y: 337))
        iBARAKIPath.addLine(to: CGPoint(x: 325.91, y: 335.18))
        iBARAKIPath.addLine(to: CGPoint(x: 325.12, y: 334.33))
        iBARAKIPath.addLine(to: CGPoint(x: 324.21, y: 332.81))
        iBARAKIPath.addLine(to: CGPoint(x: 323.99, y: 333.65))
        iBARAKIPath.addLine(to: CGPoint(x: 322.72, y: 333.55))
        iBARAKIPath.addLine(to: CGPoint(x: 322.61, y: 332.56))
        iBARAKIPath.addLine(to: CGPoint(x: 321.58, y: 330.86))
        iBARAKIPath.addLine(to: CGPoint(x: 321.53, y: 330.21))
        iBARAKIPath.addLine(to: CGPoint(x: 321.78, y: 330.1))
        iBARAKIPath.addLine(to: CGPoint(x: 321.56, y: 329.37))
        iBARAKIPath.addLine(to: CGPoint(x: 322.94, y: 329.36))
        iBARAKIPath.addLine(to: CGPoint(x: 325.3, y: 328.09))
        iBARAKIPath.addLine(to: CGPoint(x: 325.79, y: 325.96))
        iBARAKIPath.addLine(to: CGPoint(x: 326.64, y: 325.3))
        iBARAKIPath.addLine(to: CGPoint(x: 327.79, y: 325.78))
        iBARAKIPath.addLine(to: CGPoint(x: 328.09, y: 324.75))
        iBARAKIPath.addLine(to: CGPoint(x: 329.25, y: 324.14))
        iBARAKIPath.addLine(to: CGPoint(x: 329.49, y: 323.29))
        iBARAKIPath.addLine(to: CGPoint(x: 332.09, y: 323.17))
        iBARAKIPath.addLine(to: CGPoint(x: 332.28, y: 322.08))
        iBARAKIPath.addLine(to: CGPoint(x: 333.18, y: 322.45))
        iBARAKIPath.addLine(to: CGPoint(x: 334.28, y: 321.78))
        iBARAKIPath.addLine(to: CGPoint(x: 335.49, y: 322.51))
        iBARAKIPath.addLine(to: CGPoint(x: 336.16, y: 320.63))
        iBARAKIPath.addLine(to: CGPoint(x: 337.43, y: 318.08))
        iBARAKIPath.addLine(to: CGPoint(x: 337.25, y: 314.69))
        iBARAKIPath.addLine(to: CGPoint(x: 336.64, y: 312.2))
        iBARAKIPath.addLine(to: CGPoint(x: 338.64, y: 311.41))
        iBARAKIPath.addLine(to: CGPoint(x: 337.73, y: 309.84))
        iBARAKIPath.addLine(to: CGPoint(x: 337.79, y: 306.99))
        iBARAKIPath.addLine(to: CGPoint(x: 337.61, y: 305.72))
        iBARAKIPath.addLine(to: CGPoint(x: 337.73, y: 303.59))
        iBARAKIPath.addLine(to: CGPoint(x: 338.82, y: 303.71))
        iBARAKIPath.addLine(to: CGPoint(x: 339.67, y: 305.05))
        iBARAKIPath.addLine(to: CGPoint(x: 340.94, y: 305.41))
        iBARAKIPath.addLine(to: CGPoint(x: 341, y: 306.99))
        iBARAKIPath.addLine(to: CGPoint(x: 343.73, y: 308.32))
        iBARAKIPath.addLine(to: CGPoint(x: 345.61, y: 306.26))
        iBARAKIPath.addLine(to: CGPoint(x: 347.19, y: 305.9))
        iBARAKIPath.addLine(to: CGPoint(x: 346.46, y: 303.96))
        iBARAKIPath.addLine(to: CGPoint(x: 347.07, y: 303.35))
        iBARAKIPath.addLine(to: CGPoint(x: 348.22, y: 304.74))
        iBARAKIPath.addLine(to: CGPoint(x: 352.89, y: 306.14))
        iBARAKIPath.addLine(to: CGPoint(x: 353.25, y: 307.29))
        iBARAKIPath.close()
        iBARAKIPath.move(to: CGPoint(x: 336.26, y: 333.87))
        iBARAKIPath.addLine(to: CGPoint(x: 336.72, y: 334.74))
        iBARAKIPath.addLine(to: CGPoint(x: 338.94, y: 335.51))
        iBARAKIPath.addLine(to: CGPoint(x: 340.04, y: 335.47))
        iBARAKIPath.addLine(to: CGPoint(x: 340.9, y: 336.28))
        iBARAKIPath.addLine(to: CGPoint(x: 340.4, y: 337.06))
        iBARAKIPath.addLine(to: CGPoint(x: 341.95, y: 336.97))
        iBARAKIPath.addLine(to: CGPoint(x: 342.9, y: 337.28))
        iBARAKIPath.addLine(to: CGPoint(x: 343.9, y: 338.19))
        iBARAKIPath.addLine(to: CGPoint(x: 344.45, y: 338.06))
        iBARAKIPath.addLine(to: CGPoint(x: 344.35, y: 337.47))
        iBARAKIPath.addLine(to: CGPoint(x: 342.08, y: 333.6))
        iBARAKIPath.addLine(to: CGPoint(x: 341.72, y: 333.15))
        iBARAKIPath.addLine(to: CGPoint(x: 341.58, y: 332.33))
        iBARAKIPath.addLine(to: CGPoint(x: 340.9, y: 331.28))
        iBARAKIPath.addLine(to: CGPoint(x: 339.31, y: 331.01))
        iBARAKIPath.addLine(to: CGPoint(x: 339.94, y: 332.19))
        iBARAKIPath.addLine(to: CGPoint(x: 341.17, y: 333.06))
        iBARAKIPath.addLine(to: CGPoint(x: 341.35, y: 333.69))
        iBARAKIPath.addLine(to: CGPoint(x: 340.85, y: 334.33))
        iBARAKIPath.addLine(to: CGPoint(x: 338.03, y: 334.19))
        iBARAKIPath.addLine(to: CGPoint(x: 337.4, y: 334.15))
        iBARAKIPath.addLine(to: CGPoint(x: 337.08, y: 333.65))
        iBARAKIPath.addLine(to: CGPoint(x: 336.26, y: 333.87))
        iBARAKIPath.close()
        iBARAKIPath.move(to: CGPoint(x: 346.08, y: 335.06))
        iBARAKIPath.addLine(to: CGPoint(x: 345.76, y: 335.37))
        iBARAKIPath.addLine(to: CGPoint(x: 346.22, y: 335.6))
        iBARAKIPath.addLine(to: CGPoint(x: 345.76, y: 336.19))
        iBARAKIPath.addLine(to: CGPoint(x: 346.81, y: 336.92))
        iBARAKIPath.addLine(to: CGPoint(x: 346.86, y: 337.74))
        iBARAKIPath.addLine(to: CGPoint(x: 347.86, y: 339.19))
        iBARAKIPath.addLine(to: CGPoint(x: 347.04, y: 339.1))
        iBARAKIPath.addLine(to: CGPoint(x: 346.95, y: 339.42))
        iBARAKIPath.addLine(to: CGPoint(x: 347.95, y: 340.52))
        iBARAKIPath.addLine(to: CGPoint(x: 347.98, y: 339.43))
        iBARAKIPath.addLine(to: CGPoint(x: 348.36, y: 338.65))
        iBARAKIPath.addLine(to: CGPoint(x: 347.86, y: 338.06))
        iBARAKIPath.addLine(to: CGPoint(x: 347.36, y: 336.78))
        iBARAKIPath.addLine(to: CGPoint(x: 346.58, y: 334.42))
        iBARAKIPath.addLine(to: CGPoint(x: 345.86, y: 333.87))
        iBARAKIPath.addLine(to: CGPoint(x: 345.58, y: 332.28))
        iBARAKIPath.addLine(to: CGPoint(x: 344.85, y: 331.6))
        iBARAKIPath.addLine(to: CGPoint(x: 345.26, y: 332.56))
        iBARAKIPath.addLine(to: CGPoint(x: 345.49, y: 334.33))
        iBARAKIPath.addLine(to: CGPoint(x: 346.08, y: 335.06))
        iBARAKIPath.close()
        strokeColor.setStroke()
        iBARAKIPath.lineWidth = 0.5
        iBARAKIPath.miterLimit = 4
        iBARAKIPath.stroke()
        
        context.restoreGState()
        
        context.restoreGState()
    }
    
    @objc(KantoResizingBehavior)
    public enum ResizingBehavior: Int {
        case aspectFit /// The content is proportionally resized to fit into the target rectangle.
        case aspectFill /// The content is proportionally resized to completely fill the target rectangle.
        case stretch /// The content is stretched to match the entire target rectangle.
        case center /// The content is centered in the target rectangle, but it is NOT resized.
        
        public func apply(rect: CGRect, target: CGRect) -> CGRect {
            if rect == target || target == CGRect.zero {
                return rect
            }
            
            var scales = CGSize.zero
            scales.width = abs(target.width / rect.width)
            scales.height = abs(target.height / rect.height)
            
            switch self {
            case .aspectFit:
                scales.width = min(scales.width, scales.height)
                scales.height = scales.width
            case .aspectFill:
                scales.width = max(scales.width, scales.height)
                scales.height = scales.width
            case .stretch:
                break
            case .center:
                scales.width = 1
                scales.height = 1
            }
            
            var result = rect.standardized
            result.size.width *= scales.width
            result.size.height *= scales.height
            result.origin.x = target.minX + (target.width - result.width) / 2
            result.origin.y = target.minY + (target.height - result.height) / 2
            return result
        }
    }
}
