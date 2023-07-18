*use "C:\Users\....\SPPQ Paper dataset 3.11.22.dta"


// Table 1 DDEHA model
eststo clear

*TRAP model
melogit trapmove learnprov learnseat ///
 govparty_c_01 rep_unified_01 citi6016_01   ///
 neighbors pem t_01 t2_01 t3_01 ///
if nobiastrap==1 & state_01 !=state_02 || stateno1_01 : || stateno1_02 :

estat ic
estimates store trap

*Moral Model 
melogit moralmove learnprov2 learnseat2 ///
 govparty_c_01 rep_unified_01 citi6016_01   ///
 neighbors pem2 t_01 t2_01 t3_01 ///
if nobiasmoral==1 & state_01 !=state_02 || stateno1_01 : || stateno1_02 :
 
 estat ic
estimates store moral
 
 
 estout trap moral using ZMainmodel.txt, replace ///
	cells(b(star fmt(3)) se(par)) ///
	stats(N chi2 aic bic, fmt(0 2)) ///
	modelwidth(8) ///
	starlevels(* 0.1 ** 0.05 *** 0.01) legend ///
	label varwidth(30) ///
	mlabels(Instrumental Symbolic) ///
	collabels(, none)
	

	
// Table 2 - Variable adoption timeframe
eststo clear


melogit trapmove learnprov learnseat ///
 govparty_c_01 rep_unified_01 citi6016_01   ///
 neighbors pem t_01 t2_01 t3_01 ///
if nobiastrap==1 & state_01 !=state_02 || stateno1_01 : || stateno1_02 :

estat ic
estimates store time2

melogit trapmove learnprovtime1 learnseat ///
 govparty_c_01 rep_unified_01 citi6016_01   ///
 neighbors pem t_01 t2_01 t3_01 ///
if nobiastrap==1 & state_01 !=state_02 || stateno1_01 : || stateno1_02 :

estat ic
estimates store time

melogit trapmove learnprovtime3 learnseat ///
 govparty_c_01 rep_unified_01 citi6016_01   ///
 neighbors pem t_01 t2_01 t3_01 ///
if nobiastrap==1 & state_01 !=state_02 || stateno1_01 : || stateno1_02 :

estat ic
estimates store time3



 estout time time2 time3 using Ztimerangecontrol.txt, replace ///
	cells(b(star fmt(3)) se(par)) ///
	stats(N chi2 aic bic, fmt(0 2)) ///
	modelwidth(8) ///
	starlevels(* 0.1 ** 0.05 *** 0.01) legend ///
	label varwidth(30) ///
	mlabels(Instrumental Symbolic) ///
	collabels(, none)
	
	
	eststo clear

	melogit moralmove learnprov2 learnseat2 ///
 govparty_c_01 rep_unified_01 citi6016_01   ///
 neighbors pem2 t_01 t2_01 t3_01 ///
if nobiasmoral==1 & state_01 !=state_02 || stateno1_01 : || stateno1_02 :

estat ic
estimates store time2

melogit moralmove learnprov2time1 learnseat2 ///
 govparty_c_01 rep_unified_01 citi6016_01   ///
 neighbors pem2 t_01 t2_01 t3_01 ///
if nobiasmoral==1 & state_01 !=state_02 || stateno1_01 : || stateno1_02 :

estat ic
estimates store time

melogit moralmove learnprov2time3 learnseat2 ///
 govparty_c_01 rep_unified_01 citi6016_01   ///
 neighbors pem2 t_01 t2_01 t3_01 ///
if nobiasmoral==1 & state_01 !=state_02 || stateno1_01 : || stateno1_02 :

estat ic
estimates store time3

 estout time time2 time3 using Ztimerangecontrol2.txt, replace ///
	cells(b(star fmt(3)) se(par)) ///
	stats(N chi2 aic bic, fmt(0 2)) ///
	modelwidth(8) ///
	starlevels(* 0.1 ** 0.05 *** 0.01) legend ///
	label varwidth(30) ///
	mlabels(Instrumental Symbolic) ///
	collabels(, none)
