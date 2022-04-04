//
//  ConvertObjemView.swift
//  Konvertor
//
//  Created by Palino on 04/04/2022.
//

import SwiftUI

enum ObjemoveJednotky: String, CaseIterable {
    case liter = "l"
    case mililiter = "ml"
    case cup = "cup"
    case pint = "pt"
    case gallon = "gl"
}

struct ConvertObjemView: View {
    @State private var zadanyObjem: Double = 1
    @State private var vstupnyObjem: ObjemoveJednotky = .pint
    
    var vstupnyObjemML: Double {
        switch vstupnyObjem {
        case .liter:
            return zadanyObjem * 1_000
        case .mililiter:
            return zadanyObjem
        case .cup:
            return zadanyObjem * 236.588237
        case .pint:
            return zadanyObjem * 473.176473
        case .gallon:
            return zadanyObjem * 3_785.41178
        }
    }
    
    var body: some View {
        Form {
            Section("Zadaj objem") {
                TextField("vlož objem", value: $zadanyObjem, format: .number)
                    .keyboardType(.decimalPad)
                
                Picker("Vyber vstupný objem", selection: $vstupnyObjem) {
                    ForEach(ObjemoveJednotky.allCases, id: \.self) {
                        Text($0.rawValue)
                    }
                }
                .pickerStyle(.segmented)
            }
            
            Section("Objemové jednotky") {
                ForEach(ObjemoveJednotky.allCases, id: \.self) { jednotka in
                    
                    let objemVypis = premen(vstupnyObjemML, output: ObjemoveJednotky(rawValue: jednotka.rawValue)!)
                    
                    Text("\(objemVypis, specifier: "%.2f") \(jednotka.rawValue)")
                }
            }
        }
        .navigationTitle("Objem")
    }
    
    func premen(_ vstup: Double, output: ObjemoveJednotky) -> Double {
        switch output {
        case .liter:
            return vstup / 1_000
        case .mililiter:
            return vstup
        case .cup:
            return vstup / 236.588237
        case .pint:
            return vstup / 473.176473
        case .gallon:
            return vstup / 3_785.41178
        }
    }
}

struct ConvertObjemView_Previews: PreviewProvider {
    static var previews: some View {
        ConvertObjemView()
    }
}
