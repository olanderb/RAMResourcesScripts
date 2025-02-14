
						   
*ECMEN calculation is based on the standard module available here: 
https://docs.wfp.org/api/documents/WFP-0000115416/download/

*Important to note: ECMEN calculation only includes expenditure on cash and own production - credit and assistance (gift/aid) should not be added 

*----------------------------------------------------------------------------------------------------------------------------------*
*1. Create variable for regular monthly household food expenditure	
*----------------------------------------------------------------------------------------------------------------------------------*
*Important note: add recall period of _1M or _7D to the variables names below depending on what has been selected for your CO. It is recommended to follow standard recall periods as in the module
*Label variables: 
lab var HHExpFCer_MN_1M "Cash expenditure value on cereals"
lab var HHExpFCer_CRD_1M "Credit expenditure value on cereals"
lab var HHExpFCer_GiftAid_1M "Assistance expenditure value on cereals"
lab var HHExpFCer_Own_1M "Own production expenditure value on cereals"
lab var HHExpFTub_MN_1M "Cash expenditure value on tubers"
lab var HHExpFTub_CRD_1M "Credit expenditure value on tubers"
lab var HHExpFTub_GiftAid_1M "Assistance expenditure value on tubers"
lab var HHExpFTub_Own_1M "Own production expenditure value on tubers"
lab var HHExpFPuls_MN_1M "Cash expenditure value on pulses & nuts"
lab var HHExpFPuls_CRD_1M "Credit expenditure value on pulses & nuts"
lab var HHExpFPuls_GiftAid_1M "Assistance expenditure value on pulses & nuts"
lab var HHExpFVeg_Own_1M "Own production expenditure value on pulses & nuts"
lab var HHExpFVeg_MN_1M "Cash expenditure value on vegetables"
lab var HHExpFVeg_CRD_1M "Credit expenditure value on vegetables"
lab var HHExpFVeg_GiftAid_1M "Assistance expenditure value on vegetables"
lab var HHExpFVeg_Own_1M "Own production expenditure value on vegetables"
lab var HHExpFFrt_MN_1M "Cash expenditure value on fruits"
lab var HHExpFFrt_CRD_1M "Credit expenditure value on fruits"
lab var HHExpFFrt_GiftAid_1M "Assistance expenditure value on fruits"
lab var HHExpFFrt_Own_1M "Own production expenditure value on fruits"
lab var HHExpFAnimMeat_MN_1M "Cash expenditure value on meat"
lab var HHExpFAnimMeat_CRD_1M "Credit expenditure value on meat"
lab var HHExpFAnimMeat_GiftAid_1M "Assistance expenditure value on meat"
lab var HHExpFAnimMeat_Own_1M "Own production expenditure value on meat"
lab var HHExpFAnimFish_MN_1M "Cash expenditure value on fish"
lab var HHExpFAnimFish_CRD_1M "Credit expenditure value on fish"
lab var HHExpFAnimFish_GiftAid_1M "Assistance expenditure value on fish"
lab var HHExpFAnimFish_Own_1M "Own production expenditure value on fish"
lab var HHExpFFats_MN_1M "Cash expenditure value on oil/fat/butter"
lab var HHExpFFats_CRD_1M "Credit expenditure value on oil/fat/butter"
lab var HHExpFFats_GiftAid_1M "Assistance expenditure value on oil/fat/butter"
lab var HHExpFFats_Own_1M "Own production expenditure value on oil/fat/butter"
lab var HHExpFDairy_MN_1M "Cash expenditure value on milk/dairy products"
lab var HHExpFDairy_CRD_1M "Credit expenditure value on milk/dairy products"
lab var HHExpFDairy_GiftAid_1M "Assistance expenditure value on milk/dairy products"
lab var HHExpFDairy_Own_1M "Own production expenditure value on milk/dairy products"
lab var HHExpFAnimEgg_MN_1M "Cash expenditure value on eggs"
lab var HHExpFAnimEgg_CRD_1M "Credit expenditure value on eggs"
lab var HHExpFAnimEgg_GiftAid_1M "Assistance expenditure value on eggs"
lab var HHExpFAnimEgg_Own_1M "Own production expenditure value on eggs"
lab var HHExpFSgr_MN_1M "Cash expenditure value on sugar"
lab var HHExpFSgr_CRD_1M "Credit expenditure value on sugar"
lab var HHExpFSgr_GiftAid_1M "Assistance expenditure value on sugar"
lab var HHExpFSgr_Own_1M "Own production expenditure value on sugar"
lab var HHExpFCond_MN_1M "Cash expenditure value on condiments"
lab var HHExpFCond_CRD_1M "Credit expenditure value on condiments"
lab var HHExpFCond_GiftAid_1M "Assistance expenditure value on condiments"
lab var HHExpFCond_Own_1M "Own production expenditure value on condiments"
lab var HHExpFBeverage_MN_1M "Cash expenditure value on beverages"
lab var HHExpFBeverage_CRD_1M "Credit expenditure value on beverages"
lab var HHExpFBeverage_GiftAid_1M "Assistance expenditure value on beverages"
lab var HHExpFBeverage_Own_1M "Own production expenditure value on beverages"
lab var HHExpFOut_MN_1M "Cash expenditure value on snacks consumed outside the home"
lab var HHExpFOut_CRD_1M "Credit expenditure value on beverages"
lab var HHExpFOut_GiftAid_1M "Assistance expenditure value on beverages"
lab var HHExpFOut_Own_1M "Own production expenditure value on beverages"

