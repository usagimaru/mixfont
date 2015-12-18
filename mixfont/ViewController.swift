//
//  ViewController.swift
//  mixfont
//
//  Created by M.Satori on 15.12.18.
//  Copyright © 2015 usagimaru. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
	@IBOutlet weak var label: UILabel!

	override func viewDidLoad() {
		super.viewDidLoad()
		
		let text = "　これは日本語文章と English Text の混合文章です。通常、PostScript 名指定の UIFont では単一の、システムフォントとしての UIFont では2種類のフォントを組み合わせた合成フォントが適用されますが、ここでは UIFontDescriptor を用いてフォントをカスタマイズしています。\n　主に外国語設定の iOS において、Japanese よりも Chinese の方が優先されることから日本語文章が中華フォントに「化けて」しまう仕様がありますが、このカスタマイズにより外国語設定であっても正しくヒラギノ角ゴシックと San Fransisco / Helvetica Neue の合成フォントを適用することができるようになります。これで外国人にも美しいヒラギノ書体で日本語を読んでもらうことができます。\n\nあのイーハトーヴォの\nすきとおった風、\n夏でも底に冷たさをもつ青いそら、\nうつくしい森で飾られたモーリオ市、\n郊外のぎらぎらひかる草の波。\n祇辻飴葛蛸鯖鰯噌庖箸\n底辺直卿蝕薩化\nABCDEFGHIJKLM\nabcdefghijklm\n1234567890"
		let fontSize: CGFloat = 14.0
		
		let systemFont = UIFont.systemFontOfSize(fontSize) // Font A
		let systemFontDescriptor: UIFontDescriptor = systemFont.fontDescriptor()
		let hiraginoFont = UIFont.init(name: "HiraKakuProN-W3", size: fontSize)! // Font B
		let heitiFont = UIFont.init(name: "Heiti TC", size: fontSize)! // Font C
		
		// ヒラギノ書体で合成フォントを作成
		let japaneseFontDescriptor = UIFontDescriptor.init(fontAttributes: [UIFontDescriptorFamilyAttribute : "Hiragino Sans"])
		let newFontDescriptor = systemFontDescriptor.fontDescriptorByAddingAttributes([UIFontDescriptorCascadeListAttribute : [japaneseFontDescriptor]])
		let compositeFont = UIFont.init(descriptor: newFontDescriptor, size: 0.0) // Font D
		
		// フォントを選択
		let font: UIFont = compositeFont
		
		// 長文が読みづらいので適当に行間を空ける処理
		let paragraphStyle: NSMutableParagraphStyle = NSMutableParagraphStyle.init()
		paragraphStyle.minimumLineHeight = fontSize * 1.5
		paragraphStyle.maximumLineHeight = paragraphStyle.minimumLineHeight
		let attributedString = NSMutableAttributedString.init(string: text, attributes: [NSParagraphStyleAttributeName : paragraphStyle, NSFontAttributeName : font])
		
		// ラベルに適用
		label.attributedText = attributedString
	}
}

