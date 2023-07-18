**Variable coding with brief explanation
*Other details on Varible descriptions are in .dta file and more so in codebook.

*Generate Policy Movement Variables, the DVs.
*This is a 0/1 varaible where the policy of State A becomes more like the policy of State A (1), or it does not (0). It's triggered by any policy change within each Symbolic/Instrumental policy grouping

gen trapmove=0
replace trapmove=1 if ((abs(a24_01 - a24_02))) < ((abs(a24lag_01 - a24lag_02)))
replace trapmove=1 if ((abs(a25_01 - a25_02))) < ((abs(a25lag_01 - a25lag_02)))
replace trapmove=1 if ((abs(a26_01 - a26_02))) < ((abs(a26lag_01 - a26lag_02)))


gen moralmove=0
replace moralmove=1 if ((abs(a1_01 - a1_02))) < ((abs(a1lag_01 - a1lag_02)))
replace moralmove=1 if ((abs(a15_01 - a15_02))) < ((abs(a15lag_01 - a15lag_02)))
replace moralmove=1 if ((abs(a29_01 - a29_02))) < ((abs(a29lag_01 - a29lag_02)))
replace moralmove=1 if ((abs(a31_01 - a31_02))) < ((abs(a31lag_01 - a31lag_02)))



*Generate Change in Policy variables
*This line generates a value of 1 if a year is different than it's lag year. It should also account for multiple passes in a single year and only record one

*Passing Instrumental Law in State A
gen trappass_01=0
replace trappass_01=1 if a24_01 != a24lag_01 
replace trappass_01=1 if a25_01 != a25lag_01 
replace trappass_01=1 if a26_01 != a26lag_01 


gen trappasslag_01=0
replace trappasslag_01=1 if a24lag_01 != a24lag2_01 
replace trappasslag_01=1 if a25lag_01 != a25lag2_01 
replace trappasslag_01=1 if a26lag_01 != a26lag2_01 


gen trappasslag2_01=0
replace trappasslag2_01=1 if a24lag2_01 != a24lag3_01 
replace trappasslag2_01=1 if a25lag2_01 != a25lag3_01 
replace trappasslag2_01=1 if a26lag2_01 != a26lag3_01 


gen trappasslag3_01=0
replace trappasslag3_01=1 if a24lag3_01 != a24lag4_01
replace trappasslag3_01=1 if a25lag3_01 != a25lag4_01
replace trappasslag3_01=1 if a26lag3_01 != a26lag4_01

*Passing Instrumental Law in State B
gen trappass_02=0
replace trappass_02=1 if a24_02 != a24lag_02 
replace trappass_02=1 if a25_02 != a25lag_02 
replace trappass_02=1 if a26_02 != a26lag_02 


gen trappasslag_02=0
replace trappasslag_02=1 if a24lag_02 != a24lag2_02 
replace trappasslag_02=1 if a25lag_02 != a25lag2_02 
replace trappasslag_02=1 if a26lag_02 != a26lag2_02 


gen trappasslag2_02=0
replace trappasslag2_02=1 if a24lag2_02 != a24lag3_02 
replace trappasslag2_02=1 if a25lag2_02 != a25lag3_02 
replace trappasslag2_02=1 if a26lag2_02 != a26lag3_02 


gen trappasslag3_02=0
replace trappasslag3_02=1 if a24lag3_02 != a24lag4_02
replace trappasslag3_02=1 if a25lag3_02 != a25lag4_02
replace trappasslag3_02=1 if a26lag3_02 != a26lag4_02


***Passing Symbolic Law in State A

gen moralpass_01=0
replace moralpass_01=1 if a1_01 != a1lag_01 
replace moralpass_01=1 if a15_01 != a15lag_01 
replace moralpass_01=1 if a29_01 != a29lag_01 
replace moralpass_01=1 if a31_01 != a31lag_01 

gen moralpasslag_01=0
replace moralpasslag_01=1 if a1lag_01 != a1lag2_01 
replace moralpasslag_01=1 if a15lag_01 != a15lag2_01 
replace moralpasslag_01=1 if a29lag_01 != a29lag2_01 
replace moralpasslag_01=1 if a31lag_01 != a31lag2_01

gen moralpasslag2_01=0
replace moralpasslag2_01=1 if a1lag2_01 != a1lag3_01 
replace moralpasslag2_01=1 if a15lag2_01 != a15lag3_01 
replace moralpasslag2_01=1 if a29lag2_01 != a29lag3_01 
replace moralpasslag2_01=1 if a31lag2_01 != a31lag3_01

gen moralpasslag3_01=0
replace moralpasslag3_01=1 if a1lag3_01 != a1lag4_01 
replace moralpasslag3_01=1 if a15lag3_01 != a15lag4_01 
replace moralpasslag3_01=1 if a29lag3_01 != a29lag4_01 
replace moralpasslag3_01=1 if a31lag3_01 != a31lag4_01


*Passing Symbolic Law in State B

gen moralpass_02=0
replace moralpass_02=1 if a1_02 != a1lag_02 
replace moralpass_02=1 if a15_02 != a15lag_02 
replace moralpass_02=1 if a29_02 != a29lag_02 
replace moralpass_02=1 if a31_02 != a31lag_02 