*Calculate the overall monthly food expenditure per household:
*If the expenditure was calculated separately for cash, credit, aid/gift and own production, calculate the overall total by summing them up 
*If the expenditure recall period is 7 days; make sure to transform it to 30 days 

*Monthly food purchase in cash
egen HHExpFood_MN_1M=rowtotal(HHExpFCer_MN_1M  HHExpFTub_MN_1M HHExpFPuls_MN_1M HHExpFVeg_MN_1M HHExpFFrt_MN_1M HHExpFAnimMeat_MN_1M HHExpFAnimFish_MN_1M HHExpFFats_MN_1M HHExpFDairy_MN_1M HHExpFAnimEgg_MN_1M HHExpFSgr_MN_1M HHExpFCond_MN_1M HHExpFBeverage_MN_1M HHExpFOut_MN_1M)
lab var HHExpFood_MN_1M "Total food expenditure on cash"

*Monthly food purchase on credit
egen HHExp_Food_CRD_1M=rowtotal(HHExpFCer_CRD_1M HHExpFTub_CRD_1M HHExpFPuls_CRD_1M HHExpFVeg_CRD_1M HHExpFFrt_CRD_1M HHExpFAnimMeat_CRD_1M HHExpFAnimFish_CRD_1M HHExpFFats_CRD_1M HHExpFDairy_CRD_1M HHExpFAnimEgg_CRD_1M HHExpFSgr_CRD_1M HHExpFCond_CRD_1M HHExpFBeverage_CRD_1M HHExpFOut_CRD_1M)
lab var HHExp_Food_CRD_1M "Total food expenditure on credit"

*Monthly food gift/aid value
egen HHExp_Food_GiftAid_1M=rowtotal(HHExpFCer_GiftAid_1M  HHExpFTub_GiftAid_1M HHExpFPuls_GiftAid_1M  HHExpFVeg_GiftAid_1M HHExpFFrt_GiftAid_1M HHExpFAnimMeat_GiftAid_1M HHExpFAnimFish_GiftAid_1M HHExpFFats_GiftAid_1M HHExpFDairy_GiftAid_1M HHExpFAnimEgg_GiftAid_1M HHExpFSgr_GiftAid_1M HHExpFCond_GiftAid_1M HHExpFBeverage_GiftAid_1M HHExpFOut_GiftAid_1M)
lab var HHExp_Food_GiftAid_1M "Total food expenditure from gift aid"