// Table 3 - Different emulation measuremetns (same state/citizen/latent network scores)
eststo clear

 * Trap model
melogit trapmove learnprov learnseat ///
 govparty_c_01 rep_unified_01 citi6016_01   ///
 citid stateid latent simscores ///
 neighbors pem t_01 t2_01 t3_01 ///
if nobiastrap==1 & state_01 !=state_02 || stateno1_01 : || stateno1_02 :

estat ic
estimates store trap


*Moral Model 
melogit moralmove learnprov2 learnseat2 ///
 govparty_c_01 rep_unified_01 citi6016_01   ///
  citid stateid latent simscores ///
 neighbors pem2 t_01 t2_01 t3_01 ///
if nobiasmoral==1 & state_01 !=state_02 || stateno1_01 : || stateno1_02 :
 
 estat ic
estimates store moral
 
 
 estout trap moral using Zemulationmodel.txt, replace ///
	cells(b(star fmt(3)) se(par)) ///
	stats(N chi2 aic bic, fmt(0 2)) ///
	modelwidth(8) ///
	starlevels(* 0.1 ** 0.05 *** 0.01) legend ///
	label varwidth(30) ///
	mlabels(Instrumental Symbolic) ///
	collabels(, none)
	
// Table 4 Ideology MEasurements
// - Alternate Control Varaible checks
********************************
*Mix and match main effect vars for robustness checks
*It could be argued that some varaibles might have different results based on data choices.
*Below, we model those and note if there are disagreements and justify our decison. 
*abortpo_01 cath2 prot2 citi6016_01 inst6017_nom_01
 *******************************
 
 **models with Abortion Public Opinion instead of liberalism scores
 *Inflates the P value of partisan learning for trap laws, but rare events issues lead it to predict the model too well, so the inflated
 * Coefficient causes thsi to be a less than stellar variable
 eststo clear

 
 *Trap model
 meqrlogit trapmove learnprov learnseat ///
 govparty_c_01 rep_unified_01 abortpo_01   ///
 neighbors pem t_01 t2_01  ///
if nobiastrap==1 & state_01 !=state_02 || stateno1_01 : || stateno1_02 :

estat ic
estimates store trap_abortpo


*Moral Model  
melogit moralmove learnprov2 learnseat2 ///
 govparty_c_01 rep_unified_01 abortpo_01   ///
 neighbors pem2 t_01 t2_01  ///
if nobiasmoral==1 & state_01 !=state_02 || stateno1_01 : || stateno1_02 :

estat ic
estimates store moral_abortpo

****************
***************
*models with only Religion vars
**Partisan learning now sig at .1 (.06) level, othrwise no change. Significance for religion loads on the protestant variable, but thse
*two are so correlated this matters little. (Only correlation issues are between these two varaibles or these vaaibles) 

 *Trap model
 meqrlogit trapmove learnprov learnseat ///
 govparty_c_01 rep_unified_01 cath2 prot2   ///
 neighbors pem t_01 t2_01 t3_01 ///
if nobiastrap==1 & state_01 !=state_02 || stateno1_01 : || stateno1_02 :

estat ic
estimates store trap_relig


*Moral Model  
melogit moralmove learnprov2 learnseat2 ///
 govparty_c_01 rep_unified_01 cath2 prot2   ///
 neighbors pem2 t_01 t2_01 t3_01 ///
if nobiasmoral==1 & state_01 !=state_02 || stateno1_01 : || stateno1_02 :
 
 
 estat ic
estimates store moral_relig
 
****************
***************
*models with everything on citizen opinions

*Main effects don't change much (partisan learning just squeeaks over .05 significance), IV's all load onto citizen liberalism scores


 *Trap model
 melogit trapmove learnprov learnseat ///
 govparty_c_01 rep_unified_01 abortpo_01 cath2 prot2 citi6016_01   ///
 neighbors pem t_01 t2_01 t3_01 ///
