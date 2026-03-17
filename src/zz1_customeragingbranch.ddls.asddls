@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Customer Aging Branch Wise'
@ObjectModel.modelingPattern: #ANALYTICAL_CUBE
@ObjectModel.supportedCapabilities: [ #ANALYTICAL_PROVIDER, #SQL_DATA_SOURCE, #CDS_MODELING_DATA_SOURCE ]
@AbapCatalog.dataMaintenance: #DISPLAY_ONLY
@Search.searchable: false
@Metadata.allowExtensions: true
@Analytics.dataCategory: #CUBE
@Analytics.internalName: #LOCAL
@ObjectModel.representativeKey: 'LedgerGLLineItem'

define view entity ZZ1_CUSTOMERAGINGBranch

with parameters
@EndUserText.label: 'P_KeyDate'
@Consumption.hidden: false
P_KeyDate : SYDATE,

@EndUserText.label: 'Net Due Interval 1'
@Consumption.hidden: false
P_NetDueInterval1InDays : FARP_NET_DUE_INTERVAL1,

@EndUserText.label: 'Net Due Interval 2'
@Consumption.hidden: false
P_NetDueInterval2InDays : FARP_NET_DUE_INTERVAL2,

@EndUserText.label: 'Net Due Interval 3'
@Consumption.hidden: false
P_NetDueInterval3InDays : FARP_NET_DUE_INTERVAL3,

@EndUserText.label: 'Display Currency'
@Consumption.hidden: false
P_DisplayCurrency : VDM_V_DISPLAY_CURRENCY,

@EndUserText.label: 'Exchange Rate Type'
@Consumption.hidden: false
P_ExchangeRateType : KURST

as select from I_ARJrnlEntrItmAgingGrid( P_KeyDate: $parameters.P_KeyDate, P_NetDueInterval1InDays: $parameters.P_NetDueInterval1InDays, P_NetDueInterval2InDays: $parameters.P_NetDueInterval2InDays, P_NetDueInterval3InDays: $parameters.P_NetDueInterval3InDays, P_DisplayCurrency: $parameters.P_DisplayCurrency, P_ExchangeRateType: $parameters.P_ExchangeRateType ) as I_ARJrnlEntrItmAgingGrid
association[0..1] to ZC_CUSTOMERSALESOFFICE as _ZC_CUSTOMERSALESOFFICE on _ZC_CUSTOMERSALESOFFICE.kunnr = I_ARJrnlEntrItmAgingGrid.Customer
association[0..1] to I_Customer as _I_Customer on _I_Customer.Customer = $projection.Customer

{
@EndUserText.label: 'Company Code'
@ObjectModel.foreignKey.association: '_Company'
@ObjectModel.text.association: null
@ObjectModel.text.element: null
@Consumption.groupWithElement: null
@Consumption.valueHelp: null
@Consumption.hidden: false
@Analytics.excludeFromRuntimeExtensibility: false
@Consumption.filter.mandatory: false
@Consumption.filter.multipleSelections: false
@Consumption.filter.selectionType: null
@Aggregation.default: null
key I_ARJrnlEntrItmAgingGrid.CompanyCode as CompanyCode,

@EndUserText.label: 'Fiscal Year'
@ObjectModel.foreignKey.association: '_FiscalYear'
@ObjectModel.text.association: null
@ObjectModel.text.element: null
@Consumption.groupWithElement: null
@Consumption.valueHelp: null
@Consumption.hidden: false
@Analytics.excludeFromRuntimeExtensibility: false
@Consumption.filter.mandatory: false
@Consumption.filter.multipleSelections: false
@Consumption.filter.selectionType: null
@Aggregation.default: null
key I_ARJrnlEntrItmAgingGrid.FiscalYear as FiscalYear,

@EndUserText.label: 'Journal Entry'
@ObjectModel.foreignKey.association: '_JournalEntry'
@ObjectModel.text.association: null
@ObjectModel.text.element: null
@Consumption.groupWithElement: null
@Consumption.valueHelp: null
@Consumption.hidden: false
@Analytics.excludeFromRuntimeExtensibility: false
@Consumption.filter.mandatory: false
@Consumption.filter.multipleSelections: false
@Consumption.filter.selectionType: null
@Aggregation.default: null
key I_ARJrnlEntrItmAgingGrid.AccountingDocument as AccountingDocument,

@EndUserText.label: 'Journal Entry Item'
@ObjectModel.foreignKey.association: null
@ObjectModel.text.association: null
@ObjectModel.text.element: null
@Consumption.groupWithElement: null
@Consumption.valueHelp: null
@Consumption.hidden: false
@Analytics.excludeFromRuntimeExtensibility: false
@Consumption.filter.mandatory: false
@Consumption.filter.multipleSelections: false
@Consumption.filter.selectionType: null
@Aggregation.default: null
key I_ARJrnlEntrItmAgingGrid.LedgerGLLineItem as LedgerGLLineItem,

@EndUserText.label: 'Posting View Item'
@ObjectModel.foreignKey.association: null
@ObjectModel.text.association: null
@ObjectModel.text.element: null
@Consumption.groupWithElement: null
@Consumption.valueHelp: null
@Consumption.hidden: false
@Analytics.excludeFromRuntimeExtensibility: false
@Consumption.filter.mandatory: false
@Consumption.filter.multipleSelections: false
@Consumption.filter.selectionType: null
@Aggregation.default: null
I_ARJrnlEntrItmAgingGrid.AccountingDocumentItem as AccountingDocumentItem,

@EndUserText.label: 'Customer'
@ObjectModel.foreignKey.association: '_Customer'
@ObjectModel.text.association: null
@ObjectModel.text.element: null
@Consumption.groupWithElement: null
@Consumption.valueHelp: null
@Consumption.hidden: false
@Analytics.excludeFromRuntimeExtensibility: false
@Consumption.filter.mandatory: false
@Consumption.filter.multipleSelections: false
@Consumption.filter.selectionType: null
@Aggregation.default: null
I_ARJrnlEntrItmAgingGrid.Customer as Customer,

@EndUserText.label: 'G/L Account'
@ObjectModel.foreignKey.association: null
@ObjectModel.text.association: null
@ObjectModel.text.element: null
@Consumption.groupWithElement: null
@Consumption.valueHelp: null
@Consumption.hidden: false
@Analytics.excludeFromRuntimeExtensibility: false
@Consumption.filter.mandatory: false
@Consumption.filter.multipleSelections: false
@Consumption.filter.selectionType: null
@Aggregation.default: null
I_ARJrnlEntrItmAgingGrid.GLAccount as GLAccount,

@EndUserText.label: 'Special G/L'
@ObjectModel.foreignKey.association: '_SpecialGLCode'
@ObjectModel.text.association: null
@ObjectModel.text.element: null
@Consumption.groupWithElement: null
@Consumption.valueHelp: null
@Consumption.hidden: false
@Analytics.excludeFromRuntimeExtensibility: false
@Consumption.filter.mandatory: false
@Consumption.filter.multipleSelections: false
@Consumption.filter.selectionType: null
@Aggregation.default: null
I_ARJrnlEntrItmAgingGrid.SpecialGLCode as SpecialGLCode,

@EndUserText.label: 'Fin. Account Type'
@ObjectModel.foreignKey.association: '_FinancialAccountType'
@ObjectModel.text.association: null
@ObjectModel.text.element: null
@Consumption.groupWithElement: null
@Consumption.valueHelp: null
@Consumption.hidden: false
@Analytics.excludeFromRuntimeExtensibility: false
@Consumption.filter.mandatory: false
@Consumption.filter.multipleSelections: false
@Consumption.filter.selectionType: null
@Aggregation.default: null
I_ARJrnlEntrItmAgingGrid.FinancialAccountType as FinancialAccountType,

@EndUserText.label: 'Profit Center'
@ObjectModel.foreignKey.association: null
@ObjectModel.text.association: null
@ObjectModel.text.element: null
@Consumption.groupWithElement: null
@Consumption.valueHelp: null
@Consumption.hidden: false
@Analytics.excludeFromRuntimeExtensibility: false
@Consumption.filter.mandatory: false
@Consumption.filter.multipleSelections: false
@Consumption.filter.selectionType: null
@Aggregation.default: null
I_ARJrnlEntrItmAgingGrid.ProfitCenter as ProfitCenter,

@EndUserText.label: 'Segment'
@ObjectModel.foreignKey.association: null
@ObjectModel.text.association: null
@ObjectModel.text.element: null
@Consumption.groupWithElement: null
@Consumption.valueHelp: null
@Consumption.hidden: false
@Analytics.excludeFromRuntimeExtensibility: false
@Consumption.filter.mandatory: false
@Consumption.filter.multipleSelections: false
@Consumption.filter.selectionType: null
@Aggregation.default: null
I_ARJrnlEntrItmAgingGrid.Segment as Segment,

@EndUserText.label: 'Controlling Area'
@ObjectModel.foreignKey.association: '_ControllingArea'
@ObjectModel.text.association: null
@ObjectModel.text.element: null
@Consumption.groupWithElement: null
@Consumption.valueHelp: null
@Consumption.hidden: false
@Analytics.excludeFromRuntimeExtensibility: false
@Consumption.filter.mandatory: false
@Consumption.filter.multipleSelections: false
@Consumption.filter.selectionType: null
@Aggregation.default: null
I_ARJrnlEntrItmAgingGrid.ControllingArea as ControllingArea,

@EndUserText.label: 'Billing Document'
@ObjectModel.foreignKey.association: null
@ObjectModel.text.association: null
@ObjectModel.text.element: null
@Consumption.groupWithElement: null
@Consumption.valueHelp: null
@Consumption.hidden: false
@Analytics.excludeFromRuntimeExtensibility: false
@Consumption.filter.mandatory: false
@Consumption.filter.multipleSelections: false
@Consumption.filter.selectionType: null
@Aggregation.default: null
I_ARJrnlEntrItmAgingGrid.BillingDocument as BillingDocument,

@EndUserText.label: 'Business Area'
@ObjectModel.foreignKey.association: null
@ObjectModel.text.association: null
@ObjectModel.text.element: null
@Consumption.groupWithElement: null
@Consumption.valueHelp: null
@Consumption.hidden: false
@Analytics.excludeFromRuntimeExtensibility: false
@Consumption.filter.mandatory: false
@Consumption.filter.multipleSelections: false
@Consumption.filter.selectionType: null
@Aggregation.default: null
I_ARJrnlEntrItmAgingGrid.BusinessArea as BusinessArea,

@EndUserText.label: 'Assignment Reference'
@ObjectModel.foreignKey.association: null
@ObjectModel.text.association: null
@ObjectModel.text.element: null
@Consumption.groupWithElement: null
@Consumption.valueHelp: null
@Consumption.hidden: false
@Analytics.excludeFromRuntimeExtensibility: false
@Consumption.filter.mandatory: false
@Consumption.filter.multipleSelections: false
@Consumption.filter.selectionType: null
@Aggregation.default: null
I_ARJrnlEntrItmAgingGrid.AssignmentReference as AssignmentReference,

@EndUserText.label: 'Country / Region Key'
@ObjectModel.foreignKey.association: '_CustomerCountry'
@ObjectModel.text.association: null
@ObjectModel.text.element: null
@Consumption.groupWithElement: null
@Consumption.valueHelp: null
@Consumption.hidden: false
@Analytics.excludeFromRuntimeExtensibility: false
@Consumption.filter.mandatory: false
@Consumption.filter.multipleSelections: false
@Consumption.filter.selectionType: null
@Aggregation.default: null
I_ARJrnlEntrItmAgingGrid.CustomerCountry as CustomerCountry,

@EndUserText.label: 'Region'
@ObjectModel.foreignKey.association: '_CustomerRegion'
@ObjectModel.text.association: null
@ObjectModel.text.element: null
@Consumption.groupWithElement: null
@Consumption.valueHelp: null
@Consumption.hidden: false
@Analytics.excludeFromRuntimeExtensibility: false
@Consumption.filter.mandatory: false
@Consumption.filter.multipleSelections: false
@Consumption.filter.selectionType: null
@Aggregation.default: null
I_ARJrnlEntrItmAgingGrid.CustomerRegion as CustomerRegion,

@EndUserText.label: 'Net Due Interval'
@ObjectModel.foreignKey.association: null
@ObjectModel.text.association: null
@ObjectModel.text.element: null
@Consumption.groupWithElement: null
@Consumption.valueHelp: null
@Consumption.hidden: false
@Analytics.excludeFromRuntimeExtensibility: false
@Consumption.filter.mandatory: false
@Consumption.filter.multipleSelections: false
@Consumption.filter.selectionType: null
@Aggregation.default: null
I_ARJrnlEntrItmAgingGrid.NetDueIntervalText as NetDueIntervalText,

@EndUserText.label: 'Accounting Clerk'
@ObjectModel.foreignKey.association: '_AccountingClerk'
@ObjectModel.text.association: null
@ObjectModel.text.element: null
@Consumption.groupWithElement: null
@Consumption.valueHelp: null
@Consumption.hidden: false
@Analytics.excludeFromRuntimeExtensibility: false
@Consumption.filter.mandatory: false
@Consumption.filter.multipleSelections: false
@Consumption.filter.selectionType: null
@Aggregation.default: null
I_ARJrnlEntrItmAgingGrid.AccountingClerk as AccountingClerk,

@EndUserText.label: 'Recon. Account'
@ObjectModel.foreignKey.association: '_ReconciliationAccount'
@ObjectModel.text.association: null
@ObjectModel.text.element: null
@Consumption.groupWithElement: null
@Consumption.valueHelp: null
@Consumption.hidden: false
@Analytics.excludeFromRuntimeExtensibility: false
@Consumption.filter.mandatory: false
@Consumption.filter.multipleSelections: false
@Consumption.filter.selectionType: null
@Aggregation.default: null
I_ARJrnlEntrItmAgingGrid.ReconciliationAccount as ReconciliationAccount,

@EndUserText.label: 'Account group'
@ObjectModel.foreignKey.association: '_CustomerAccountGroup'
@ObjectModel.text.association: null
@ObjectModel.text.element: null
@Consumption.groupWithElement: null
@Consumption.valueHelp: null
@Consumption.hidden: false
@Analytics.excludeFromRuntimeExtensibility: false
@Consumption.filter.mandatory: false
@Consumption.filter.multipleSelections: false
@Consumption.filter.selectionType: null
@Aggregation.default: null
I_ARJrnlEntrItmAgingGrid.CustomerAccountGroup as CustomerAccountGroup,

@EndUserText.label: 'Customer Classific.'
@ObjectModel.foreignKey.association: '_CustomerClassification'
@ObjectModel.text.association: null
@ObjectModel.text.element: null
@Consumption.groupWithElement: null
@Consumption.valueHelp: null
@Consumption.hidden: false
@Analytics.excludeFromRuntimeExtensibility: false
@Consumption.filter.mandatory: false
@Consumption.filter.multipleSelections: false
@Consumption.filter.selectionType: null
@Aggregation.default: null
I_ARJrnlEntrItmAgingGrid.CustomerClassification as CustomerClassification,

@EndUserText.label: 'Display Currency'
@ObjectModel.foreignKey.association: '_DisplayCurrency'
@ObjectModel.text.association: null
@ObjectModel.text.element: null
@Consumption.groupWithElement: null
@Consumption.valueHelp: null
@Consumption.hidden: false
@Analytics.excludeFromRuntimeExtensibility: false
@Consumption.filter.mandatory: false
@Consumption.filter.multipleSelections: false
@Consumption.filter.selectionType: null
@Aggregation.default: null
I_ARJrnlEntrItmAgingGrid.DisplayCurrency as DisplayCurrency,

@EndUserText.label: 'Total Amount'
@Semantics.Amount.CurrencyCode: 'DisplayCurrency'
@ObjectModel.foreignKey.association: null
@ObjectModel.text.association: null
@ObjectModel.text.element: null
@Consumption.groupWithElement: null
@Consumption.valueHelp: null
@Consumption.hidden: false
@Analytics.excludeFromRuntimeExtensibility: false
@Consumption.filter.mandatory: false
@Consumption.filter.multipleSelections: false
@Consumption.filter.selectionType: null
@Aggregation.default: #SUM
I_ARJrnlEntrItmAgingGrid.TotalAmountInDisplayCrcy as TotalAmountInDisplayCrcy,

@EndUserText.label: 'Future Amount'
@Semantics.Amount.CurrencyCode: 'DisplayCurrency'
@ObjectModel.foreignKey.association: null
@ObjectModel.text.association: null
@ObjectModel.text.element: null
@Consumption.groupWithElement: null
@Consumption.valueHelp: null
@Consumption.hidden: false
@Analytics.excludeFromRuntimeExtensibility: false
@Consumption.filter.mandatory: false
@Consumption.filter.multipleSelections: false
@Consumption.filter.selectionType: null
@Aggregation.default: #SUM
I_ARJrnlEntrItmAgingGrid.TotalNotOvrdAmtInDspCrcy as TotalNotOvrdAmtInDspCrcy,

@EndUserText.label: 'Overdue Amount'
@Semantics.Amount.CurrencyCode: 'DisplayCurrency'
@ObjectModel.foreignKey.association: null
@ObjectModel.text.association: null
@ObjectModel.text.element: null
@Consumption.groupWithElement: null
@Consumption.valueHelp: null
@Consumption.hidden: false
@Analytics.excludeFromRuntimeExtensibility: false
@Consumption.filter.mandatory: false
@Consumption.filter.multipleSelections: false
@Consumption.filter.selectionType: null
@Aggregation.default: #SUM
I_ARJrnlEntrItmAgingGrid.TotalOverdueAmtInDspCrcy as TotalOverdueAmtInDspCrcy,

@EndUserText.label: 'Amt 1st Due Period'
@Semantics.Amount.CurrencyCode: 'DisplayCurrency'
@ObjectModel.foreignKey.association: null
@ObjectModel.text.association: null
@ObjectModel.text.element: null
@Consumption.groupWithElement: null
@Consumption.valueHelp: null
@Consumption.hidden: false
@Analytics.excludeFromRuntimeExtensibility: false
@Consumption.filter.mandatory: false
@Consumption.filter.multipleSelections: false
@Consumption.filter.selectionType: null
@Aggregation.default: #SUM
I_ARJrnlEntrItmAgingGrid.NetDueIntvl1AmtInDspCrcy as NetDueIntvl1AmtInDspCrcy,

@EndUserText.label: 'Amt 2nd Due Period'
@Semantics.Amount.CurrencyCode: 'DisplayCurrency'
@ObjectModel.foreignKey.association: null
@ObjectModel.text.association: null
@ObjectModel.text.element: null
@Consumption.groupWithElement: null
@Consumption.valueHelp: null
@Consumption.hidden: false
@Analytics.excludeFromRuntimeExtensibility: false
@Consumption.filter.mandatory: false
@Consumption.filter.multipleSelections: false
@Consumption.filter.selectionType: null
@Aggregation.default: #SUM
I_ARJrnlEntrItmAgingGrid.NetDueIntvl2AmtInDspCrcy as NetDueIntvl2AmtInDspCrcy,

@EndUserText.label: 'Amt 3rd Due Period'
@Semantics.Amount.CurrencyCode: 'DisplayCurrency'
@ObjectModel.foreignKey.association: null
@ObjectModel.text.association: null
@ObjectModel.text.element: null
@Consumption.groupWithElement: null
@Consumption.valueHelp: null
@Consumption.hidden: false
@Analytics.excludeFromRuntimeExtensibility: false
@Consumption.filter.mandatory: false
@Consumption.filter.multipleSelections: false
@Consumption.filter.selectionType: null
@Aggregation.default: #SUM
I_ARJrnlEntrItmAgingGrid.NetDueIntvl3AmtInDspCrcy as NetDueIntvl3AmtInDspCrcy,

@EndUserText.label: 'Amt 4th Due Period'
@Semantics.Amount.CurrencyCode: 'DisplayCurrency'
@ObjectModel.foreignKey.association: null
@ObjectModel.text.association: null
@ObjectModel.text.element: null
@Consumption.groupWithElement: null
@Consumption.valueHelp: null
@Consumption.hidden: false
@Analytics.excludeFromRuntimeExtensibility: false
@Consumption.filter.mandatory: false
@Consumption.filter.multipleSelections: false
@Consumption.filter.selectionType: null
@Aggregation.default: #SUM
I_ARJrnlEntrItmAgingGrid.NetDueIntvl4AmtInDspCrcy as NetDueIntvl4AmtInDspCrcy,

@EndUserText.label: 'FutrAmt 1st Due Perd'
@Semantics.Amount.CurrencyCode: 'DisplayCurrency'
@ObjectModel.foreignKey.association: null
@ObjectModel.text.association: null
@ObjectModel.text.element: null
@Consumption.groupWithElement: null
@Consumption.valueHelp: null
@Consumption.hidden: false
@Analytics.excludeFromRuntimeExtensibility: false
@Consumption.filter.mandatory: false
@Consumption.filter.multipleSelections: false
@Consumption.filter.selectionType: null
@Aggregation.default: #SUM
I_ARJrnlEntrItmAgingGrid.FirstIntvlFutrDueAmtInDspCrcy as FirstIntvlFutrDueAmtInDspCrcy,

@EndUserText.label: 'FutrAmt 2nd Due Perd'
@Semantics.Amount.CurrencyCode: 'DisplayCurrency'
@ObjectModel.foreignKey.association: null
@ObjectModel.text.association: null
@ObjectModel.text.element: null
@Consumption.groupWithElement: null
@Consumption.valueHelp: null
@Consumption.hidden: false
@Analytics.excludeFromRuntimeExtensibility: false
@Consumption.filter.mandatory: false
@Consumption.filter.multipleSelections: false
@Consumption.filter.selectionType: null
@Aggregation.default: #SUM
I_ARJrnlEntrItmAgingGrid.SecondIntvlFutrDueAmtInDspCrcy as SecondIntvlFutrDueAmtInDspCrcy,

@EndUserText.label: 'FutrAmt 3rd Due Perd'
@Semantics.Amount.CurrencyCode: 'DisplayCurrency'
@ObjectModel.foreignKey.association: null
@ObjectModel.text.association: null
@ObjectModel.text.element: null
@Consumption.groupWithElement: null
@Consumption.valueHelp: null
@Consumption.hidden: false
@Analytics.excludeFromRuntimeExtensibility: false
@Consumption.filter.mandatory: false
@Consumption.filter.multipleSelections: false
@Consumption.filter.selectionType: null
@Aggregation.default: #SUM
I_ARJrnlEntrItmAgingGrid.ThirdIntvlFutrDueAmtInDspCrcy as ThirdIntvlFutrDueAmtInDspCrcy,

@EndUserText.label: 'FutrAmt Last Due Per'
@Semantics.Amount.CurrencyCode: 'DisplayCurrency'
@ObjectModel.foreignKey.association: null
@ObjectModel.text.association: null
@ObjectModel.text.element: null
@Consumption.groupWithElement: null
@Consumption.valueHelp: null
@Consumption.hidden: false
@Analytics.excludeFromRuntimeExtensibility: false
@Consumption.filter.mandatory: false
@Consumption.filter.multipleSelections: false
@Consumption.filter.selectionType: null
@Aggregation.default: #SUM
I_ARJrnlEntrItmAgingGrid.FourthIntvlFutrDueAmtInDspCrcy as FourthIntvlFutrDueAmtInDspCrcy,

@EndUserText.label: 'Chart of Accounts'
@ObjectModel.foreignKey.association: '_ChartOfAccounts'
@ObjectModel.text.association: null
@ObjectModel.text.element: null
@Consumption.groupWithElement: null
@Consumption.valueHelp: null
@Consumption.hidden: false
@Analytics.excludeFromRuntimeExtensibility: false
@Consumption.filter.mandatory: false
@Consumption.filter.multipleSelections: false
@Consumption.filter.selectionType: null
@Aggregation.default: null
I_ARJrnlEntrItmAgingGrid.ChartOfAccounts as ChartOfAccounts,

@EndUserText.label: 'Sales Office'
@ObjectModel.foreignKey.association: null
@ObjectModel.text.association: null
@ObjectModel.text.element: null
@Consumption.groupWithElement: null
@Consumption.valueHelp: null
@Consumption.hidden: false
@Analytics.excludeFromRuntimeExtensibility: false
@Consumption.filter.mandatory: false
@Consumption.filter.multipleSelections: false
@Consumption.filter.selectionType: null
@Aggregation.default: null
_ZC_CUSTOMERSALESOFFICE.vkbur as vkbur,

@EndUserText.label: 'Sales Office'
@ObjectModel.foreignKey.association: null
@ObjectModel.text.association: null
@ObjectModel.text.element: null
@Consumption.groupWithElement: null
@Consumption.valueHelp: null
@Consumption.hidden: false
@Analytics.excludeFromRuntimeExtensibility: false
@Consumption.filter.mandatory: false
@Consumption.filter.multipleSelections: false
@Consumption.filter.selectionType: null
@Aggregation.default: null
_I_Customer._CustomerSalesArea.SalesOffice as SalesOffice,

@EndUserText.label: '_JournalEntry'
@ObjectModel.association.type: null
@ObjectModel.foreignKey.association: null
@ObjectModel.text.association: null
@ObjectModel.text.element: null
@Consumption.groupWithElement: null
@Consumption.valueHelp: null
@Consumption.filter.selectionType: null
@Aggregation.default: null
I_ARJrnlEntrItmAgingGrid._JournalEntry as _JournalEntry,

@EndUserText.label: '_FiscalYear'
@ObjectModel.association.type: null
@ObjectModel.foreignKey.association: null
@ObjectModel.text.association: null
@ObjectModel.text.element: null
@Consumption.groupWithElement: null
@Consumption.valueHelp: null
@Consumption.filter.selectionType: null
@Aggregation.default: null
I_ARJrnlEntrItmAgingGrid._FiscalYear as _FiscalYear,

@EndUserText.label: '_Company'
@ObjectModel.association.type: null
@ObjectModel.foreignKey.association: null
@ObjectModel.text.association: null
@ObjectModel.text.element: null
@Consumption.groupWithElement: null
@Consumption.valueHelp: null
@Consumption.filter.selectionType: null
@Aggregation.default: null
I_ARJrnlEntrItmAgingGrid._Company as _Company,

@EndUserText.label: '_Customer'
@ObjectModel.association.type: null
@ObjectModel.foreignKey.association: null
@ObjectModel.text.association: null
@ObjectModel.text.element: null
@Consumption.groupWithElement: null
@Consumption.valueHelp: null
@Consumption.filter.selectionType: null
@Aggregation.default: null
I_ARJrnlEntrItmAgingGrid._Customer as _Customer,

@EndUserText.label: '_SpecialGLCode'
@ObjectModel.association.type: null
@ObjectModel.foreignKey.association: null
@ObjectModel.text.association: null
@ObjectModel.text.element: null
@Consumption.groupWithElement: null
@Consumption.valueHelp: null
@Consumption.filter.selectionType: null
@Aggregation.default: null
I_ARJrnlEntrItmAgingGrid._SpecialGLCode as _SpecialGLCode,

@EndUserText.label: '_FinancialAccountType'
@ObjectModel.association.type: null
@ObjectModel.foreignKey.association: null
@ObjectModel.text.association: null
@ObjectModel.text.element: null
@Consumption.groupWithElement: null
@Consumption.valueHelp: null
@Consumption.filter.selectionType: null
@Aggregation.default: null
I_ARJrnlEntrItmAgingGrid._FinancialAccountType as _FinancialAccountType,

@EndUserText.label: '_ControllingArea'
@ObjectModel.association.type: null
@ObjectModel.foreignKey.association: null
@ObjectModel.text.association: null
@ObjectModel.text.element: null
@Consumption.groupWithElement: null
@Consumption.valueHelp: null
@Consumption.filter.selectionType: null
@Aggregation.default: null
I_ARJrnlEntrItmAgingGrid._ControllingArea as _ControllingArea,

@EndUserText.label: '_CustomerCountry'
@ObjectModel.association.type: null
@ObjectModel.foreignKey.association: null
@ObjectModel.text.association: null
@ObjectModel.text.element: null
@Consumption.groupWithElement: null
@Consumption.valueHelp: null
@Consumption.filter.selectionType: null
@Aggregation.default: null
I_ARJrnlEntrItmAgingGrid._CustomerCountry as _CustomerCountry,

@EndUserText.label: '_CustomerRegion'
@ObjectModel.association.type: null
@ObjectModel.foreignKey.association: null
@ObjectModel.text.association: null
@ObjectModel.text.element: null
@Consumption.groupWithElement: null
@Consumption.valueHelp: null
@Consumption.filter.selectionType: null
@Aggregation.default: null
I_ARJrnlEntrItmAgingGrid._CustomerRegion as _CustomerRegion,

@EndUserText.label: '_AccountingClerk'
@ObjectModel.association.type: null
@ObjectModel.foreignKey.association: null
@ObjectModel.text.association: null
@ObjectModel.text.element: null
@Consumption.groupWithElement: null
@Consumption.valueHelp: null
@Consumption.filter.selectionType: null
@Aggregation.default: null
I_ARJrnlEntrItmAgingGrid._AccountingClerk as _AccountingClerk,

@EndUserText.label: '_ChartOfAccounts'
@ObjectModel.association.type: null
@ObjectModel.foreignKey.association: null
@ObjectModel.text.association: null
@ObjectModel.text.element: null
@Consumption.groupWithElement: null
@Consumption.valueHelp: null
@Consumption.filter.selectionType: null
@Aggregation.default: null
I_ARJrnlEntrItmAgingGrid._ChartOfAccounts as _ChartOfAccounts,

@EndUserText.label: '_ReconciliationAccount'
@ObjectModel.association.type: null
@ObjectModel.foreignKey.association: null
@ObjectModel.text.association: null
@ObjectModel.text.element: null
@Consumption.groupWithElement: null
@Consumption.valueHelp: null
@Consumption.filter.selectionType: null
@Aggregation.default: null
I_ARJrnlEntrItmAgingGrid._ReconciliationAccount as _ReconciliationAccount,

@EndUserText.label: '_CustomerAccountGroup'
@ObjectModel.association.type: null
@ObjectModel.foreignKey.association: null
@ObjectModel.text.association: null
@ObjectModel.text.element: null
@Consumption.groupWithElement: null
@Consumption.valueHelp: null
@Consumption.filter.selectionType: null
@Aggregation.default: null
I_ARJrnlEntrItmAgingGrid._CustomerAccountGroup as _CustomerAccountGroup,

@EndUserText.label: '_CustomerClassification'
@ObjectModel.association.type: null
@ObjectModel.foreignKey.association: null
@ObjectModel.text.association: null
@ObjectModel.text.element: null
@Consumption.groupWithElement: null
@Consumption.valueHelp: null
@Consumption.filter.selectionType: null
@Aggregation.default: null
I_ARJrnlEntrItmAgingGrid._CustomerClassification as _CustomerClassification,

@EndUserText.label: '_DisplayCurrency'
@ObjectModel.association.type: null
@ObjectModel.foreignKey.association: null
@ObjectModel.text.association: null
@ObjectModel.text.element: null
@Consumption.groupWithElement: null
@Consumption.valueHelp: null
@Consumption.filter.selectionType: null
@Aggregation.default: null
I_ARJrnlEntrItmAgingGrid._DisplayCurrency as _DisplayCurrency,

@Analytics.hidden: true
@ObjectModel.foreignKey.association: null
@ObjectModel.text.association: null
@ObjectModel.text.element: null
@Consumption.groupWithElement: null
@Consumption.valueHelp: null
@Consumption.hidden: true
@Analytics.excludeFromRuntimeExtensibility: false
@Consumption.filter.mandatory: false
@Consumption.filter.multipleSelections: false
@Consumption.filter.selectionType: null
@Aggregation.default: null
I_ARJrnlEntrItmAgingGrid.COMPANYCODE as /SAP/1_COMPANYCODE,

@Analytics.hidden: true
@ObjectModel.foreignKey.association: null
@ObjectModel.text.association: null
@ObjectModel.text.element: null
@Consumption.groupWithElement: null
@Consumption.valueHelp: null
@Consumption.hidden: true
@Analytics.excludeFromRuntimeExtensibility: false
@Consumption.filter.mandatory: false
@Consumption.filter.multipleSelections: false
@Consumption.filter.selectionType: null
@Aggregation.default: null
I_ARJrnlEntrItmAgingGrid.CONTROLLINGAREA as /SAP/1_CONTROLLINGAREA,

@Analytics.hidden: true
@ObjectModel.foreignKey.association: null
@ObjectModel.text.association: null
@ObjectModel.text.element: null
@Consumption.groupWithElement: null
@Consumption.valueHelp: null
@Consumption.hidden: true
@Analytics.excludeFromRuntimeExtensibility: false
@Consumption.filter.mandatory: false
@Consumption.filter.multipleSelections: false
@Consumption.filter.selectionType: null
@Aggregation.default: null
I_ARJrnlEntrItmAgingGrid.CUSTOMERBASICAUTHORIZATIONGRP as /SAP/1_CUSTOME_JCNBZX_ATIONGRP,

@Analytics.hidden: true
@ObjectModel.foreignKey.association: null
@ObjectModel.text.association: null
@ObjectModel.text.element: null
@Consumption.groupWithElement: null
@Consumption.valueHelp: null
@Consumption.hidden: true
@Analytics.excludeFromRuntimeExtensibility: false
@Consumption.filter.mandatory: false
@Consumption.filter.multipleSelections: false
@Consumption.filter.selectionType: null
@Aggregation.default: null
I_ARJrnlEntrItmAgingGrid.CUSTOMERFINSAUTHORIZATIONGRP as /SAP/1_CUSTOME_LWLS2E_ATIONGRP,

@Analytics.hidden: true
@ObjectModel.foreignKey.association: null
@ObjectModel.text.association: null
@ObjectModel.text.element: null
@Consumption.groupWithElement: null
@Consumption.valueHelp: null
@Consumption.hidden: true
@Analytics.excludeFromRuntimeExtensibility: false
@Consumption.filter.mandatory: false
@Consumption.filter.multipleSelections: false
@Consumption.filter.selectionType: null
@Aggregation.default: null
I_ARJrnlEntrItmAgingGrid.GLACCOUNT as /SAP/1_GLACCOUNT,

@Analytics.hidden: true
@ObjectModel.foreignKey.association: null
@ObjectModel.text.association: null
@ObjectModel.text.element: null
@Consumption.groupWithElement: null
@Consumption.valueHelp: null
@Consumption.hidden: true
@Analytics.excludeFromRuntimeExtensibility: false
@Consumption.filter.mandatory: false
@Consumption.filter.multipleSelections: false
@Consumption.filter.selectionType: null
@Aggregation.default: null
I_ARJrnlEntrItmAgingGrid.PROFITCENTER as /SAP/1_PROFITCENTER,

@Analytics.hidden: true
@Consumption.hidden: true
@AbapCatalog.compiler.preferredAssociationOnElements: [ '/SAP/1_CONTROLLINGAREA',
'/SAP/1_PROFITCENTER' ]
@ObjectModel.association.type: null
@ObjectModel.foreignKey.association: null
@ObjectModel.text.association: null
@ObjectModel.text.element: null
@Consumption.groupWithElement: null
@Consumption.valueHelp: null
@Consumption.filter.selectionType: null
@Aggregation.default: null
I_ARJrnlEntrItmAgingGrid._CURRENTPROFITCENTER as /SAP/1__CURRENTPROFITCENTER
}
