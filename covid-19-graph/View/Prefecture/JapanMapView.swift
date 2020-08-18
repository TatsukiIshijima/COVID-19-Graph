//
//  JapanMapView.swift
//  covid-19-graph
//

import Foundation
import UIKit

@IBDesignable class JapanMapView: UIView {
    let originalWidth: CGFloat = 560
    let originalHeight: CGFloat = 700
    private let defaultStrokeColor = UIColor(red: 0.000, green: 0.000, blue: 0.000, alpha: 1.000)
    private let defaultFillColor: UIColor = R.color.dangerColor7() ?? .lightGray
    private let defaultLineWidth: CGFloat = 0.5
    private let defaultMiterLimit: CGFloat = 4

    private var hokkaidoColor: UIColor = R.color.dangerColor7() ?? .lightGray
    private var aomoriColor: UIColor = R.color.dangerColor7() ?? .lightGray
    private var akitaColor: UIColor = R.color.dangerColor7() ?? .lightGray
    private var iwateColor: UIColor = R.color.dangerColor7() ?? .lightGray
    private var yamagataColor: UIColor = R.color.dangerColor7() ?? .lightGray
    private var miyagiColor: UIColor = R.color.dangerColor7() ?? .lightGray
    private var fukushimaColor: UIColor = R.color.dangerColor7() ?? .lightGray
    private var ibarakiColor: UIColor = R.color.dangerColor7() ?? .lightGray
    private var chibaColor: UIColor = R.color.dangerColor7() ?? .lightGray
    private var tochigiColor: UIColor = R.color.dangerColor7() ?? .lightGray
    private var gunmaColor: UIColor = R.color.dangerColor7() ?? .lightGray
    private var saitamaColor: UIColor = R.color.dangerColor7() ?? .lightGray
    private var tokyoColor: UIColor = R.color.dangerColor7() ?? .lightGray
    private var kanagawaColor: UIColor = R.color.dangerColor7() ?? .lightGray
    private var yamanashiColor: UIColor = R.color.dangerColor7() ?? .lightGray
    private var nigataColor: UIColor = R.color.dangerColor7() ?? .lightGray
    private var shizuokaColor: UIColor = R.color.dangerColor7() ?? .lightGray
    private var naganoColor: UIColor = R.color.dangerColor7() ?? .lightGray
    private var aichiColor: UIColor = R.color.dangerColor7() ?? .lightGray
    private var gifuColor: UIColor = R.color.dangerColor7() ?? .lightGray
    private var toyamaColor: UIColor = R.color.dangerColor7() ?? .lightGray
    private var ishikawaColor: UIColor = R.color.dangerColor7() ?? .lightGray
    private var fukuiColor: UIColor = R.color.dangerColor7() ?? .lightGray
    private var mieColor: UIColor = R.color.dangerColor7() ?? .lightGray
    private var shigaColor: UIColor = R.color.dangerColor7() ?? .lightGray
    private var naraColor: UIColor = R.color.dangerColor7() ?? .lightGray
    private var wakayamaColor: UIColor = R.color.dangerColor7() ?? .lightGray
    private var osakaColor: UIColor = R.color.dangerColor7() ?? .lightGray
    private var kyotoColor: UIColor = R.color.dangerColor7() ?? .lightGray
    private var hyogoColor: UIColor = R.color.dangerColor7() ?? .lightGray
    private var shimaneColor: UIColor = R.color.dangerColor7() ?? .lightGray
    private var tottoriColor: UIColor = R.color.dangerColor7() ?? .lightGray
    private var okayamaColor: UIColor = R.color.dangerColor7() ?? .lightGray
    private var hiroshimaColor: UIColor = R.color.dangerColor7() ?? .lightGray
    private var yamaguchiColor: UIColor = R.color.dangerColor7() ?? .lightGray
    private var kagawaColor: UIColor = R.color.dangerColor7() ?? .lightGray
    private var tokushimaColor: UIColor = R.color.dangerColor7() ?? .lightGray
    private var kochiColor: UIColor = R.color.dangerColor7() ?? .lightGray
    private var ehimeColor: UIColor = R.color.dangerColor7() ?? .lightGray
    private var oitaColor: UIColor = R.color.dangerColor7() ?? .lightGray
    private var miyazakiColor: UIColor = R.color.dangerColor7() ?? .lightGray
    private var kagoshimaColor: UIColor = R.color.dangerColor7() ?? .lightGray
    private var kumamotoColor: UIColor = R.color.dangerColor7() ?? .lightGray
    private var sagaColor: UIColor = R.color.dangerColor7() ?? .lightGray
    private var fukuokaColor: UIColor = R.color.dangerColor7() ?? .lightGray
    private var nagasakiColor: UIColor = R.color.dangerColor7() ?? .lightGray
    private var okinawaColor: UIColor = R.color.dangerColor7() ?? .lightGray

