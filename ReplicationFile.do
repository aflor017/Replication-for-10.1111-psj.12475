*****Replication Syntax for PSJ Publication
*****Prepared by: Andrew R. Flores
*****June 29, 2022

*****Program functions to use FIML estimation with the marings command:
pr bogus ,eclass
    tempname tb tV b V sample    
    mat `tb' = e(b)
    mat `tV' = e(V)
	mat `b' = J(1,18,.)
	mat `V' = J(18,18,.)
	mat `b'[1,1] = 0
	mat `b'[1,4] = 0
	mat `b'[1,6] = 0
	mat `b'[1,7] = 0
	mat `b'[1,8] = 0
	mat `b'[1,10] = 0
	mat `b'[1,2] = `tb'[1,2]
	mat `b'[1,3] = `tb'[1,3]
	mat `b'[1,5] = `tb'[1,1]
	mat `b'[1,9] = `tb'[1,4]
	forvalues i = 5(1)12 {
	mat `b'[1,`i'+6] = `tb'[1,`i']
	}
    mat coln `b' =  0b.adtype 1.adtype 2.adtype 0b.ptake 1.ptake  0b.adtype#0b.ptake  0b.adtype#1o.ptake 1o.adtype#0b.ptake 1.adtype#1.ptake  2o.adtype#0b.ptake 2.adtype#1.ptake age pid7 coll_grad female white trad _cons
	mat rown `b' = y1  
	forvalues i = 1(1)18 {
	mat `V'[`i',1] = 0
	}
	forvalues i = 4(1)18 {
	mat `V'[`i',4] = 0
	}
	forvalues i = 6(1)18 {
	mat `V'[`i',6] = 0
	}
	forvalues i = 7(1)18 {
	mat `V'[`i',7] = 0
	}
	forvalues i = 8(1)18 {
	mat `V'[`i',8] = 0
	}
	forvalues i = 10(1)18 {
	mat `V'[`i',10] = 0
	}
	forvalues i = 1(1)4 {
	mat `V'[4,`i'] = 0
	}
	forvalues i = 1(1)6 {
	mat `V'[6,`i'] = 0
	}
	forvalues i = 1(1)7 {
	mat `V'[7,`i'] = 0
	}
	forvalues i = 1(1)8 {
	mat `V'[8,`i'] = 0
	}
	forvalues i = 1(1)10 {
	mat `V'[10,`i'] = 0
	}
	forvalues i = 5(1)12 {
	mat `V'[`i'+6,2] = `tV'[`i',2]
	}
	forvalues i = 5(1)12 {
	mat `V'[`i'+6,3] = `tV'[`i',3]
	}
	forvalues i = 5(1)12 {
	mat `V'[`i'+6,5] = `tV'[`i',1]
	}
	forvalues i = 5(1)12 {
	mat `V'[`i'+6,9] = `tV'[`i',4]
	}
	forvalues i = 5(1)12 {
	mat `V'[`i'+6,11] = `tV'[`i',5]
	}
	forvalues i = 6(1)12 {
	mat `V'[`i'+6,12] = `tV'[`i',6]
	}
	forvalues i = 7(1)12 {
	mat `V'[`i'+6,13] = `tV'[`i',7]
	}
	forvalues i = 8(1)12 {
	mat `V'[`i'+6,14] = `tV'[`i',8]
	}
	forvalues i = 9(1)12 {
	mat `V'[`i'+6,15] = `tV'[`i',9]
	}
	forvalues i = 10(1)12 {
	mat `V'[`i'+6,16] = `tV'[`i',10]
	}
	forvalues i = 11(1)12 {
	mat `V'[`i'+6,17] = `tV'[`i',11]
	}
	mat `V'[18,18] = `tV'[12,12]
	mat `V'[2,2] = `tV'[2,2]
	mat `V'[3,2] = `tV'[3,2]
	mat `V'[5,2] = `tV'[2,1]
	mat `V'[9,2] = `tV'[4,2]
	mat `V'[3,3] = `tV'[3,3]
	mat `V'[5,3] = `tV'[3,1]
	mat `V'[5,5] = `tV'[1,1]
	mat `V'[9,5] = `tV'[4,1]
	mat `V'[9, 3] = `tV'[4,3]
	mat `V'[9,9] = `tV'[4,4]
	forvalues i = 1(1)18 {
	forvalues j = 1(1)18 {
	mat `V'[`i',`j'] = `V'[`j',`i']
	}
	}
    mat rown `V' = 0b.adtype 1.adtype 2.adtype 0b.ptake 1.ptake  0b.adtype#0b.ptake  0b.adtype#1o.ptake 1o.adtype#0b.ptake 1.adtype#1.ptake  2o.adtype#0b.ptake 2.adtype#1.ptake age pid7 coll_grad female white trad _cons
    mat coln `V' = 0b.adtype 1.adtype 2.adtype 0b.ptake 1.ptake  0b.adtype#0b.ptake  0b.adtype#1o.ptake 1o.adtype#0b.ptake 1.adtype#1.ptake  2o.adtype#0b.ptake 2.adtype#1.ptake age pid7 coll_grad female white trad _cons
	mat list `b'
	mat list `V'
    g `sample' = e(sample)
    eret post `b' `V' , e(`sample')
end

pr bogus2 ,eclass
    tempname tb tV b V sample    
    mat `tb' = e(b)
    mat `tV' = e(V)
	mat `b' = J(1,14,.)
	mat `V' = J(14,14,.)
	mat `b'[1,2] = 0
	mat `b'[1,4] = 0
	mat `b'[1,6] = 0
	mat `b'[1,1] = `tb'[1,1]
	mat `b'[1,3] = `tb'[1,2]
	mat `b'[1,5] = `tb'[1,3]
	mat `b'[1,7] = `tb'[1,4]
	forvalues i = 5(1)11 {
	mat `b'[1,`i'+3] = `tb'[1,`i']
	}
    mat coln `b' =  transportability 1b.adtype 2.adtype 1b.adtype#co.transportability 2.adtype#c.transportability 0b.ptake 1.ptake age pid7 coll_grad female white trad _cons
	mat rown `b' = y1  
	forvalues i = 2(1)14 {
	mat `V'[`i',2] = 0
	}
	forvalues i = 4(1)14 {
	mat `V'[`i',4] = 0
	}
	forvalues i = 6(1)14 {
	mat `V'[`i',6] = 0
	}
	forvalues i = 1(1)2 {
	mat `V'[2,`i'] = 0
	}
	forvalues i = 1(1)4 {
	mat `V'[4,`i'] = 0
	}
	forvalues i = 1(1)6 {
	mat `V'[6,`i'] = 0
	}
	forvalues i = 4(1)11 {
	mat `V'[`i'+3,1] = `tV'[`i',1]
	}
	forvalues i = 4(1)11 {
	mat `V'[`i'+3,3] = `tV'[`i',2]
	}
	forvalues i = 4(1)11 {
	mat `V'[`i'+3,5] = `tV'[`i',3]
	}
	forvalues i = 4(1)11 {
	mat `V'[`i'+3,7] = `tV'[`i',4]
	}
	forvalues i = 5(1)11 {
	mat `V'[`i'+3,8] = `tV'[`i',5]
	}
	forvalues i = 6(1)11 {
	mat `V'[`i'+3,9] = `tV'[`i',6]
	}
	forvalues i = 7(1)11 {
	mat `V'[`i'+3,10] = `tV'[`i',7]
	}
	forvalues i = 8(1)11 {
	mat `V'[`i'+3,11] = `tV'[`i',8]
	}
	forvalues i = 9(1)11 {
	mat `V'[`i'+3,12] = `tV'[`i',9]
	}
	forvalues i = 10(1)11 {
	mat `V'[`i'+3,13] = `tV'[`i',10]
	}
	mat `V'[14,14] = `tV'[11,11]
	mat `V'[1,1] = `tV'[1,1]
	mat `V'[3,1] = `tV'[2,1]
	mat `V'[5,1] = `tV'[3,1]
	mat `V'[3,3] = `tV'[2,2]
	mat `V'[5,3] = `tV'[3,2]
	mat `V'[5,5] = `tV'[3,3]
	forvalues i = 1(1)14 {
	forvalues j = 1(1)14 {
	mat `V'[`i',`j'] = `V'[`j',`i']
	}
	}
    mat rown `V' = transportability 1b.adtype 2.adtype 1b.adtype#co.transportability 2.adtype#c.transportability 0b.ptake 1.ptake age pid7 coll_grad female white trad _cons
    mat coln `V' = transportability 1b.adtype 2.adtype 1b.adtype#co.transportability 2.adtype#c.transportability 0b.ptake 1.ptake age pid7 coll_grad female white trad _cons
	mat list `b'
	mat list `V'
    g `sample' = e(sample)
    eret post `b' `V' , e(`sample')
end

pr bogus3 ,eclass
    tempname tb tV b V sample    
    mat `tb' = e(b)
    mat `tV' = e(V)
	mat `b' = J(1,30,.)
	mat `V' = J(30,30,.)
	mat `b'[1,2] = 0
	mat `b'[1,5] = 0
	mat `b'[1,8] = 0
	mat `b'[1,10] = 0
	mat `b'[1,12] = 0
	mat `b'[1,13] = 0
	mat `b'[1,14] = 0
	mat `b'[1,16] = 0
	mat `b'[1,18] = 0
	mat `b'[1,19] = 0
	mat `b'[1,20] = 0
	mat `b'[1,22] = 0
	mat `b'[1,1] = `tb'[1,1]
	mat `b'[1,3] = `tb'[1,2]
	mat `b'[1,4] = `tb'[1,3]
	mat `b'[1,6] = `tb'[1,4]
	mat `b'[1,7] = `tb'[1,5]
	mat `b'[1,9] = `tb'[1,6]
	mat `b'[1,11] = `tb'[1,7]
	mat `b'[1,15] = `tb'[1,8]
	mat `b'[1,17] = `tb'[1,9]
	mat `b'[1,21] = `tb'[1,10]
	forvalues i = 11(1)18 {
	mat `b'[1,`i'+12] = `tb'[1,`i']
	}
    mat coln `b' =  absorbption 0b.adtype 1.adtype 2.adtype 0b.adtype#co.absorbption 1.adtype#c.absorbption 2.adtype#c.absorbption 0b.ptake 1.ptake 0b.ptake#co.absorbption 1.ptake#c.absorbption 0b.adtype#0b.ptake 0b.adtype#1o.ptake 1o.adtype#0b.ptake 1.adtype#1.ptake 2o.adtype#0b.ptake 2.adtype#1.ptake 0b.adtype#0b.ptake#co.absorbption 0b.adtype#1o.ptake#co.absorbption 1o.adtype#0b.ptake#co.absorbption 1.adtype#1.ptake#c.absorbption 2o.adtype#0b.ptake#co.absorbption 2.adtype#1.ptake#c.absorbption age pid7 coll_grad female white trad _cons
	mat rown `b' = y1  
	forvalues i = 2(1)30 {
	mat `V'[`i',2] = 0
	}
	forvalues i = 5(1)30 {
	mat `V'[`i',5] = 0
	}
	forvalues i = 8(1)30 {
	mat `V'[`i',8] = 0
	}
	forvalues i = 10(1)30 {
	mat `V'[`i',10] = 0
	}
	forvalues i = 12(1)30 {
	mat `V'[`i',12] = 0
	}
	forvalues i = 13(1)30 {
	mat `V'[`i',13] = 0
	}
	forvalues i = 14(1)30 {
	mat `V'[`i',14] = 0
	}
	forvalues i = 16(1)30 {
	mat `V'[`i',16] = 0
	}
	forvalues i = 18(1)30 {
	mat `V'[`i',18] = 0
	}
	forvalues i = 19(1)30 {
	mat `V'[`i',19] = 0
	}
	forvalues i = 20(1)30 {
	mat `V'[`i',20] = 0
	}
	forvalues i = 22(1)30 {
	mat `V'[`i',22] = 0
	}
	forvalues i = 1(1)2 {
	mat `V'[2,`i'] = 0
	}
	forvalues i = 1(1)5 {
	mat `V'[5,`i'] = 0
	}
	forvalues i = 1(1)8 {
	mat `V'[8,`i'] = 0
	}
	forvalues i = 1(1)10 {
	mat `V'[10,`i'] = 0
	}
	forvalues i = 1(1)12 {
	mat `V'[12,`i'] = 0
	}
	forvalues i = 1(1)13 {
	mat `V'[13,`i'] = 0
	}
	forvalues i = 1(1)14 {
	mat `V'[14,`i'] = 0
	}
	forvalues i = 1(1)16 {
	mat `V'[16,`i'] = 0
	}
	forvalues i = 1(1)18 {
	mat `V'[18,`i'] = 0
	}
	forvalues i = 1(1)19 {
	mat `V'[19,`i'] = 0
	}
	forvalues i = 1(1)20 {
	mat `V'[20,`i'] = 0
	}
	forvalues i = 1(1)22 {
	mat `V'[22,`i'] = 0
	}
	forvalues i = 11(1)18 {
	mat `V'[`i'+12,1] = `tV'[`i',1]
	}
	forvalues i = 11(1)18 {
	mat `V'[`i'+12,3] = `tV'[`i',2]
	}
	forvalues i = 11(1)18 {
	mat `V'[`i'+12,4] = `tV'[`i',3]
	}
	forvalues i = 11(1)18 {
	mat `V'[`i'+12,6] = `tV'[`i',4]
	}
	forvalues i = 11(1)18 {
	mat `V'[`i'+12,7] = `tV'[`i',5]
	}
	forvalues i = 11(1)18 {
	mat `V'[`i'+12,9] = `tV'[`i',6]
	}
	forvalues i = 11(1)18 {
	mat `V'[`i'+12,11] = `tV'[`i',7]
	}
	forvalues i = 11(1)18 {
	mat `V'[`i'+12,15] = `tV'[`i',8]
	}
	forvalues i = 11(1)18 {
	mat `V'[`i'+12,17] = `tV'[`i',9]
	}
	forvalues i = 11(1)18 {
	mat `V'[`i'+12,21] = `tV'[`i',10]
	}
	forvalues i = 11(1)18 {
	mat `V'[`i'+12,23] = `tV'[`i',11]
	}
	forvalues i = 12(1)18 {
	mat `V'[`i'+12,24] = `tV'[`i',12]
	}
	forvalues i = 13(1)18 {
	mat `V'[`i'+12,25] = `tV'[`i',13]
	}
	forvalues i = 14(1)18 {
	mat `V'[`i'+12,26] = `tV'[`i',14]
	}
	forvalues i = 15(1)18 {
	mat `V'[`i'+12,27] = `tV'[`i',15]
	}
	forvalues i = 16(1)18 {
	mat `V'[`i'+12,28] = `tV'[`i',16]
	}
	forvalues i = 17(1)18 {
	mat `V'[`i'+12,29] = `tV'[`i',17]
	}
	mat `V'[30,30] = `tV'[18,18]
	mat `V'[1,1] = `tV'[1,1]
	mat `V'[3,1] = `tV'[2,1]
	mat `V'[4,1] = `tV'[3,1]
	mat `V'[6,1] = `tV'[4,1]
	mat `V'[7,1] = `tV'[5,1]
	mat `V'[9,1] = `tV'[6,1]
	mat `V'[11,1] = `tV'[7,1]
	mat `V'[15,1] = `tV'[8,1]
	mat `V'[17,1] = `tV'[9,1]
	mat `V'[21,1] = `tV'[10,1]
	mat `V'[3,3] = `tV'[2,2]
	mat `V'[4,3] = `tV'[3,2]
	mat `V'[6,3] = `tV'[4,2]
	mat `V'[7,3] = `tV'[5,2]
	mat `V'[9,3] = `tV'[6,2]
	mat `V'[11,3] = `tV'[7,2]
	mat `V'[15,3] = `tV'[8,2]
	mat `V'[17,3] = `tV'[9,2]
	mat `V'[21,3] = `tV'[10,2]	
	mat `V'[4,4] = `tV'[3,3]
	mat `V'[6,4] = `tV'[4,3]
	mat `V'[7,4] = `tV'[5,3]
	mat `V'[9,4] = `tV'[6,3]
	mat `V'[11,4] = `tV'[7,3]
	mat `V'[15,4] = `tV'[8,3]
	mat `V'[17,4] = `tV'[9,3]
	mat `V'[21,4] = `tV'[10,3]
	mat `V'[6,6] = `tV'[4,4]
	mat `V'[7,6] = `tV'[5,4]
	mat `V'[9,6] = `tV'[6,4]
	mat `V'[11,6] = `tV'[7,4]
	mat `V'[15,6] = `tV'[8,4]
	mat `V'[17,6] = `tV'[9,4]
	mat `V'[21,6] = `tV'[10,4]
	mat `V'[7,7] = `tV'[5,5]
	mat `V'[9,7] = `tV'[6,5]
	mat `V'[11,7] = `tV'[7,5]
	mat `V'[15,7] = `tV'[8,5]
	mat `V'[17,7] = `tV'[9,5]
	mat `V'[21,7] = `tV'[10,5]
	mat `V'[9,9] = `tV'[6,6]
	mat `V'[11,9] = `tV'[7,6]
	mat `V'[15,9] = `tV'[8,6]
	mat `V'[17,9] = `tV'[9,6]
	mat `V'[21,9] = `tV'[10,6]
	mat `V'[11,11] = `tV'[7,7]
	mat `V'[15,11] = `tV'[8,7]
	mat `V'[17,11] = `tV'[9,7]
	mat `V'[21,11] = `tV'[10,7]
	mat `V'[15,15] = `tV'[8,8]
	mat `V'[17,15] = `tV'[9,8]
	mat `V'[21,15] = `tV'[10,8]
	mat `V'[17,17] = `tV'[9,9]
	mat `V'[21,17] = `tV'[10,9]
	mat `V'[21,21] = `tV'[10,10]
	forvalues i = 1(1)30 {
	forvalues j = 1(1)30 {
	mat `V'[`i',`j'] = `V'[`j',`i']
	}
	}
    mat rown `V' = absorbption 0b.adtype 1.adtype 2.adtype 0b.adtype#co.absorbption 1.adtype#c.absorbption 2.adtype#c.absorbption 0b.ptake 1.ptake 0b.ptake#co.absorbption 1.ptake#c.absorbption 0b.adtype#0b.ptake 0b.adtype#1o.ptake 1o.adtype#0b.ptake 1.adtype#1.ptake 2o.adtype#0b.ptake 2.adtype#1.ptake 0b.adtype#0b.ptake#co.absorbption 0b.adtype#1o.ptake#co.absorbption 1o.adtype#0b.ptake#co.absorbption 1.adtype#1.ptake#c.absorbption 2o.adtype#0b.ptake#co.absorbption 2.adtype#1.ptake#c.absorbption age pid7 coll_grad female white trad _cons
    mat coln `V' = absorbption 0b.adtype 1.adtype 2.adtype 0b.adtype#co.absorbption 1.adtype#c.absorbption 2.adtype#c.absorbption 0b.ptake 1.ptake 0b.ptake#co.absorbption 1.ptake#c.absorbption 0b.adtype#0b.ptake 0b.adtype#1o.ptake 1o.adtype#0b.ptake 1.adtype#1.ptake 2o.adtype#0b.ptake 2.adtype#1.ptake 0b.adtype#0b.ptake#co.absorbption 0b.adtype#1o.ptake#co.absorbption 1o.adtype#0b.ptake#co.absorbption 1.adtype#1.ptake#c.absorbption 2o.adtype#0b.ptake#co.absorbption 2.adtype#1.ptake#c.absorbption age pid7 coll_grad female white trad _cons
	mat list `b'
	mat list `V'
    g `sample' = e(sample)
    eret post `b' `V' , e(`sample')
end


*sample descriptors:
mean female coll_grad 
tab race_wbh
tab pid3
sum age

*traditionalism: alpha .60
alpha Q7_1-Q7_4, gen(trad)

*absorption, check scale: alpha 0.878
alpha Q6_1-Q6_9, gen(absorbption)

*narrative treatment assignment:
tab adtype

*perpsective-take assignment:
tab ptake

*transportability; Alpha = .84
alpha transport_1-transport_3, gen(transportability)

corr absorbption transportability

*Table 1
tab adtype ptake, cell 

*regression of adtype on transportability
reg transportability i.adtype

*propensity score estimation: (Table S.7)
logit stayed i.treat##(c.age##c.age c.pid7 c.coll_grad c.female c.white c.trad c.ideo i.region)
predict wt
gen pwt = 1/wt

svyset _n [pweight = pwt]

*Bathroom policy DV in the control group:
svy, subpop(if ptake==0 & adtype==0): tab Q39_alt2

*Table 2: 
sum Q40_2 [aweight = pwt] if ptake==0 & adtype==0
sum Q40_4 [aweight = pwt] if ptake==0 & adtype==0
sum Q40_3 [aweight = pwt] if ptake==0 & adtype==0
sum Q40_1 [aweight = pwt] if ptake==0 & adtype==0

**To reproduce Figures, refer to the R-file.

*Table 3:
medeff (regress transportability adtype ptake age pid7 coll_grad female white trad ) (regress Q39_bin adtype transportability ptake age pid7 coll_grad female white trad ) [pweight=pwt], mediate(transportability) treat(adtype 2 1) seed(1561) 
medeff (regress transportability adtype ptake age pid7 coll_grad female white trad ) (regress Q40_2 adtype transportability ptake age pid7 coll_grad female white trad ) [pweight=pwt], mediate(transportability) treat(adtype 1 2) seed(1561) 
medeff (regress transportability adtype ptake age pid7 coll_grad female white trad ) (regress Q40_4 adtype transportability ptake age pid7 coll_grad female white trad ) [pweight=pwt], mediate(transportability) treat(adtype 1 2) seed(1561) 

***APPENDICES:

*Table S.1:
sum age pid7 coll_grad female white trad absorbption ibn.Q39_alt2 Q40_2 Q40_4 Q40_3 Q40_1 transportability [aweight=pwt]

*Table S.2:

*model 1
mlogit Q39_alt2 i.adtype##i.ptake age pid7 coll_grad female white trad [pweight=pwt], base(3)
** treatment effects by adtype, ptake, and adtype by ptake -> Used for Figure 1A and 1B
margins, dydx(adtype) 
margins, dydx(ptake) 
margins ptake, dydx(adtype) 

*model 2
sem (Q40_2 <- ptake adtype_2 adtype_3 ptad2 ptad3 age pid7 coll_grad female white trad) if attention==1 & treat!=. [pweight=pwt], method(mlmv) nocapslatent
** treatment effects for Figure 2A and 2B
bogus     
margins [pweight=pwt], dydx(adtype)
margins [pweight=pwt], dydx(ptake)
margins ptake [pweight=pwt], dydx(adtype)

*model 3
sem (Q40_4 <- ptake adtype_2 adtype_3 ptad2 ptad3 age pid7 coll_grad female white trad) if attention==1 & treat!=. [pweight=pwt], method(mlmv) nocapslatent
** treatment effects for Figure 2A and 2B
bogus     
margins [pweight=pwt], dydx(adtype)
margins [pweight=pwt], dydx(ptake)
margins ptake [pweight=pwt], dydx(adtype)

*model 4
sem (Q40_3 <- ptake adtype_2 adtype_3 ptad2 ptad3 age pid7 coll_grad female white trad) if attention==1 & treat!=. [pweight=pwt], method(mlmv) nocapslatent
** treatment effects for Figure 2A and 2B
bogus     
margins [pweight=pwt], dydx(adtype)
margins [pweight=pwt], dydx(ptake)
margins ptake [pweight=pwt], dydx(adtype)

*model 5
sem (Q40_1 <- ptake adtype_2 adtype_3 ptad2 ptad3 age pid7 coll_grad female white trad) if attention==1 & treat!=. [pweight=pwt], method(mlmv) nocapslatent
** treatment effects for Figure 2A and 2B
bogus     
margins [pweight=pwt], dydx(adtype)
margins [pweight=pwt], dydx(ptake)
margins ptake [pweight=pwt], dydx(adtype)

*Table S.3:
* model 6
mlogit Q39_alt2 c.transportability##i.adtype i.ptake age pid7 coll_grad female white trad if attention==1 [pweight=pwt], base(3)
** model predictions by transportability for Figure 3A
margins adtype, at(transportab==(0(10)100)) predict(outcome(1))

* model 7
sem (Q40_2 <- transportability adtype_3 textXtransp ptake age pid7 coll_grad female white trad) [pweight=pwt] if adtype==1 | adtype==2, method(mlmv) nocapslatent
** model predictions by transportability for Figure 3B
bogus2
margins adtype [pweight=pwt], at(transportability==(0(10)100))

*model 8
sem (Q40_4 <- transportability adtype_3 textXtransp ptake age pid7 coll_grad female white trad) [pweight=pwt] if adtype==1 | adtype==2, method(mlmv) nocapslatent
** model predictions by transportability for FIgure 3C
bogus2
margins adtype [pweight=pwt], at(transportability==(0(10)100))

*Table S.4:
*model 9
mlogit Q39_alt2 c.absorb##i.adtype##i.ptake age pid7 coll_grad female white trad if attention==1 [pweight=pwt], base(3)
*left panel of Figure 4
margins ptake, at(absorb==(1(.5)5)) dydx(adtype) predict(outcome(1))

*model 10
sem (Q40_2 <- absorb adtype_2 adtype_3 adtype_2Xabsorb adtype_3Xabsorb ptake ptakeXabsorb ad2pt ad3pt ad2ptXabsorb ad3ptXabsorb age pid7 coll_grad female white trad) if attention==1 [pweight=pwt], method(mlmv) nocapslatent
* middle panel of Figure 4
bogus3
margins ptake [pweight=pwt], at(absorb==(1(.5)5)) dydx(adtype)

*model 11
sem (Q40_4 <- absorb adtype_2 adtype_3 adtype_2Xabsorb adtype_3Xabsorb ptake ptakeXabsorb ad2pt ad3pt ad2ptXabsorb ad3ptXabsorb age pid7 coll_grad female white trad) if attention==1 [pweight=pwt], method(mlmv) nocapslatent
* right panel of Figure 4
bogus3
margins ptake [pweight=pwt], at(absorb==(1(.5)5)) dydx(adtype)

*Table S5 (balance checks)
reg age i.adtype##i.ptake
svy: reg age i.adtype##i.ptake
reg pid7 i.adtype##i.ptake
svy: reg pid7 i.adtype##i.ptake
tab coll_grad treat, chi
svy: tab coll_grad treat
tab female treat, chi
svy: tab female treat
tab white treat, chi
svy: tab white treat
reg trad i.adtype##i.ptake
svy: reg trad i.adtype##i.ptake
reg absorbption i.adtype##i.ptake
svy: reg absorbption i.adtype##i.ptake

*Table S6:
tab stayed treat, col chi
anova stayed i.treat

*Figre S.1: bounds models and results:
/* Data processing to create worst case bounds:
gen Q39_ub = Q39_bin
replace Q39_ub = 1 if treat!=0 & Q39_ub==.
replace Q39_ub = 0 if treat==0 & Q39_ub==.

gen Q39_lb = Q39_bin
replace Q39_lb = 0 if treat!=0 & Q39_lb==.
replace Q39_lb = 1 if treat==0 & Q39_lb==.
*/

reg Q39_ub i.adtype i.ptake i.adtype#i.ptake age pid7 coll_grad female white trad if attention==1 
*view and read upper bound with 90% CI
margins, dydx(adtype) level(90)
*perspective take upper bound with 90% CI
margins, dydx(ptake) level(90)
*Figure S1.B upper bound & 90% CI
margins ptake, dydx(adtype)  level(90)

reg Q39_lb i.adtype i.ptake i.adtype#i.ptake age pid7 coll_grad female white trad if attention==1 
* view and read lower bound with 90% CI
margins, dydx(adtype) level(90)
*perspective take lower bound with 90% CI
margins, dydx(ptake) level(90)
*Figure S1.B. lower bounds & 90% CI 
margins ptake, dydx(adtype)  level(90)

*Figure S.2:
/* Data preprocessing for worst case:
gen Q40_2ub = Q40_2
replace Q40_2ub = 7 if treat!=0 & Q40_2ub==.
replace Q40_2ub = 1 if treat==0 & Q40_2ub==.

gen Q40_2lb = Q40_2
replace Q40_2lb = 1 if treat!=0 & Q40_2lb==.
replace Q40_2lb = 7 if treat==0 & Q40_2lb==.

gen Q40_4ub = Q40_4
replace Q40_4ub = 7 if treat!=0 & Q40_4ub==.
replace Q40_4ub = 1 if treat==0 & Q40_4ub==.

gen Q40_4lb = Q40_4
replace Q40_4lb = 1 if treat!=0 & Q40_4lb==.
replace Q40_4lb = 7 if treat==0 & Q40_4lb==.
*/

reg Q40_2ub i.adtype i.ptake i.adtype#i.ptake age pid7 coll_grad female white trad if attention==1 
* Discriminates view & read upper bound and 90% CI
margins, dydx(adtype) level(90)
* Discrminates perspective take upper bound and 90% CI
margins, dydx(ptake) level(90)
* Discriminates right panel upper bound & CI
margins ptake, dydx(adtype)  level(90)

reg Q40_2lb i.adtype i.ptake i.adtype#i.ptake age pid7 coll_grad female white trad if attention==1 
* Discriminates view & read lower bound and 90% CI
margins, dydx(adtype) level(90)
* Discrminates perspective take lower bound and 90% CI
margins, dydx(ptake) level(90)
* Discriminates right panel lower bound & CI
margins ptake, dydx(adtype)  level(90)

reg Q40_4ub i.adtype i.ptake i.adtype#i.ptake age pid7 coll_grad female white trad if attention==1 
* Safety view & read upper bound and 90% CI
margins, dydx(adtype) level(90)
* Safety perspective take upper bound and 90% CI
margins, dydx(ptake) level(90)
* Safety right panel upper bound and 90% CI
margins ptake, dydx(adtype)  level(90)

reg Q40_4lb i.adtype i.ptake i.adtype#i.ptake age pid7 coll_grad female white trad if attention==1 
* Safety view & read lower bound and 90% CI
margins, dydx(adtype) level(90)
* Safety perspective take lower bound and 90% CI
margins, dydx(ptake) level(90)
* Safety right panel lower bound and 90% CI
margins ptake, dydx(adtype)  level(90)