*Monthly food own-production value
egen HHExp_Food_Own_1M=rowtotal(HHExpFCer_Own_1M  HHExpFTub_Own_1M HHExpFPuls_Own_1M  HHExpFVeg_Own_1M HHExpFFrt_Own_1M HHExpFAnimMeat_Own_1M HHExpFAnimFish_Own_1M HHExpFFats_Own_1M HHExpFDairy_Own_1M HHExpFAnimEgg_Own_1M HHExpFSgr_Own_1M HHExpFCond_Own_1M HHExpFBeverage_Own_1M HHExpFOut_Own_1M)
lab var HHExp_Food_Own_1M "Total food expenditure from own production"
*----------------------------------------------------------------------------------------------------------------------------------------------------------------*
*2. Create variable for regular monthly household non-food expenditure	
*----------------------------------------------------------------------------------------------------------------------------------------------------------------*
*6 months recall period - variables labels:
lab var HHExpNFMedServ_MN_6M "Cash expenditure on health services"
lab var HHExpNFMedServ_CRD_6M "Credit expenditure on health services"
lab var HHExpNFMedServ_GiftAid_6M "Assistance expenditure value on health services"
lab var HHExpNFMedGood_MN_6M "Cash expenditure on medicines & health products" 
lab var HHExpNFMedGood_CRD_6M "Credit expenditure on medicines & health products"
lab var HHExpNFMedGood_GiftAid_6M "Assistance expenditure value on medicines & health products" 
lab var HHExpNFCloth_MN_6M "Cash expenditure on clothing and footwear" 
lab var HHExpNFCloth_CRD_6M "Credit expenditure on clothing and footwear" 
lab var HHExpNFCloth_GiftAid_6M "Assistance expenditure value on clothing and footwear" 
lab var HHExpNFEduFee_MN_6M "Cash expenditure on education services" 
lab var HHExpNFEduFee_CRD_6M "Credit expenditure on education services"
lab var HHExpNFEduFee_GiftAid_6M "Assistance expenditure value on education services" 
lab var HHExpNFEduGood_MN_6M "Cash expenditure on education goods" 
lab var HHExpNFEduGood_CRD_6M "Credit expenditure on education goods"
lab var HHExpNFEduGood_GiftAid_6M "Assistance expenditure value on education goods" 
lab var HHExpNFRent_MN_6M "Cash expenditure on rent" 
lab var HHExpNFRent_CRD_6M "Credit expenditure on rent" 
lab var HHExpNFRent_GiftAid _6M "Assistance expenditure value on rent"  
lab var HHExpNFHHSoft_MN_6M "Cash expenditure on household non-durable furniture and routine maintenance" 
lab var HHExpNFHHSoft_CRD_6M "Credit expenditure on household non-durable furniture and routine maintenance"
lab var HHExpNFHHSoft_GiftAid_6M "Assistance expenditure value on household non-durable furniture and routine maintenance"
lab var HHExpNFSav_MN_6M "Cash expenditure on savings"
lab var HHExpNFSav_CRD_6M "Credit expenditure on savings"
lab var HHExpNFSav_GiftAid_6M "Assistance expenditure on savings"
lab var HHExpNFDebt_MN_6M "Cash expenditure on debt repayment" 
lab var HHExpNFDebt_CRD_6M "Credit expenditure on debt repayment" 
lab var HHExpNFDebt_GiftAid_6M "Assistance expenditure on debt repayment" 
lab var HHExpNFInsurance_MN_6M "Cash expenditure on insurance"
lab var HHExpNFInsurance_CRD_6M "Credit expenditure on insurance" 
lab var HHExpNFInsurance_GiftAid_6M "Assistance expenditure value on insurance"

