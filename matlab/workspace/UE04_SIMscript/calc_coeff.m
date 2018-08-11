%% calc coeff

%clc;
%close all;
%clear all;

load filters_all_240_42.mat;

L_BP_u = norm(BP_u, 'l1');
L_BP_o = norm(BP_o, 'l1');
L_TP = norm(TP, 'l1');
BP_U_all = (1/L_BP_u)*BP_u.Numerator;
BP_O_all = (1/L_BP_o)*BP_o.Numerator;
TP_1 = (1/L_TP)*TP.Numerator;

load filters_own_240_42.mat;

L_BP_u = norm(BP_u, 'l1');
L_BP_o = norm(BP_o, 'l1');
L_TP = norm(TP, 'l1');
BP_U_own = (1/L_BP_u)*BP_u.Numerator;
BP_O_own = (1/L_BP_o)*BP_o.Numerator;
TP_2 = (1/L_TP)*TP.Numerator;