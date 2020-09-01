//
//  KinkiMapView.swift
//  covid-19-graph
//

import Foundation
import UIKit

final class KinkiMapView: DrawMapView {
    private var mieColor = R.color.dangerColor7()!
    private var shigaColor = R.color.dangerColor7()!
    private var naraColor = R.color.dangerColor7()!
    private var wakayamaColor = R.color.dangerColor7()!
    private var osakaColor = R.color.dangerColor7()!
    private var kyotoColor = R.color.dangerColor7()!
    private var hyogoColor = R.color.dangerColor7()!

    override func draw(_ rect: CGRect) {
        originalWidth = 230
        originalHeight = 230
        super.draw(rect)

        context?.saveGState()
        context?.translateBy(x: -294.38, y: -651.69)
        context?.scaleBy(x: 2, y: 2)

        mieColor.setFill()
        Kinki.mie.path.fill()
        drawPath(path: Kinki.mie.path)

        shigaColor.setFill()
        Kinki.shiga.path.fill()
        drawPath(path: Kinki.shiga.path)

        naraColor.setFill()
        Kinki.nara.path.fill()
        drawPath(path: Kinki.nara.path)

        wakayamaColor.setFill()
        Kinki.wakayama.path.fill()
        drawPath(path: Kinki.wakayama.path)

        osakaColor.setFill()
        Kinki.osaka.path.fill()
        drawPath(path: Kinki.osaka.path)

        kyotoColor.setFill()
        Kinki.kyoto.path.fill()
        drawPath(path: Kinki.kyoto.path)

        hyogoColor.setFill()
        Kinki.hyogo.path.fill()
        drawPath(path: Kinki.hyogo.path)

        context?.restoreGState()
    }
}
