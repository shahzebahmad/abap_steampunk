@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CDS view for /DMO/BOOKING table'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZUM_I_BOOKING as select from /dmo/booking

association to parent ZUM_I_TRAVEL      as _Travel     on $projection.TravelId  = _Travel.TravelId

association [1..1] to /DMO/I_Carrier    as _Carrier    on $projection.CarrierId = _Carrier.AirlineID

association [1..1] to /DMO/I_Customer   as _Customer   on $projection.CustomerId = _Customer.CustomerID

association [1..1] to /DMO/I_Connection as _Connection on $projection.CarrierId = _Connection.AirlineID
                                                      and $projection.ConnectionId = _Connection.ConnectionID
                                                      
association [1..1] to /DMO/I_Flight     as _Flight     on $projection.CarrierId = _Flight.AirlineID
                                                      and $projection.ConnectionId = _Flight.ConnectionID
                                                      and $projection.FlightDate   = _Flight.FlightDate

{
    key travel_id as TravelId,
    key booking_id as BookingId,
    booking_date as BookingDate,
    customer_id as CustomerId,
    carrier_id as CarrierId,
    connection_id as ConnectionId,
    flight_date as FlightDate,
    @Semantics.amount.currencyCode: 'CurrencyCode'
    flight_price as FlightPrice,
    currency_code as CurrencyCode,
    
    _Carrier,
    _Customer,
    _Connection,
    _Flight,
    _Travel
}
