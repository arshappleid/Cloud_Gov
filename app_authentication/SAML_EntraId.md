Overview of the SAML protocol 

![architectural diagram for SAML](https://learn.microsoft.com/en-us/entra/architecture/media/authentication-patterns/saml-auth.png)

### 1. Register an application in Microsoft Entra ID Console 

1. In the microsoft azure portal. 
2. Create new application under ```+Add > Enterprise Application```
3. ```Create your own application > My-Test-Saml-App (Integrate any other application ...)``` Configure name for your application in the IDP Dashboard. 
4. Setup SAML Based Single Sign on by uploading SAML Certificate From Application. 
   1. Obtain the XML Based Certificate, and upload it with ```Upload metadata file``` . 
      1. Sample Metadata File available at [here](https://sptest.iamshowcase.com/instructions#start)
   2. Upload the certificate from the IDP (Entra ID) to the app and have the app consume the certificate. 
      1. This step is crucial for establishing trust between the application and the IDP.
      2. Setup users and groups under ```Users and Groups``` . 
         1. This requires a <u>join and sync</u> with on prem or cloud Active Directory Domain.
      3. The certificate should be available under ```Manage > Single Sign-on > Saml Certificates > Federation MetaData XML``` . **Only after users an roles for the application have been assigned.**
      4. At this point the app should be available to sign on, by redirecting to the FQDN of the application. 
   3. To ensure **SAML assertions are encrypted**, you **must include the service provider's public encryption certificate** in the **SAML metadata file**.
   4. Client Attributes can now be consumed from the SAML certificate returned by the IDP, which can be identified through the [SAML-tracer Chrome Extension](https://chromewebstore.google.com/detail/mpdajninpobndbfcldcmbpnnbhibjmch?utm_source=item-share-cb).
      1. Each application will require a SAML Based library to consume these. 
      2. Backend Application can be 
   5.  

### Deleting the Entra ID Instance 

```bash
az ad sp delete --id <objectId>
```