*1 month recall period - variables labels:
lab var HHExpNFAlcTobac_MN_1M "Cash expenditure on alcohol/tobacco"
lab var HHExpNFAlcTobac_CRD_1M "Credit expenditure on alcohol/tobacco"
lab var HHExpNFAlcTobac_GiftAid_1M "Assistance expenditure on alcohol/tobacco"
lab var HHExpNFHyg_MN_1M "Cash expenditure on soap/hygiene/personal care products"
lab var HHExpNFHyg_CRD_1M "Credit expenditure on soap/hygiene/personal care products"
lab var HHExpNFHyg_GiftAid_1M "Assistance expenditure on soap/hygiene/personal care products"
lab var HHExpNFTransp_MN_1M "Cash expenditure on transportation"
lab var HHExpNFTransp_CRD_1M "Credit expenditure on transportation"
lab var HHExpNFTransp_GiftAid_1M "Assistance expenditure on transportation"
lab var HHExpNFWat_MN_1M "Cash expenditure on water supply (domestic use)"
lab var HHExpNFWat_CRD_1M "Credit expenditure on water supply (domestic use)"
lab var HHExpNFWat_GiftAid_1M "Assistance expenditure on water supply (domestic use)"
lab var HHExpNFDwelServ_MN_1M "Cash expenditure on dwelling"
lab var HHExpNFDwelServ_CRD_1M "Credit expenditure on dwelling"
lab var HHExpNFDwelServ_GiftAid_1M "Assistance expenditure on dwelling"
lab var HHExpNFElec_MN_1M "Cash expenditure on electricity"
lab var HHExpNFElec_CRD_1M "Credit expenditure on electricity"
lab var HHExpNFElec_GiftAid_1M "Assistance expenditure on electricity"
lab var HHExpNFEnerg_MN_1M "Cash expenditure on energy (not electricity)"
lab var HHExpNFEnerg_CRD_1M "Credit expenditure on energy (not electricity)"
lab var HHExpNFEnerg_GiftAid_1M "Assistance expenditure on energy (not electricity)"
lab var HHExpNFPhone_MN_1M "Cash expenditure on phone"
lab var HHExpNFPhone_CRD_1M "Credit expenditure on phone"
lab var HHExpNFPhone_GiftAid_1M "Assistance expenditure on phone"
lab var HHExpNFSpec1_MN_1M "Cash expenditure on [specific to country]" 
lab var HHExpNFSpec1_CRD_1M "Credit expenditure on [Specific to country]" 
lab var HHExpNFSpec1_GiftAid_1M "Assistance expenditure value on [Specific to country]"  

*Calculate the overall non-food expenditure per household:
*If the expenditure was calculated separately for cash, credit, aid/gift and own production, calculate the overall total by summing them up 
*Make sure to covert variables with a 6 months recall period into 30 days values 

*Total non food expenditure in cash 
egen HHExpNFTotal_MN_6M=rowtotal(HHExpNFRent_MN_6M HHExpNFMedServ_MN_6M HHExpNFMedGood_MN_6M HHExpNFCloth_MN_6M HHExpNFEduFee_MN_6M HHExpNFEduGood_MN_6M HHExpNFSoft_MN_6M HHExpNFInsurance_MN_6M HHExpNFSav_MN_6M HHExpNFDebt_MN_6M)

egen HHExpNFTotal_MN_30D=rowtotal(HHExpNFAlcTobac_MN_1M HHExpNFHyg_MN_1M HHExpNFTransp_MN_1M HHExpNFWat_MN_1M HHExpNFDwelServ_MN_1M HHExpNFElec_MN_1M HHExpNFEnerg_MN_1M HHExpNFPhone_MN_1M HHExpNFSpec1_MN_1M) 

gen HHExpNFTotal_MN_1M=HHExpNFTotal_MN_30D+(HHExpNFTotal_MN_6M/6)
lab var HHExpNFTotal_MN_1M "Total non-food exp on cash"

drop HHExpNFTotal_MN_6M HHExpNFTotal_MN_30D

*Total monthly non-food expenditure on credit 
egen HHExpNFTotal_CRD_6M=rowtotal(HHExpNFRent_CRD_6M HHExpNFMedServ_CRD_6M HHExpNFMedGood_CRD_6M HHExpNFCloth_CRD_6M HHExpNFEduFee_CRD_6M HHExpNFEduGood_CRD_6M HHExpNFSoft_CRD_6M HHExpNFInsurance_CRD_6M HHExpNFSav_CRD_6M HHExpNFDebt_CRD_6M)

egen HHExpNFTotal_CRD_30D=rowtotal(HHExpNFAlcTobac_CRD_1M HHExpNFHyg_CRD_1M HHExpNFTransp_CRD_1M, HHExpNFWat_CRD_1M HHExpNFDwelServ_CRD_1M HHExpNFElec_CRD_1M HHExpNFEnerg_CRD_1M HHExpNFPhone_CRD_1M HHExpNFSpec1_CRD_1M)

gen HHExpNFTotal_CRD_1M=HHExpNFTotal_CRD_30D+(HHExpNFTotal_CRD_6M/6)
lab var HHExpNFTotal_CRD_1M "Total non-food exp on credit"

drop HHExpNFTotal_CRD_6M HHExpNFTotal_CRD_30D