if nobiastrap==1 & state_01 !=state_02 || stateno1_01 : || stateno1_02 :

estat ic
estimates store trap_works


*Moral Model  
melogit moralmove learnprov2 learnseat2 ///
 govparty_c_01 rep_unified_01 abortpo_01 cath2 prot2 citi6016_01   ///
 neighbors pem2 t_01 t2_01 t3_01 ///
if nobiasmoral==1 & state_01 !=state_02 || stateno1_01 : || stateno1_02 :

estat ic
estimates store moral_works



 estout trap_abortpo moral_abortpo trap_relig moral_relig trap_works moral_works using ZRobustMainEffects.txt, replace ///
	cells(b(star fmt(3)) se(par)) ///
	stats(N chi2 aic bic, fmt(0 2)) ///
	modelwidth(8) ///
	starlevels(* 0.1 ** 0.05 *** 0.01) legend ///
	label varwidth(30) ///
	mlabels(Trap_abort Moral_abort trap_relig moral_relig trap_works moral_works) ///
	collabels(, none)
	
	
// Appendix - Table OA1 - Instrumental policy descrioptives 
sum trapmove learnprov learnseat ///
 govparty_c_01 rep_unified_01 citi6016_01   ///
 neighbors pem t_01 t2_01 t3_01 ///
if nobiastrap==1
// Table OA1 - Symbolic descriptives
sum moralmove learnprov2 learnseat2 ///
 govparty_c_01 rep_unified_01 citi6016_01   ///
 neighbors pem2 t_01 t2_01 t3_01 ///
if nobiasmoral==1

//
// Table OA3 - Robustness checks Alternate Govt measures
***************
*models with different state govt measurements

*These are nearly identical to the base model, but you lose the power to see differnces between governorship and legislature control
eststo clear

 * Trap model
melogit trapmove learnprov learnseat ///
 inst6017_nom_01 citi6016_01   ///
 neighbors pem t_01 t2_01 t3_01 ///
if nobiastrap==1 & state_01 !=state_02 || stateno1_01 : || stateno1_02 :


estat ic
estimates store trap_berry

*Moral Model 
melogit moralmove learnprov2 learnseat2 ///
 inst6017_nom_01 citi6016_01   ///
 neighbors pem2 t_01 t2_01 t3_01 ///
if nobiasmoral==1 & state_01 !=state_02 || stateno1_01 : || stateno1_02 :

estat ic
estimates store moral_berry

****************
***************
*models with different either/or govt measurements

*No change for REP unified only, for morsl values state effects load to it
*No change for GOv only, for TRAP laws values for state load to it

melogit trapmove learnprov learnseat ///
  rep_unified_01 citi6016_01   ///
 neighbors pem t_01 t2_01 t3_01 ///
if nobiastrap==1 & state_01 !=state_02 || stateno1_01 : || stateno1_02 :

estat ic
estimates store trap_either

*Moral Model 
melogit moralmove learnprov2 learnseat2 ///
  rep_unified_01 citi6016_01   ///
 neighbors pem2 t_01 t2_01 t3_01 ///
if nobiasmoral==1 & state_01 !=state_02 || stateno1_01 : || stateno1_02 :

estat ic
estimates store moral_either

**

melogit trapmove learnprov learnseat ///
 govparty_c_01  citi6016_01   ///
 neighbors pem t_01 t2_01 t3_01 ///
if nobiastrap==1 & state_01 !=state_02 || stateno1_01 : || stateno1_02 :

estat ic
estimates store trap_or

*Moral Model 
melogit moralmove learnprov2 learnseat2 ///
 govparty_c_01  citi6016_01   ///
 neighbors pem2 t_01 t2_01 t3_01 ///
if nobiasmoral==1 & state_01 !=state_02 || stateno1_01 : || stateno1_02 :

