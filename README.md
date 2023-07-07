## Description
An architecture design of a payment processing application . That will be hosted on a cloud Infrastructure of choice between AWS or Azure . 

### Basic Flow of the App
1.	Online merchant shop sends request to gateway with credit card, client and purchase data. 
2.	Gateway validates request that was received from the merchant 
3.	Gateway applies additional tests to prevent fraud attempts, that are provided by external references and sends request to bank.
4.	After receiving response from the bank, gateway system returns response to the client. 
5.  While logging in 


### Transaction processing requirements
1.	Purchasing of the items from online shop, 
2.	Cancelation of purchase (this operation is executed in case that end user decided to cancel purchase prior to shipping) 
3.	Risk validation of end user (validation of credibility of end user in order to prevent fraud attempts)



## Latest Architecture Design 
https://www.figma.com/file/dvujQEeSVfrhawk4Ge2yyJ/Untitled?node-id=0%3A1&mode=devgit