    override func draw(_ rect: CGRect) {
        let context = UIGraphicsGetCurrentContext()
        guard let currentContext = context else {
            return
        }
        currentContext.saveGState()

        let resizingBehavior: ResizingBehavior = .aspectFit
        let resizingFrame: CGRect = resizingBehavior.apply(rect: CGRect(x: 0, y: 0, width: originalWidth, height: originalHeight), target: rect)
        currentContext.translateBy(x: resizingFrame.minX, y: resizingFrame.minY)
        currentContext.scaleBy(x: resizingFrame.width / originalWidth, y: resizingFrame.height / originalHeight)

        defaultStrokeColor.setStroke()
        defaultFillColor.setFill()

        setHokkaido()
        setTohoku()
        setKanto()
        setChubu()
        setKinki()
        setChugoku()
        setShikoku()
        setKyushu()

        currentContext.restoreGState()
    }

    private func drawPrefecturePath(prefecture: Prefecture) {
        prefecture.path.lineWidth = defaultLineWidth
        prefecture.path.miterLimit = defaultMiterLimit
        prefecture.path.stroke()
        prefecture.path.fill()
    }

    private func setHokkaido() {
        hokkaidoColor.setFill()
        Prefecture.hokkaido.path.fill()
        drawPrefecturePath(prefecture: .hokkaido)
    }

    private func setTohoku() {
        aomoriColor.setFill()
        Prefecture.aomori.path.fill()
        drawPrefecturePath(prefecture: .aomori)

        akitaColor.setFill()
        Prefecture.akita.path.fill()
        drawPrefecturePath(prefecture: .akita)

        iwateColor.setFill()
        Prefecture.iwate.path.fill()
        drawPrefecturePath(prefecture: .iwate)

        yamagataColor.setFill()
        Prefecture.yamagata.path.fill()
        drawPrefecturePath(prefecture: .yamagata)

        miyagiColor.setFill()
        Prefecture.miyagi.path.fill()
        drawPrefecturePath(prefecture: .miyagi)

        fukushimaColor.setFill()
        Prefecture.fukushima.path.fill()
        drawPrefecturePath(prefecture: .fukushima)
    }

    private func setKanto() {
        ibarakiColor.setFill()
        Prefecture.ibaraki.path.fill()
        drawPrefecturePath(prefecture: .ibaraki)

        chibaColor.setFill()
        Prefecture.chiba.path.fill()
        drawPrefecturePath(prefecture: Prefecture.chiba)

        tochigiColor.setFill()
        Prefecture.tochigi.path.fill()
        drawPrefecturePath(prefecture: Prefecture.tochigi)

        gunmaColor.setFill()
        Prefecture.gunma.path.fill()
        drawPrefecturePath(prefecture: Prefecture.gunma)

        saitamaColor.setFill()
        Prefecture.saitama.path.fill()
        drawPrefecturePath(prefecture: Prefecture.saitama)

        // drawPrefecturePath(prefecture: Prefecture.ogasawara)

        tokyoColor.setFill()
        Prefecture.tokyo.path.fill()
        drawPrefecturePath(prefecture: Prefecture.tokyo)

        kanagawaColor.setFill()
        Prefecture.kanagawa.path.fill()
        drawPrefecturePath(prefecture: Prefecture.kanagawa)
    }

    private func setChubu() {
        yamanashiColor.setFill()
        Prefecture.yamanashi.path.fill()
        drawPrefecturePath(prefecture: .yamanashi)

        nigataColor.setFill()
        Prefecture.niigata.path.fill()
        drawPrefecturePath(prefecture: .niigata)

        shizuokaColor.setFill()
        Prefecture.shizuoka.path.fill()
        drawPrefecturePath(prefecture: .shizuoka)

        naganoColor.setFill()
        Prefecture.nagano.path.fill()
        drawPrefecturePath(prefecture: .nagano)

        aichiColor.setFill()
        Prefecture.aichi.path.fill()
        drawPrefecturePath(prefecture: .aichi)

        gifuColor.setFill()
        Prefecture.gufu.path.fill()
        drawPrefecturePath(prefecture: .gufu)

        toyamaColor.setFill()
        Prefecture.toyama.path.fill()
        drawPrefecturePath(prefecture: .toyama)

        ishikawaColor.setFill()
        Prefecture.ishikawa.path.fill()
        drawPrefecturePath(prefecture: .ishikawa)

        fukuiColor.setFill()
        Prefecture.fukui.path.fill()
        drawPrefecturePath(prefecture: .fukui)
    }

