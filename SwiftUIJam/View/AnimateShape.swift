//
//  AnimateShape.swift
//  SwiftUIJam
//
//  Created by Marina Huber on 07.11.2021..
//
import SwiftUI

struct StartStopAnimateView: View {
    @Binding var start: Bool

    var body: some View {
        VStack {
            ZStack {
                RegularPolygon(sides: start ? 50 : 4)
                    .scale(self.start ? 0.75 : 1.0)
                   .stroke(start ? Color(.systemMint) : .gray, lineWidth: 20)
                    .frame(width: 200, height: 200)
                    .padding()

            }
            .animation(.easeOut(duration: 3)
                        .repeatForever())
            .onAppear {
                self.start.toggle()
                    
            }
        }
    }
}

struct RegularPolygon: Shape {
    var sides: Int
    private var SidesDouble: Double

    var animatableData: Double {
        get { return SidesDouble }
        set { SidesDouble = newValue }
    }

    init(sides: Int) {
        self.sides = sides
        self.SidesDouble = Double(sides)
    }

    func path(in rect: CGRect) -> Path {
        // centre of the containing rect
        let c = CGPoint(x: rect.width/2.0, y: rect.height/2.0)
        // radius of a circle that will fit in the rect
        let r = Double(min(rect.width,rect.height)) / 2.0
        let offsetAngle = (Double.pi / Double(SidesDouble)) + Double.pi/2.0
        var vertices:[CGPoint] = []

        let endAngle: Int = Double(SidesDouble) > Double(Int(SidesDouble)) ? Int(SidesDouble)+1 : Int(SidesDouble)
        for i in 0..<endAngle{
            // Calculate the angle in Radians
            let angle = (2.0 * Double.pi * Double(i)/Double(SidesDouble)) + offsetAngle
            let pt = Cartesian(length: r, angle: angle)
            // move the point to the center of the rect and add to vertices
            vertices.append(CGPoint(x: pt.x + c.x, y: pt.y + c.y))
        }

        var path = Path()
        for (n, pt) in vertices.enumerated() {
            n == 0 ? path.move(to: pt) : path.addLine(to: pt)
        }
        path.closeSubpath()
        return path
    }
}

func Cartesian(length:Double, angle:Double) -> CGPoint {
   return CGPoint(x: length * cos(angle), y: length * sin(angle))
}



