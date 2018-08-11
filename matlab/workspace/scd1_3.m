% #############  scd1_3.m: Dynamik und Praezision einer Gleitkommazahl #############
% 

clear all;
close all;

% Erklaerung eps, realmax, realmin
% eps:      Abstand von einer angegebenen Zahl zur nächst höhren
% realmax:  groeßte endliche Gleitkommazahl
% realmin:  kleinste positive normalisierte Gleitkommazahl

% Formel fuer Berechnung der Gleitkommazahlen
% x = (-1)^S*2^(E-OS)*(1+Mf)
% S....VorzeichenBit (1 oder 0)
% E....Exponent single precision (1<=E<=254),
%               double precision (1<=E<=2046)
% OS...Offset Darstellung single precision (OS=127),
%                         double precision (OS=1023)
% Mf...Wert der Mantisse

% kleinste Positive Zahl
smallestSingleOwn = (-1)^0*2^(1-127)*(1+0);
smallestDoubleOwn = (-1)^0*2^(1-1023)*(1+0);

% groeßte Positive Zahl
biggestSingleOwn = (-1)^0*2^(254-127)*(1+(1-2^-23));
biggestDoubleOwn = (-1)^0*2^(2046-1023)*(1+(1-2^-52));

% kleinste und groeßte single- und double-precision Zahl
biggestDouble = realmax('double');
biggestSingle = realmax('single');
smallestDouble = realmin('double');
smallestSingle = realmin('single');

% Dynamik von single und double
dynDouble = biggestDouble/smallestDouble; % = 0.8079*10^-616
dynSingle = biggestSingle/smallestSingle; % = 2.8948*10^-76
% Matlab kann die Werte nicht darstellen, weil der Wert so groß ist

% Praezision von single und double (Abhäng von Exponent)
preDouble = 2^-23/2;
preSingle = 2^-52/2;
