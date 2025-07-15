---
title: Irrigation controller circuit
date: 2025-07-15
categories: [Projects]
tags: ltspice, circuit
---

## Intro

I recently came across a malfunctioning water irrigation controller that was causing some headaches in the garden, so I decided to take a look. It seems like this particular one, the RainBird WPX2, is a DC latching solenoid controller which is not very common. Most controllers use AC to power a solenoid which needs continuous current to stay open (no current = valve closes) but these controllers need an AC source to work. The RainBird is battery operated so It seems logical that the valve is DC. A short voltage pulse is needed in order to open or close a DC latching valve. This method saves a lot of energy, and the controller can be run for a long time relying only on batteries. This particular one claims to last 1-2 years using one or two 9V batteries connected in parallel. For fun I decided to try to emulate the solenoid driver portion of the controller by building my own circuit.

## Pulse Generator 

First, I need a circuit that can accurately create a pulsed signal. The circuit below was taken from page 77 of the book "The Art of Electronics, Third Edition", and features an RC circuit and two transistors:
![pulse generator](assets\images\pulse_generator.png)

the pulse duration can be easily varied by changing the resistance of the RC network.
The book improves on this design by adding a third transistor which creates the pulse regardless of the input signal duration. This, however, could be replaced with a diode and resistor in series feeding back into the input for simplicity.

## H-Bridge
In order to open the valve a 9V pulse must be applied to the solenoid, but to close it the pulse needs to have reverse polarity. To do this I use an H-bridge from generic MOSFETs with low Drain-Source "On" Resistance, so they don't waste power. On each side, I tie the gates together, so that only one transistor will be open at a time from every side *.
![h-bridge](assets\images\h-bridge.png)

## SR Latch
Now I need to drive the H-bridge so that the wanted operation can be toggled. My idea was to use an SR latch because it solves many issues at the same time:

- It's simple
- It can drive the H-bridge directly from its outputs (Q, Qbar) 
- Provides protection because It only lets diagonally placed transistors open - one pair at a time - preventing short circuits, even if on/off buttons are pressed at the same time.
- Uses two buttons, set and reset (on/off)

With a simple Set-Reset Latch using two BJT's we will need two buttons that pullup (or down) their bases. To avoid random outputs when both buttons are pressed at exactly the same time (race condition), I will make the base resistor of the reset transistor a bit smaller so the latch resets (off) in this case.

![](assets\images\irrigation-controller.png)

### Considerations
This circuit is by no means perfect. Some of its issues can be summarized below:

- High idle current draw of a few mA because of the BJT's
- Lack of proper H-bridge driver means that the mosfets are not always operating in saturation mode, wasting power and causing very short (ns) bursts of high current when switching (both transistors on one side conduct)

Because the circuit is not critical these problems can be safely ignored, and I may try to fix them at another time.


