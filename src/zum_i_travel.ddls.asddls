@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CDS view for /DMO/TRAVEL table'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define root view entity ZUM_I_TRAVEL as select from /dmo/travel

composition [0..*] of ZUM_I_BOOKING    as _Booking

association [0..1] to /DMO/I_Agency    as _Agency   on $projection.AgencyId     = _Agency.AgencyID

association [0..1] to /DMO/I_Customer  as _Customer on $projection.CustomerId   = _Customer.CustomerID

association [0..1] to I_Currency       as _Currency on $projection.CurrencyCode = _Currency.Currency
{
    key travel_id as TravelId,
    agency_id as AgencyId,
    customer_id as CustomerId,
    begin_date as BeginDate,
    end_date as EndDate,
    @Semantics.amount.currencyCode: 'CurrencyCode'
    booking_fee as BookingFee,
    @Semantics.amount.currencyCode: 'CurrencyCode'
    total_price as TotalPrice,
    currency_code as CurrencyCode,
    description as Description,
    status as Status,
    @Semantics.user.createdBy: true
    createdby as CreatedBy,
    @Semantics.systemDateTime.createdAt: true
    createdat as CreatedAt,
    @Semantics.user.lastChangedBy: true
    lastchangedby as LastChangedBy,
    @Semantics.systemDateTime.lastChangedAt: true
    lastchangedat as LastChangedAt,
    
    _Booking,
    _Agency,
    _Customer,
    _Currency
}