estat ic
estimates store moral_or

 estout trap_berry moral_berry trap_either moral_either trap_or moral_or using ZRobustStategovteffects.txt, replace ///
	cells(b(star fmt(3)) se(par)) ///
	stats(N chi2 aic bic, fmt(0 2)) ///
	modelwidth(8) ///
	starlevels(* 0.1 ** 0.05 *** 0.01) legend ///
	label varwidth(30) ///
	mlabels(trap_berry moral_berry trap_either moral_either trap_or moral_or) ///
	collabels(, none)
//
// TAble OA4 - Robustnes checks alt policy impact measures (abortion rates and votes>seats)
*********************
*Models with different learning measures 
*********************

eststo clear

***Learning from abortion rate decreases 
melogit trapmove learneffect learnseat ///
 govparty_c_01 rep_unified_01 citi6016_01   ///
 neighbors pem t_01 t2_01 t3_01 ///
if nobiastrap==1 & state_01 !=state_02 || stateno1_01 : || stateno1_02 :

estat ic
estimates store trap_abortdecrease

melogit moralmove learneffect2 learnseat2 ///
 govparty_c_01 rep_unified_01 citi6016_01   ///
 neighbors pem2 t_01 t2_01 t3_01 ///
if nobiasmoral==1 & state_01 !=state_02 || stateno1_01 : || stateno1_02 :

estat ic
estimates store moral_abortdecrease

*****Learning with votes instead of seats

melogit trapmove learnprov learnvote ///
 govparty_c_01 rep_unified_01 citi6016_01   ///
 neighbors pem t_01 t2_01 t3_01 ///
if nobiastrap==1 & state_01 !=state_02 || stateno1_01 : || stateno1_02 :

estat ic
estimates store trap_partyvotes

melogit moralmove learnprov2 learnvote2 ///
 govparty_c_01 rep_unified_01 citi6016_01   ///
 neighbors pem2 t_01 t2_01 t3_01 ///
if nobiasmoral==1 & state_01 !=state_02 || stateno1_01 : || stateno1_02 :

estat ic
estimates store moral_partyvotes

estout trap_abortdecrease moral_abortdecrease trap_partyvotes moral_partyvotes using ZAltlearningresults.txt, replace ///
	cells(b(star fmt(3)) se(par)) ///
	stats(N chi2 aic bic, fmt(0 2)) ///
	modelwidth(8) ///
	starlevels(* 0.1 ** 0.05 *** 0.01) legend ///
	label varwidth(30) ///
	mlabels(trap_abortdecrease moral_abortdecrease trap_partyvotes moral_partyvotes) ///
	collabels(, none)
//
// Table OA5 - robustness checks SMM
*****For SMM maternal health measures (but only 08 and on due to data limitations)

preserve

drop if year_01 <2008

eststo clear


melogit trapmove learnsmm learnseat ///
 govparty_c_01 rep_unified_01 citi6016_01   ///
 neighbors pem t_01 t2_01 t3_01 ///
if nobiastrap==1 & state_01 !=state_02 || stateno1_01 : || stateno1_02 :

estat ic
estimates store trap_SMM

melogit moralmove learnsmm2 learnseat2 ///
 govparty_c_01 rep_unified_01 citi6016_01   ///
 neighbors pem2 t_01 t2_01 t3_01 ///
if nobiasmoral==1 & state_01 !=state_02 || stateno1_01 : || stateno1_02 :

estat ic
estimates store moral_SMM

estout trap_SMM moral_SMM  using ZSMMresults.txt, replace ///
	cells(b(star fmt(3)) se(par)) ///
	stats(N chi2 aic bic, fmt(0 2)) ///
	modelwidth(8) ///
	starlevels(* 0.1 ** 0.05 *** 0.01) legend ///
	label varwidth(30) ///
	mlabels(trap_SMM moral_SMM ) ///
	collabels(, none)
	
restore 
	
	
eststo clear
	