gen moralpasslag_02=0
replace moralpasslag_02=1 if a1lag_02 != a1lag2_02 
replace moralpasslag_02=1 if a15lag_02 != a15lag2_02 
replace moralpasslag_02=1 if a29lag_02 != a29lag2_02 
replace moralpasslag_02=1 if a31lag_02 != a31lag2_02

gen moralpasslag2_02=0
replace moralpasslag2_02=1 if a1lag2_02 != a1lag3_02 
replace moralpasslag2_02=1 if a15lag2_02 != a15lag3_02 
replace moralpasslag2_02=1 if a29lag2_02 != a29lag3_02 
replace moralpasslag2_02=1 if a31lag2_02 != a31lag3_02

gen moralpasslag3_02=0
replace moralpasslag3_02=1 if a1lag3_02 != a1lag4_02 
replace moralpasslag3_02=1 if a15lag3_02 != a15lag4_02 
replace moralpasslag3_02=1 if a29lag3_02 != a29lag4_02 
replace moralpasslag3_02=1 if a31lag3_02 != a31lag4_02

*Below generates the substantive learning varaible for provider numbers

gen lp=0
replace lp=1 if (provnum_02 - provnumlag_02) < 0  

gen lp2=0
replace lp2=1 if (provnumlag_02 - provnumlag2_02) < 0


gen pl=0
replace pl=1 if lp==1 & trappasslag_02==1
replace pl=1 if lp==1 & trappasslag2_02==1
replace pl=1 if lp2==1 & trappasslag2_02==1
replace pl=1 if lp==1 & trappasslag3_02==1
replace pl=1 if lp2==1 & trappasslag3_02==1



gen pl2=0
replace pl2=1 if lp==1 & moralpasslag_02==1
replace pl2=1 if lp==1 & moralpasslag2_02==1
replace pl2=1 if lp2==1 & moralpasslag2_02==1
replace pl2=1 if lp==1 & moralpasslag3_02==1
replace pl2=1 if lp2==1 & moralpasslag3_02==1
 
 
gen learnprov=pl
gen learnprov2=pl2

*Now for the partisan learning measures

drop gs
drop ls
drop ls2



gen tvote_02=rvote_02+dvote_02+ovote_02
gen tvotelag4_02=rvotelag4_02+dvotelag4_02+ovotelag4_02


gen gs=0
replace gs=1 if ((rvote_02/tvote_02)-(rvotelag4_02/tvotelag4_02))>0



gen ls=0
replace ls=1 if gs==1 & trappasslag_02==1
replace ls=1 if gs==1 & trappasslag2_02==1
replace ls=1 if gs==1 & trappasslag3_02==1


gen ls2=0
replace ls2=1 if gs==1 & moralpasslag_02==1
replace ls2=1 if gs==1 & moralpasslag2_02==1
replace ls2=1 if gs==1 & moralpasslag3_02==1


*Learneffect 1 is for Instrumental (TRAP) policy, learneffect 2 then is for Symbolic policy. Same holds for political measures.
gen learnvote=ls 
gen learnvote2=ls2

drop gs
drop ls
drop ls2






gen gs=0
replace gs=1 if ((rseats_02/totalseats_02)-(rseatslag4_02/totalseatslag4_02))>0



gen ls=0
replace ls=1 if gs==1 & trappasslag_02==1
replace ls=1 if gs==1 & trappasslag2_02==1
replace ls=1 if gs==1 & trappasslag3_02==1


gen ls2=0
replace ls2=1 if gs==1 & moralpasslag_02==1
replace ls2=1 if gs==1 & moralpasslag2_02==1
replace ls2=1 if gs==1 & moralpasslag3_02==1


*Learneffect 1 is for Instrumental (TRAP) policy, learneffect 2 then is for Symbolic policy. Same holds for political measures.
gen learnseat=ls 
gen learnseat2=ls2







*Creating other various IVS
*These are smaller codes for simpler varaibles, each will have it's own brief explanation



*SImilarity scores for Party of Governor
*straightforward, 0 they are not the same, 1 they are. 0 values for governor denote GOP governors, 1 is DEM, the rare .5 is Independent
gen samegov=0
replace samegov=1 if (govparty_c_01 + govparty_c_02)==2
replace samegov=1 if (govparty_c_01 + govparty_c_02)==0

gen gopgovs=0
replace gopgovs=1 if samegov==1 & govparty_c_01==0

*Unified Government Scores 
*again a simple one. 1 they are both unified, 0 they are not

* Unified Dem government for both states
gen samedem=0
replace samedem=1 if (dem_unified_01 + dem_unified_02)==2                                            
// Unified Rep Government forboth states             
gen samerep=0
replace samerep=1 if (rep_unified_01 + rep_unified_02)==2


*Citizen and State ideology similarity measures
*Another aboslute difference emulation variable

gen citid=.
replace citid=(abs(citi6016_01 - citi6016_02))								
gen stateid=.
replace stateid=(abs(inst6017_nom_01 - inst6017_nom_02))	



