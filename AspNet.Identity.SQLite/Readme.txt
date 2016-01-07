This project is based on the MySQL ASP .NET Identity provider at http://www.asp.net/identity/overview/extensibility/implementing-a-custom-mysql-aspnet-identity-storage-provider 

Steps to run project

- Clone repo and open project in VS with Update 2 installed
- Build project to restore packages and build project
- In the solution, add a new one ASP.NET project with MVC and Individual Authentication
- Uninstall Microsoft.AspNet.Identity.EntityFramework package from the web application
- Update connection string to use the MySQL database as needed
- In the IdentityModel.cs, let ApplicationUser class extend from IdentityUser in AspNet.Identity.MySQL
- ApplicationDbContext extend from MySqlDatabase and the contructor take a single parameter with the connectionstring name
- In the ApplicationUserManager.Create method, replace instantiating UserManager as shown below

	var manager = new ApplicationUserManager(new UserStore<ApplicationUser>(context.Get<ApplicationDbContext>() as MySQLDatabase));

- If any properties are added to the ApplicationUser class, then update the Insert, GetUserByName, GetUserById and Update methods in AspNet.Identity.MySQL project