CREATE TABLE `roles` (
	`Id`	TEXT NOT NULL,
	`Name`	TEXT NOT NULL,
	PRIMARY KEY(Id)
);

CREATE TABLE `users` (
	`Id`	TEXT NOT NULL,
	`Email`	TEXT,
	`EmailConfirmed`	INTEGER NOT NULL,
	`PasswordHash`	TEXT,
	`SecurityStamp`	TEXT,
	`PhoneNumber`	TEXT,
	`PhoneNumberConfirmed`	INTEGER NOT NULL,
	`TwoFactorEnabled`	INTEGER NOT NULL,
	`LockoutEndDateUtc`	TEXT,
	`LockoutEnabled`	INTEGER NOT NULL,
	`AccessFailedCount`	INTEGER NOT NULL,
	`UserName`	TEXT NOT NULL,
	PRIMARY KEY(Id)
);

CREATE TABLE `userclaims` (
	`Id`	INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT UNIQUE,
	`UserId`	TEXT NOT NULL,
	`ClaimType`	TEXT,
	`ClaimValue`	TEXT,
	FOREIGN KEY(UserId) REFERENCES users(Id)
);

CREATE TABLE `userlogins` (
  `LoginProvider` TEXT NOT NULL,
  `ProviderKey` TEXT NOT NULL,
  `UserId` TEXT NOT NULL,
  PRIMARY KEY (LoginProvider,ProviderKey,UserId),
  FOREIGN KEY(UserId) REFERENCES users(Id)
);

CREATE TABLE `userroles` (
  `UserId` TEXT NOT NULL,
  `RoleId` TEXT NOT NULL,
  PRIMARY KEY (UserId,RoleId),
  FOREIGN KEY(UserId) REFERENCES users(Id)
  FOREIGN KEY(RoleId) REFERENCES roles(Id)  
);
