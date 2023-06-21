@EndUserText.label: 'Projection View for ZUM_I_BOOKING'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Search.searchable: true
@Metadata.allowExtensions: true
define view entity ZUM_C_BOOKING as projection on ZUM_I_BOOKING
{   
    @Search.defaultSearchElement: true
    key TravelId,
    @Search.defaultSearchElement: true
    key BookingId,
    BookingDate,
    @Consumption.valueHelpDefinition: [{ entity: { name: '/DMO/I_CUSTOMER', element: 'CustomerID' } }]
    CustomerId,
    @Consumption.valueHelpDefinition: [{ entity: { name: '/DMO/I_Carrier', element: 'AirlineID' } }]
    CarrierId,
    @Consumption.valueHelpDefinition: [{ entity: { name: '/DMO/I_Flight', element: 'ConnectionID' },
                                         additionalBinding: [{ localElement: 'FlightDate', element: 'FlightDate', usage: #RESULT },
                                                             { localElement: 'CarrierId', element: 'AirlineID', usage: #RESULT },
                                                             { localElement: 'FlightPrice', element: 'Price', usage: #RESULT },
                                                             { localElement: 'CurrencyCode', element: 'CurrencyCode', usage: #RESULT }] }]
    ConnectionId,
    FlightDate,
    FlightPrice,
    @Consumption.valueHelpDefinition: [{ entity: { name: 'I_Currency', element: 'Currency' } }]
    CurrencyCode,
    /* Associations */
    _Carrier,
    _Connection,
    _Customer,
    _Flight,
    _Travel : redirected to parent ZUM_C_TRAVEL
}