* Religous similarity measures
*another emulation varaible looking at abs differences
* I borrow Kreitzer 2015's population measures which are transformed. The early multiplcations are to make the coefficents and SE's a little more table-friendly

gen temp1=(rescaledpopsize_01*1000)
gen temp2=(cath_adherent_01/10)
gen temp3=(fund_adherent_01/10)


gen cath2=(temp2/temp1)
gen prot2=(temp3/temp1)


gen protestants=.
replace protestants=(abs((temp3/temp1) - (temp3_02/temp1_02))) 

gen catholics=.
replace catholics=(abs((temp2/temp1) - (temp2_02/temp1_02))) 

*these are Main Effect calculations for religious varaibles, also scaled to population
gen catha=(cath_adherent_01/rescaledpopsize_01)
gen prota=(fund_adherent_01/rescaledpopsize_01)

*Abortion Public Opinion SImilarity Variable
*Another emulation abs diff varaible
gen poabort=.
replace poabort=(abs(abortpo_01 - abortpo_02)) 



**Misc. Model specs

**Drop pre-90 years (These are no longer useful)
drop if year_01 <1993
drop if year_02 <1993

*Drop same dyad pairs (these are no longer useful)
drop if state_01 == state_02

*This varaible is used in models to prevent emulatino bias. We are only ever looking at cases where emulation is possible, this value removes all where it is not. 
*Put differently, this value has a 1 if state B has a policy passed and state A does not, 0 otherwise. Same for instrumental and symbolic policy.
gen nobiastrap=0
replace nobiastrap=1 if a24lag_01 == 0 & a24lag_02	==1
replace nobiastrap=1 if a25lag_01 == 0 & a25lag_02	==1
replace nobiastrap=1 if a26lag_01 == 0 & a26lag_02	==1

gen nobiasmoral=0		
replace nobiasmoral=1 if a1lag_01 == 0 & a1lag_02	==1
replace nobiasmoral=1 if a15lag_01 == 0 & a15lag_02	==1
replace nobiasmoral=1 if a29lag_01 == 0 & a29lag_02	==1		
replace nobiasmoral=1 if a31lag_01 == 0 & a31lag_02	==1	






******SMM learning
*Rate of SMM per 100000 hospitilizations. Looking for drop to get 1

gen wlp=0
replace wlp=1 if (smm10000_02 - smm10000lag_02) < 0  

gen wlp2=0
replace wlp2=1 if (smm10000lag_02 - smm10000lag2_02) < 0


gen wpl=0
replace wpl=1 if wlp==1 & trappasslag_02==1
replace wpl=1 if wlp==1 & trappasslag2_02==1
replace wpl=1 if wlp2==1 & trappasslag2_02==1
replace wpl=1 if wlp==1 & trappasslag3_02==1
replace wpl=1 if wlp2==1 & trappasslag3_02==1



gen wpl2=0
replace wpl2=1 if wlp==1 & moralpasslag_02==1
replace wpl2=1 if wlp==1 & moralpasslag2_02==1
replace wpl2=1 if wlp2==1 & moralpasslag2_02==1
replace wpl2=1 if wlp==1 & moralpasslag3_02==1
replace wpl2=1 if wlp2==1 & moralpasslag3_02==1
 
 
gen learnsmm=wpl
gen learnsmm2=wpl2

***Robustness Check Section
**ALternate learning timeframes, same as above but looking at different periods of time.




drop lp
drop lp2
drop pl
drop pl2

*One year
gen lp=0
replace lp=1 if (provnum_02 - provnumlag_02) < 0  

gen pl=0
replace pl=1 if lp==1 & trappasslag_02==1

gen pl2=0
replace pl2=1 if lp==1 & moralpasslag_02==1

gen learnprovtime1=pl
gen learnprov2time1=pl2

*three years
drop lp
drop pl
drop pl2


gen lp=0
replace lp=1 if (provnum_02 - provnumlag_02) < 0  

gen lp2=0
replace lp2=1 if (provnumlag_02 - provnumlag2_02) < 0

gen lp3=0
replace lp3=1 if (provnumlag2_02 - provnumlag3_02) < 0

gen pl=0
replace pl=1 if lp==1 & trappasslag_02==1
replace pl=1 if lp==1 & trappasslag2_02==1
replace pl=1 if lp2==1 & trappasslag2_02==1
replace pl=1 if lp==1 & trappasslag3_02==1
replace pl=1 if lp2==1 & trappasslag3_02==1

replace pl=1 if lp3==1 & trappasslag3_02==1




gen pl2=0
replace pl2=1 if lp==1 & moralpasslag_02==1
replace pl2=1 if lp==1 & moralpasslag2_02==1
replace pl2=1 if lp2==1 & moralpasslag2_02==1
replace pl2=1 if lp==1 & moralpasslag3_02==1
replace pl2=1 if lp2==1 & moralpasslag3_02==1
 
replace pl2=1 if lp3==1 & moralpasslag3_02==1

 
gen learnprovtime3=pl
gen learnprov2time3=pl2



