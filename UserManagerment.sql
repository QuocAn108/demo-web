CREATE DATABASE UserManagement

GO

Use UserManagement
Create table tblUsers (
 UserID nvarchar(25) primary key,
 FullName nvarchar(50),
 RoleID nvarchar(50),
 Password nvarchar(50)
);

Insert into tblUsers(UserID,FullName,RoleID,Password)
Values ('bao','Ngo bao','AD',1);
Insert into tblUsers(UserID,FullName,RoleID,Password)
Values ('Hao','Dang','US',1234);
Insert into tblUsers(UserID,FullName,RoleID,Password)
Values ('Gia','Gia Bao','AD',1);
Insert into tblUsers(UserID,FullName,RoleID,Password)
Values ('Tri','Minh Tri','US',1);
Insert into tblUsers(UserID,FullName,RoleID,Password)
Values ('Nam','Nhat Nam','US',1);
Insert into tblUsers(UserID,FullName,RoleID,Password)
Values ('Quoc','Quoc Bao','US',1);
Insert into tblUsers(UserID,FullName,RoleID,Password)
Values ('Vũ','Vu Bao','US',1);
Insert into tblUsers(UserID,FullName,RoleID,Password)
Values ('Nhat','Nhat Nam','US',1);
Insert into tblUsers(UserID,FullName,RoleID,Password)
Values ('Hoa','Anh Hoa','US',1);