//
//  ConvertVzdialenostView.swift
//  Konvertor
//
//  Created by Palino on 04/04/2022.
//

import SwiftUI

struct ConvertVzdialenostView: View {
    @State private var vstupnaVzdialenost: Double = 1
    @State private var vstupnaJednotka = "m"
    
    let vsetkyJednotky = ["km", "m", "cm", "mm", "mi", "yd", "ft", "in"]
    
    var vstupnaVzdialenostMM: Double {
        var konvertovaneNaMilimetre: Double
        
        switch vstupnaJednotka {
        case "km":
            konvertovaneNaMilimetre = vstupnaVzdialenost * 1_000_000
        case "m":
            konvertovaneNaMilimetre = vstupnaVzdialenost * 1_000
        case "cm":
            konvertovaneNaMilimetre = vstupnaVzdialenost * 10
        case "mi":
            konvertovaneNaMilimetre = vstupnaVzdialenost * 1_609_344
        case "yd":
            konvertovaneNaMilimetre = vstupnaVzdialenost * 914.4
        case "ft":
            konvertovaneNaMilimetre = vstupnaVzdialenost * 304.8
        case "in":
            konvertovaneNaMilimetre = vstupnaVzdialenost * 25.4
        default:
            konvertovaneNaMilimetre = vstupnaVzdialenost
        }
        
        return konvertovaneNaMilimetre
    }
    
    var body: some View {
        Form {
            Section("Zadaj vstupné jednotky") {
                TextField("zadaj vzdialenosť", value: $vstupnaVzdialenost, format: .number)
                    .keyboardType(.decimalPad)

                Picker("Vyber vstupnú jednotku", selection: $vstupnaJednotka) {
                    ForEach(vsetkyJednotky, id: \.self) { jednotka in
                        Text(jednotka)
                    }
                }
                .pickerStyle(.menu)
            }

            Section("Metrické") {
                Text(vypocitajVzdialenost(vstupnaVzdialenostMM, output: "km"))
                Text(vypocitajVzdialenost(vstupnaVzdialenostMM, output: "m"))
                Text(vypocitajVzdialenost(vstupnaVzdialenostMM, output: "cm"))
                Text(vypocitajVzdialenost(vstupnaVzdialenostMM, output: "mm"))
            }
            
            Section("Imperiálne") {
                Text(vypocitajVzdialenost(vstupnaVzdialenostMM, output: "mi"))
                Text(vypocitajVzdialenost(vstupnaVzdialenostMM, output: "yd"))
                Text(vypocitajVzdialenost(vstupnaVzdialenostMM, output: "ft"))
                Text(vypocitajVzdialenost(vstupnaVzdialenostMM, output: "in"))
            }
        }
        .navigationTitle("Vzdialenosť")
    }
    
    func vypocitajVzdialenost(_ vzdialenost: Double, output: String) -> String {
        var vystup: Double
        
        switch output {
        case "km":
            vystup = vzdialenost / 1_000_000
        case "m":
            vystup = vzdialenost / 1_000
        case "cm":
            vystup = vzdialenost / 10
        case "mi":
            vystup = vzdialenost / 1_609_344
        case "yd":
            vystup = vzdialenost / 914.4
        case "ft":
            vystup = vzdialenost / 304.8
        case "in":
            vystup = vzdialenost / 25.4
        default:
            vystup = vzdialenost
        }
        
        var textovyVystup = String(format: "%.6f", vystup)
        
        while textovyVystup.last == "0" {
            textovyVystup.removeLast()
        }
        
        if textovyVystup.last == "." {
            textovyVystup.removeLast()
        }
        
        return "\(textovyVystup) \(output)"
    }
}

struct ConvertVzdialenostView_Previews: PreviewProvider {
    static var previews: some View {
        ConvertVzdialenostView()
    }
}
