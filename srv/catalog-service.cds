using {multitent_cap_depentency.db as db} from '../db/data-model';

using {CV_SALES, CV_SESSION_INFO} from '../db/data-model';

using { API_SALES_ORDER_SRV } from './external/API_SALES_ORDER_SRV.csn';











service CatalogService @(path : '/catalog')
@(requires: 'authenticated-user')
{
    entity Sales
      as select * from db.Sales
      actions {
        function largestOrder() returns String;
        action boost();
      }
    ;

    @readonly
    entity VSales
      as select * from CV_SALES
    ;

    @readonly
    entity SessionInfo
      as select * from CV_SESSION_INFO
    ;

    function topSales
      (amount: Integer)
      returns many Sales;

    @readonly
    entity SalesOrders
      as projection on API_SALES_ORDER_SRV.A_SalesOrder {
          SalesOrder,
          SalesOrganization,
          DistributionChannel,
          SoldToParty,
          IncotermsLocation1,
          TotalNetAmount,
          TransactionCurrency
        };












    type userScopes { identified: Boolean; authenticated: Boolean; ExtendCDS: Boolean; ExtendCDSdelete: Boolean;};
    type user { user: String; locale: String; tenant: String; scopes: userScopes; };
    function userInfo() returns user;
};
