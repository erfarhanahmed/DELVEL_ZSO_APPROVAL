@AbapCatalog.sqlViewName : 'ZZ1_TG3350NRM280'
@Analytics.query: true

@ObjectModel.modelingPattern: #ANALYTICAL_QUERY
@ObjectModel.supportedCapabilities: [ #ANALYTICAL_QUERY ]
@EndUserText.label: 'Transportation Cost'
@OData.publish: true




define view ZZ1_TRANSPORTATIONCOST
with parameters 
                
                
                
                @EndUserText.label:'GL Hierarchy'
                @Consumption.hidden :false
                
                
                
                
                
                
                
                
                
                
                
                
                
                GLHierarchy : ABAP.CHAR(42)
 as select from I_JOURNALENTRYITEMCUBE
{@AnalyticsDetails.query.axis:#ROWS
 @AnalyticsDetails.query.display: #KEY_TEXT
 
 
 Supplier,
 @AnalyticsDetails.query.display: #KEY
 @AnalyticsDetails.query.axis:#ROWS
 
 
 OffsettingAccount,
@AnalyticsDetails.query.display: #TEXT
@AnalyticsDetails.query.axis:#ROWS
 OffsettingAccountName,

@AnalyticsDetails.query.displayHierarchy: #OFF
@AnalyticsDetails.query.hierarchyInitialLevel: 2
@AnalyticsDetails.query.hierarchyBinding : [
{type :#CONSTANT,value :''}
]




GLAccount,
 @EndUserText.label: 'Months'
 @AnalyticsDetails.query.display: #TEXT
 @AnalyticsDetails.query.axis:#COLUMNS
 FiscalYearPeriod,
 
 @Consumption.filter :{ selectionType: #SINGLE, multipleSelections: false, mandatory: false, defaultValue: '2025' }
 @EndUserText.label: 'Year'
 FiscalYear,
 AmountInCompanyCodeCurrency,
 LedgerGLLineItem,
 @AnalyticsDetails.query.hierarchyBinding : [
{type :#CONSTANT,value :''}
]
 @AnalyticsDetails.query.displayHierarchy: #OFF
 @AnalyticsDetails.query.hierarchyInitialLevel: 3
 @Consumption.filter :{ selectionType: #SINGLE, multipleSelections: false, mandatory: false, defaultValue: '1000' }
 
 CompanyCode,
 Ledger,
 AccountingDocument,
 @Consumption.hidden : true
 @EndUserText.label: 'GL Hierarchy'
 $parameters.GLHierarchy as GLHierarchy_param,
 ChartOfAccounts
  
}
 where 
 ( 
	GLAccount	=	'0000610010' or 
	GLAccount	=	'0000610040' or 
	GLAccount	=	'0000610030' or 
	GLAccount	=	'0000610050' or 
	GLAccount	=	'0000610060'
 ) 

 and 
 ( 
	Ledger	=	'0L'
 ) 

 and 
 ( 
	ChartOfAccounts	=	'1000'
 )                       
