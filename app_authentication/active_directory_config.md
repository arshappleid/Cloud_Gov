## Integrating Active Directory User Database for Authentication.

### Why Use Active Directory ?

Some organizations already maintain a database of their Users and Groups for their other applications, and would like to make use of a pre-populated database and provide access to certain applications based on pre configured users and groups. 

Applications make use of the LDAP protocol, to look up users and their information from Active Directory Databases. 

### Over view of How to Configure Active Directory to work with a .NET Application.

#### 1. Configure Active Directory (AD):

1. Set up an Active Directory domain controller and domain.

2. Create user accounts and groups within Active Directory.

#### 2. Configure your web application:

1. In your web application, open the web.config file.

Add the necessary settings for Active Directory authentication, such as the connection string and authentication mode.

2. Specify the Active Directory domain details, such as the domain name, LDAP path, and domain controller.

#### 3. Implement Active Directory authentication:

1. In your application's login page or authentication logic, use the System.DirectoryServices namespace to authenticate users against Active Directory.

2. Connect to Active Directory using the LDAP protocol and perform user authentication based on the provided credentials.

3. Verify the user's credentials and authorize access based on Active Directory group membership or other criteria.

#### 4. Handle user sessions and authorization:

1. Once a user is authenticated, create a session or use a token-based authentication mechanism to manage subsequent requests from the authenticated user.

2. Use Active Directory groups or other attributes to control access to different parts of your web application.

3. Implement authorization logic to determine what actions or resources a user can access based on their Active Directory group membership or other criteria.