*Total monthly non-food gift/aid value
egen HHExpNFTotal_GiftAid_6M=rowtotal(HHExpNFRent_GiftAid_6M HHExpNFMedServ_GiftAid_6M HHExpNFMedGood_GiftAid_6M HHExpNFCloth_GiftAid_6M HHExpNFEduFee_GiftAid_6M HHExpNFEduGood_GiftAid_6M HHExpNFHHSoft_GiftAid_6M HHExpNFInsurance_GiftAid_6M HHExpNFSav_GiftAid_6M HHExpNFDebt_GiftAid_6M)

egen HHExpNFTotal_GiftAid_30D=rowtotal(HHExpNFAlcTobac_GiftAid_1M HHExpNFHyg_GiftAid_1M HHExpNFTransp_GiftAid_1M HHExpNFWat_GiftAid_1M HHExpNFDwelServ_GiftAid_1M HHExpNFElec_GiftAid_1M,HHExpNFEnerg_GiftAid_1M  HHExpNFPhone_GiftAid_1M HHExpNFSpec1_GiftAid_1M) 

gen HHExpNFTotal_GiftAid_1M=HHExpNFTotal_GiftAid_30D+(HHExpNFTotal_GiftAid_6M/6)
lab var HHExpNFTotal_GiftAid_1M "Total non-food exp from aid"

drop HHExpNFTotal_GiftAid_6M HHExpNFTotal_GiftAid_30D


*----------------------------------------------------------------------------------------------------------------------------------------------------------------*
*3. Calculate total food and non-food expenditure
*----------------------------------------------------------------------------------------------------------------------------------------------------------------*
gen HHExpFood_1M=HHExpFood_MN_1M+HHExp_Food_CRD_1M+HHExp_Food_Own_1M+HHExp_Food_GiftAid_1M

gen HHExpNFTotal_1M=HHExpNFTotal_MN_1M+HHExpNFTotal_CRD_1M+HHExpNFTotal_GiftAid_1M

gen HHExpTotal=HHExpFood_1M+HHExpNFTotal_1M
lab var HHExpTotal "Monthly total HH exp incl all food and non-food exp in cash, credit, assistance"

sum HHExpTotal, d

*HHSize variable refers to total household size
gen PCExpTotal=HHExpTotal/HHSize
lab var PCExpTotal "Monthly total per capita exp incl all food and non-food exp in cash, credit, assistance"

sum PCExpTotal, d




*----------------------------------------------------------------------------------------------------------------------------------------------------------------*
*4. Calculate total food and non-food expenditure for ECMEN
*----------------------------------------------------------------------------------------------------------------------------------------------------------------*
*Note: For ECMEN analysis, do not include assistance and credit expenditure. Credit expenditures do not refer to credits repaid in the same month  
*Only include cash and own production analysis  
*Please feel free to create variations according to the context  

gen HHExp_ECMEN=HHExpFood_1M+HHExpNFTotal_1M+(HHExpNFSav_Est_6M/6)+(HHExpNFDebt_Est_6M/6)
lab var HHExp_ECMEN "Monthly total HH exp incl all food and non-food exp in cash"

sum HHExp_ECMEN, d

gen PCExp_ECMEN=HHExpTotal/HHSize
lab var PCExp_ECMEN "Monthly total per capita exp incl all food and non-food exp in cash"

sum PCExp_ECMEN, d



					   
*----------------------------------------------------------------------------------------------------------------------------------------------------------------*
*5. Calculate total food and non-food expenditure for ECMEN
*----------------------------------------------------------------------------------------------------------------------------------------------------------------*
gen byte ECMEN=PCExp_ECMEN > MEB
lab var ECMEN "Percentage of HH with exp. above MEB, excluding assistance and credit"
lab def 1"HH with capacity" 0"HH without capacity"
lab val ECMEN_label ECMEN

tab ECMEN

gen byte ECMEN_SMEB=PCExp_ECMEN > SMEB
lab var ECMEN_SMEB "Percentage of HH with exp. above SMEB, excluding assistance and credit"
lab def 1"HH with capacity" 0"HH without capacity"
lab val ECMEN_SMEB_label ECMEN_SMEB

tab ECMEN_SMEB					   