    private func setKinki() {
        mieColor.setFill()
        Prefecture.mie.path.fill()
        drawPrefecturePath(prefecture: Prefecture.mie)

        shigaColor.setFill()
        Prefecture.shiga.path.fill()
        drawPrefecturePath(prefecture: Prefecture.shiga)

        naraColor.setFill()
        Prefecture.nara.path.fill()
        drawPrefecturePath(prefecture: Prefecture.nara)

        wakayamaColor.setFill()
        Prefecture.wakayama.path.fill()
        drawPrefecturePath(prefecture: Prefecture.wakayama)

        osakaColor.setFill()
        Prefecture.osaka.path.fill()
        drawPrefecturePath(prefecture: Prefecture.osaka)

        kyotoColor.setFill()
        Prefecture.kyoto.path.fill()
        drawPrefecturePath(prefecture: Prefecture.kyoto)

        hyogoColor.setFill()
        Prefecture.hyogo.path.fill()
        drawPrefecturePath(prefecture: Prefecture.hyogo)
    }

    private func setChugoku() {
        shimaneColor.setFill()
        Prefecture.shimane.path.fill()
        drawPrefecturePath(prefecture: Prefecture.shimane)

        tottoriColor.setFill()
        Prefecture.tottori.path.fill()
        drawPrefecturePath(prefecture: Prefecture.tottori)

        okayamaColor.setFill()
        Prefecture.okayama.path.fill()
        drawPrefecturePath(prefecture: Prefecture.okayama)

        hiroshimaColor.setFill()
        Prefecture.hiroshima.path.fill()
        drawPrefecturePath(prefecture: Prefecture.hiroshima)

        yamaguchiColor.setFill()
        Prefecture.yamaguchi.path.fill()
        drawPrefecturePath(prefecture: Prefecture.yamaguchi)
    }

    private func setShikoku() {
        kagawaColor.setFill()
        Prefecture.kagawa.path.fill()
        drawPrefecturePath(prefecture: Prefecture.kagawa)

        tokushimaColor.setFill()
        Prefecture.tokushima.path.fill()
        drawPrefecturePath(prefecture: Prefecture.tokushima)

        kochiColor.setFill()
        Prefecture.kochi.path.fill()
        drawPrefecturePath(prefecture: Prefecture.kochi)

        ehimeColor.setFill()
        Prefecture.ehime.path.fill()
        drawPrefecturePath(prefecture: Prefecture.ehime)
    }

    private func setKyushu() {
        oitaColor.setFill()
        Prefecture.oita.path.fill()
        drawPrefecturePath(prefecture: Prefecture.oita)

        miyagiColor.setFill()
        Prefecture.miyazaki.path.fill()
        drawPrefecturePath(prefecture: Prefecture.miyazaki)

        kagoshimaColor.setFill()
        Prefecture.kagoshima.path.fill()
        drawPrefecturePath(prefecture: Prefecture.kagoshima)

        kumamotoColor.setFill()
        Prefecture.kumamoto.path.fill()
        drawPrefecturePath(prefecture: Prefecture.kumamoto)

        sagaColor.setFill()
        Prefecture.saga.path.fill()
        drawPrefecturePath(prefecture: Prefecture.saga)

        fukuokaColor.setFill()
        Prefecture.fukuoka.path.fill()
        drawPrefecturePath(prefecture: Prefecture.fukuoka)

        nagasakiColor.setFill()
        Prefecture.nagasaki.path.fill()
        drawPrefecturePath(prefecture: Prefecture.nagasaki)

        okinawaColor.setFill()
        Prefecture.okinawa.path.fill()
        drawPrefecturePath(prefecture: Prefecture.okinawa)
    }

