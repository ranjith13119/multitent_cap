# multitent_cap_depentency - multitenant_cap_btp
> SAP BTP Multitent

# To Create a extend App:
- cds extend <route-url-from-the-consumer>/extend -s <space> -d <folter> 
  - route-url-from-the-consumer --> `cds extend https://b749bb60trial-qa-multitenant-btp-srv.cfapps.us10.hana.ondemand.com/extend -s b749bb60trial -d b749bb60trial`
- Fetching the passcode to access the consumer `https://b749bb60trial.authentication.cfapps.us10.hana.ondemand.com/passcode`
- Activating extensions --> `cds activate <folter> -s <space>`
  - Ex: `cds activate b749bb60trial -s b749bb60trial`
 
# To activate the above extension changes to the different consumer:
  - `cds activate <folter> -s <space> --to <route-url-from-the-consumer>/extend`
     - Ex: `cds activate b749bb60trial -s b749bb60trial --to https://b749bb60trialC1-qa-multitenant-btp-srv.cfapps.us10.hana.ondemand.com/extend`
