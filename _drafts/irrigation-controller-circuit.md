---
title: Irrigation controller circuit
date: 2025-07-15
categories: [Projects]
tags: ltspice
---

## Intro

I recently came across a malfunctioning water irrigation controller that was causing some headaches in the garden so I decided to take a look. It seems like this particular one, the RainBird WPX2, is a DC latching solenoid controller which is not very common. Most controllers use AC to power a solenoid which needs continuous current to stay open (no current = valve closes) but these controllers need an AC source to work. The RainBird is battery operated so It seems logical that the valve is DC. A short voltage pulse is needed in order to open or close a DC latching valve. This method saves a lot of energy and the controller can be run for a long time relying only on batteries. This particular one claims to last 1-2 years using one or two 9V batteries connected in parallel. For fun I decided to try to emulate the solenoid driver portion of the controller by building my own circuit.

## Pulse Generator 

First, we need a circuit that can accurately create a pulsed signal. The circuit below was taken from this [website](https://cushychicken.github.io/posts/ckt-notes-pulse-generator/), and features an RC circuit and two transistors:
![pulse generator](assets\images\pulse_generator.png)

the pulse duration can be easily varied by changing the resistance of the RC network.

## H-Bridge
In order to open the valve we apply a 9V pulse to the solenoid, but to close it we need to apply the pulse with reverse polarity. To do this we use an H-bridge using generic MOSFETs with low Drain-Source "On" Resistance so they don't waste power. On each side, we tie the gates together, so that only one transistor will be open at a time from every side *.
![h-bridge](assets\images\h-bridge.png)

## SR Latch
Now we need to drive the H-bridge so that we can choose the wanted operation (on or off). My idea was to use an SR latch because it solves many issues at the same time:

- It's simple
- It can drive the H-bridge directly from its outputs 
- Provides protection because It only lets diagonally placed transistors open - one pair at a time - preventing short circuits, even if both on/off buttons are pressed.

![](assets\images\irrigation-controller.png)

### Notes

