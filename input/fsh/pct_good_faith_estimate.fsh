Profile: PCTGoodFaithEstimate
Parent: Claim
Id: davinci-pct-gfe
Title: "PCT Good Faith Estimate"
Description: "PCT Good Faith Estimate is a profile ..."

//// Profile entension elements ////
* extension contains GFESubmitter named gfeSubmitter 1..1 MS
* extension contains GFEServiceLinkingInfo named GFEServiceLinkingInfo 0..1 MS
* extension contains ReferralNumber named referralNumber 0..1 MS
* extension contains ProviderGrouperMethodology named providerGrouperMethodology 0..1 MS
* extension contains InterTransIdentifier named interTransIdentifier 0..1 MS

* patient MS
* patient only Reference(PCTPatient)

// Billing provider as Organization
* provider only Reference($USCorePractitionerRole)

* insurer 1..1
* insurer only Reference(PCTOrganization)

* supportingInfo.category from $C4BBSupportingInfoType (extensible)

* insurance MS
* insurance.coverage only Reference(PCTCoverage)
* insurance.preAuthRef MS

* diagnosis MS
//* diagnosis 1..* MS <<<<<<<<<<<<<<<<<<<<commented out for now

* procedure.procedure[x] MS
* procedure.procedure[x] only CodeableConcept

* insert SupportingInfoSlicing
* supportingInfo.category from PCTSupportingInfoTypeVS (extensible)
* supportingInfo contains
   placeOfService 0..1 MS and
   typeOfBill 0..1 MS
* supportingInfo[placeOfService].category MS
* supportingInfo[placeOfService].category = PCTSupportingInfoType#cmspos "CMS Place of Service"
* supportingInfo[placeOfService].code 1..1 MS
* supportingInfo[placeOfService].code from $CMSPOS (required)
* supportingInfo[typeOfBill].category MS
* supportingInfo[typeOfBill].category = $C4BBSupportingInfoType#typeofbill "Type of Bill"
* supportingInfo[typeOfBill].code 1..1 MS
* supportingInfo[typeOfBill].code from $AHANUBCTypeOfBill (required)



* item MS
//* item 1..* MS <<<<<<<<<<<<<<<<<<<<commented out for now
* item.extension contains EstimatedDateOfService named estimatedDateOfService 0..1 MS
* item.extension contains GFECoordinatingProviderLineItemCtrlNum named gfeCoordinatingProviderLineItemCtrlNum 0..1 MS

* item.revenue MS
* item.revenue from $AHANUBCRevenueCodes (required)

* item.modifier 0..4 MS
* item.modifier from $AMACPTCMSHCPCSModifiers (required)

* item.productOrService from $C4BBEOBInstitutionalProcedureCodes (required)
// Need to make item.productOrService required when item.revenue is provided ??
//* item.productOrService obeys EOB-out-inst-item-productorservice
//* item.productOrService ^comment = "Put the comment here for item.productOrService here"

* item.net 1..1 MS
* item.quantity MS

* item.encounter MS

* item.detail MS
//ISSUE: use FDANDCOrCompound or FDANationalDrugCode from CARIN BB??
* item.detail.productOrService from $FDANationalDrugCode (required)
* item.detail.quantity MS

* item.detail.extension contains ProductOrServiceBillingCode named productOrServiceBillingCode 0..1 MS
* item.detail.extension contains ProductOrServiceOtherCharge named productOrServiceOtherCharge 0..1 MS
* item.detail.extension contains CompoundDrugLinkingNumber named compoundDrugLinkingNumber 0..1 MS

* total 1..1
* total ^short = "Total GFE Charges Submitted"