    func reDraw(hokkaidoColor: UIColor = R.color.dangerColor7() ?? .lightGray,
                aomoriColor: UIColor = R.color.dangerColor7() ?? .lightGray,
                akitaColor: UIColor = R.color.dangerColor7() ?? .lightGray,
                iwateColor: UIColor = R.color.dangerColor7() ?? .lightGray,
                yamagataColor: UIColor = R.color.dangerColor7() ?? .lightGray,
                miyagiColor: UIColor = R.color.dangerColor7() ?? .lightGray,
                fukushimaColor: UIColor = R.color.dangerColor7() ?? .lightGray,
                ibarakiColor: UIColor = R.color.dangerColor7() ?? .lightGray,
                chibaColor: UIColor = R.color.dangerColor7() ?? .lightGray,
                tochigiColor: UIColor = R.color.dangerColor7() ?? .lightGray,
                gunmaColor: UIColor = R.color.dangerColor7() ?? .lightGray,
                saitamaColor: UIColor = R.color.dangerColor7() ?? .lightGray,
                tokyoColor: UIColor = R.color.dangerColor7() ?? .lightGray,
                kanagawaColor: UIColor = R.color.dangerColor7() ?? .lightGray,
                yamanashiColor: UIColor = R.color.dangerColor7() ?? .lightGray,
                nigataColor: UIColor = R.color.dangerColor7() ?? .lightGray,
                shizuokaColor: UIColor = R.color.dangerColor7() ?? .lightGray,
                naganoColor: UIColor = R.color.dangerColor7() ?? .lightGray,
                aichiColor: UIColor = R.color.dangerColor7() ?? .lightGray,
                gifuColor: UIColor = R.color.dangerColor7() ?? .lightGray,
                toyamaColor: UIColor = R.color.dangerColor7() ?? .lightGray,
                ishikawaColor: UIColor = R.color.dangerColor7() ?? .lightGray,
                fukuiColor: UIColor = R.color.dangerColor7() ?? .lightGray,
                mieColor: UIColor = R.color.dangerColor7() ?? .lightGray,
                shigaColor: UIColor = R.color.dangerColor7() ?? .lightGray,
                naraColor: UIColor = R.color.dangerColor7() ?? .lightGray,
                wakayamaColor: UIColor = R.color.dangerColor7() ?? .lightGray,
                osakaColor: UIColor = R.color.dangerColor7() ?? .lightGray,
                kyotoColor: UIColor = R.color.dangerColor7() ?? .lightGray,
                hyogoColor: UIColor = R.color.dangerColor7() ?? .lightGray,
                shimaneColor: UIColor = R.color.dangerColor7() ?? .lightGray,
                tottoriColor: UIColor = R.color.dangerColor7() ?? .lightGray,
                okayamaColor: UIColor = R.color.dangerColor7() ?? .lightGray,
                hiroshimaColor: UIColor = R.color.dangerColor7() ?? .lightGray,
                yamaguchiColor: UIColor = R.color.dangerColor7() ?? .lightGray,
                kagawaColor: UIColor = R.color.dangerColor7() ?? .lightGray,
                tokushimaColor: UIColor = R.color.dangerColor7() ?? .lightGray,
                kochiColor: UIColor = R.color.dangerColor7() ?? .lightGray,
                ehimeColor: UIColor = R.color.dangerColor7() ?? .lightGray,
                oitaColor: UIColor = R.color.dangerColor7() ?? .lightGray,
                miyazakiColor: UIColor = R.color.dangerColor7() ?? .lightGray,
                kagoshimaColor: UIColor = R.color.dangerColor7() ?? .lightGray,
                kumamotoColor: UIColor = R.color.dangerColor7() ?? .lightGray,
                fukuokaColor: UIColor = R.color.dangerColor7() ?? .lightGray,
                sagaColor: UIColor = R.color.dangerColor7() ?? .lightGray,
                nagasakiColor: UIColor = R.color.dangerColor7() ?? .lightGray,
                okinawaColor: UIColor = R.color.dangerColor7() ?? .lightGray) {
        self.hokkaidoColor = hokkaidoColor
        self.aomoriColor = aomoriColor
        self.akitaColor = akitaColor
        self.iwateColor = iwateColor
        self.yamagataColor = yamagataColor
        self.miyagiColor = miyagiColor
        self.fukushimaColor = fukushimaColor
        self.ibarakiColor = ibarakiColor
        self.chibaColor = chibaColor
        self.tochigiColor = tochigiColor
        self.gunmaColor = gunmaColor
        self.saitamaColor = saitamaColor
        self.tokyoColor = tokyoColor
        self.kanagawaColor = kanagawaColor
        self.yamanashiColor = yamanashiColor
        self.nigataColor = nigataColor
        self.shizuokaColor = shizuokaColor
        self.naganoColor = naganoColor
        self.aichiColor = aichiColor
        self.gifuColor = gifuColor
        self.toyamaColor = toyamaColor
        self.ishikawaColor = ishikawaColor
        self.fukuiColor = fukuiColor
        self.mieColor = mieColor
        self.shigaColor = shigaColor
        self.naraColor = naraColor
        self.wakayamaColor = wakayamaColor
        self.osakaColor = osakaColor
        self.kyotoColor = kyotoColor
        self.hyogoColor = hyogoColor
        self.shimaneColor = shimaneColor
        self.tottoriColor = tottoriColor
        self.okayamaColor = okayamaColor
        self.hiroshimaColor = hiroshimaColor
        self.yamaguchiColor = yamaguchiColor
        self.kagawaColor = kagawaColor
        self.tokushimaColor = tokushimaColor
        self.kochiColor = kochiColor
        self.ehimeColor = ehimeColor
        self.oitaColor = oitaColor
        self.miyazakiColor = miyazakiColor
        self.kagoshimaColor = kagoshimaColor
        self.kumamotoColor = kumamotoColor
        self.sagaColor = sagaColor
        self.fukuokaColor = fukuokaColor
        self.nagasakiColor = nagasakiColor
        self.okinawaColor = okinawaColor
        // 以下で再度drawを呼び出す
        setNeedsDisplay()
    }

    enum ResizingBehavior: Int {
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
